package controller

import chisel3._
import chisel3.experimental.FixedPoint
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import testSuite._

import java.io.File
import scala.io.Source

class Controller_tb extends AnyFlatSpec with ChiselScalatestTester {
  val packetSize = 5*config.fixedWidth
  val syncDelay = 6
  val samplingPeriod    = 8
  val smootheningPeriod = 4
  val conversionCycles  = config.ADCWidth*(samplingPeriod + 1) + 1
  val blinkPeriod       = 2*smootheningPeriod*conversionCycles
  val errorPeriod       = 3

  val lookupTable = loadLookupTable()
  val transceiveCycles = 4*packetSize*syncDelay
  val updatePeriod     = transceiveCycles
  val maxTimeout       = (errorPeriod + 1)*updatePeriod + 5000

  def loadLookupTable(): List[BigInt] = {
    val file = new File("ADCDesign/lookup.hex")
    require(file.exists(), s"Error: No file at ${file.getAbsolutePath}")
    Source.fromFile(file).getLines().toList.map { line =>
      val raw = BigInt(line.trim, 16)
      if (raw.testBit(config.fixedWidth - 1)) {
        raw - (BigInt(1) << config.fixedWidth)
      } else {
        raw
      }
    }
  }

  def RawToDouble(raw: BigInt): Double = {
      return raw.toDouble / math.pow(2, config.decimalWidth)
  }

  def toFixedRaw(value: Double): BigInt = {
    return value.F(config.fixedWidth.W, config.decimalWidth.BP).litValue
  }

  def toSigned32(raw: BigInt): BigInt = {
    if (raw.testBit(config.fixedWidth - 1)) {
      return raw - (BigInt(1) << config.fixedWidth)
    } else {
      return raw
    }
  }

  def subField(frame: BigInt, idx: Int): BigInt = {
    //The 4 is hardcoded because the frame is 5 fields (0-4)
    return toSigned32((frame >> ((4 - idx)*config.fixedWidth)) & ((BigInt(1) << config.fixedWidth) - 1))
  }

  def expectField(actual: BigInt, expected: Double, msg: String): Unit = {
    val expectedRaw = toFixedRaw(expected)
    assert((actual - expectedRaw).abs <= 8, s"$msg: expected=$expected (raw=$expectedRaw) actual raw=$actual")
  }

  def quantize(value: Double): Double = {
    return toFixedRaw(value).toDouble / (1L << config.decimalWidth)
  }

  def holdADC(dut: Controller, code: BigInt, cycles: Int): Unit = {
    for (i <- 0 until cycles) {
      dut.io.ADCIn.poke((code > dut.io.DACOut.peekInt()).B)
      dut.clock.step()
    }
  }

  def initSPI(dut: Controller, code: BigInt): Unit = {
    dut.io.csN.poke(1.B)
    dut.io.sck.poke(0.B)
    dut.io.mosi.poke(0.B)
    holdADC(dut, code, syncDelay)
  }

  def spiTransceive(dut: Controller, code: BigInt, mosi: BigInt, bits: Int): BigInt = {
    dut.io.csN.poke(0.B)
    holdADC(dut, code, syncDelay)

    var miso = BigInt(0)
    for (i <- bits - 1 to 0 by -1) {
      dut.io.mosi.poke(((mosi >> i) & 1).B)
      holdADC(dut, code, syncDelay)
      dut.io.sck.poke(1.B)
      holdADC(dut, code, syncDelay)
      miso = (miso << 1) | (if (dut.io.miso.peekBoolean()) BigInt(1) else BigInt(0))
      dut.io.sck.poke(0.B)
      holdADC(dut, code, syncDelay)
    }

    dut.io.csN.poke(1.B)
    holdADC(dut, code, syncDelay)
    return miso
  }

  it should "read currently temperature" in {
    val lookupTable = loadLookupTable()
    val targetCycle= blinkPeriod + conversionCycles

    val codes = Seq(
      List.fill(1)(0),
      List.fill(1)(255),
      List.fill(1)(randNum(1, 254))
    )

    for (codeList <- codes) {
      for (code <- codeList) {
        test(new Controller(
          samplingPeriod    = samplingPeriod,
          smootheningPeriod = smootheningPeriod,
          blinkPeriod       = blinkPeriod,
          modePeriod        = 50,
          multiplexPeriod   = 10,
          errorPeriod       = 2,
          updatePeriod      = 4*blinkPeriod,
        )).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
          resetDUT(dut, maxTimeout)
          initSPI(dut, code)

          holdADC(dut, code, targetCycle)
          val frame = spiTransceive(dut, code, 0, packetSize)

          expectField(subField(frame, 0),RawToDouble(lookupTable(code)),s"code ($code)")
        }
      }
    }
  }

  it should "export P,I,D through SPI" in {
    //Central values chosen to avoid overflows as overflows are tested in the PID_tb.scala
    val codes = Seq(
      List.fill(nTests)(randNum(100, 150))
    )

    val setPoints = Seq(
      List.fill(nTests)(randNum(10, 25))
    )

    for (codeList <- codes) {
      for (code <- codeList) {
        for (setPointList <- setPoints) {
          for (setPoint <- setPointList) {
            test(new Controller(
              samplingPeriod = samplingPeriod,
              smootheningPeriod = smootheningPeriod,
              blinkPeriod = blinkPeriod,
              modePeriod = 50,
              multiplexPeriod = 10,
              errorPeriod = errorPeriod,
              updatePeriod = updatePeriod,
            )).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
              resetDUT(dut, maxTimeout)
              initSPI(dut, code)

              val curTemp = RawToDouble(lookupTable(code))
              val e = curTemp - setPoint

              //These fields are hardcoded as in the SPI Module (decided by the spec to interact with a potential MCU)
              val setPointRaw = toFixedRaw(setPoint) & ((BigInt(1) << 32) - 1)
              val frame = (setPointRaw << 128) | (BigInt(1) << 96)

              spiTransceive(dut, code, frame, packetSize)

              val qP = quantize(config.P)
              val qI = quantize(config.I)
              val qD = quantize(config.D)
              var curFrame = spiTransceive(dut, code, frame, packetSize)

              //UpdatePeriod chosen so after this frame, Ieffort still is equal to zero
              expectField(subField(curFrame, 0), curTemp, "temperature")
              expectField(subField(curFrame, 1), qP*e, "pEffort")
              expectField(subField(curFrame, 2), 0.0, "iEffort")
              expectField(subField(curFrame, 3), qD*e, "dEffort")

              val curCycle = 2*transceiveCycles
              val targetCycle = errorPeriod*updatePeriod + updatePeriod / 2
              holdADC(dut, code, targetCycle - curCycle)

              curFrame = spiTransceive(dut, code, frame, packetSize)
              val expectedTot = clampDouble(qP*e + qI*errorPeriod*e, config.minPWM, config.maxPWM)

              //After these cycles, the error accumulator is full and due to constant error, the Ieffort is equal to errorPeriod*e.
              //Due to constant error, the Deffort is equal to zero.
              expectField(subField(curFrame, 1), qP*e, "pEffort")
              expectField(subField(curFrame, 2), qI*errorPeriod*e, "iEffort")
              expectField(subField(curFrame, 3), 0.0, "dEffort")
              expectField(subField(curFrame, 4), expectedTot, "totEffort")
            }
          }
        }
      }
    }
  }
}
