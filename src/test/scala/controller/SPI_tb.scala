package controller

import chisel3._
import chisel3.util._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import testSuite._

class SPI_tb extends AnyFlatSpec with ChiselScalatestTester {
  val minSize = 2
  val maxSize = 10
  val maxTimeout = 2*maxSize*nTests

  val minVal = -pow2(config.width)
  val maxVal = pow2(config.width-1) - 1

  it should "transmit data (miso)" in {
    val inputSeq = Seq(
      List.fill(5)(0),
      List.fill(5)(minVal),
      List.fill(5)(maxVal),
      List.fill(5)(randNum(minVal+1,-1)),
      List.fill(5)(randNum(1,maxVal-1)),
    )

    test(new SPI).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      resetDUT(dut, maxTimeout)
      dut.io.csN.poke(1.B)
      dut.io.sck.poke(0.B)
      dut.clock.step()

      for (input <- inputSeq) {
        dut.io.data.temperature.poke(input(0).S)
        dut.io.data.pEffort.poke(input(1).S)
        dut.io.data.iEffort.poke(input(2).S)
        dut.io.data.dEffort.poke(input(3).S)
        dut.io.data.totEffort.poke(input(4).S)
        dut.io.csN.poke(0.B)
        dut.clock.step()

        var expected = BigInt(0)
        for (i <- 0 until 5) {
          expected = (expected << 32) | BigInt(input(i)) & 0xFFFFFFFFL
        }

        for (i <- 0 until 160) {
          dut.io.sck.poke(1.B)
          dut.clock.step()
          dut.io.miso.expect((expected >> (159-i) & 1).U)
          dut.io.sck.poke(0.B)
          dut.clock.step()
        }
        dut.io.csN.poke(1.B)
        dut.clock.step()
      }
    }
  }

  it should "receive data (mosi)" in {

    def spiTransfer(dut: SPI, mosi: BigInt, bits: Int): Unit = {
      for (i <- bits - 1 to 0 by -1) {
        dut.io.mosi.poke(((mosi >> i) & 1).B)
        dut.clock.step()
        dut.io.sck.poke(1.B)
        dut.clock.step()
        dut.io.sck.poke(0.B)
        dut.clock.step()
      }
    }

    val inputSeq = Seq(
      0,
      minVal,
      maxVal,
      randNum(minVal+1,-1),
      randNum(1,maxVal-1),
    )

    test(new SPI).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      resetDUT(dut, maxTimeout)

      dut.io.csN.poke(1.B)
      dut.io.sck.poke(0.B)
      dut.io.mosi.poke(0.B)
      dut.clock.step()

      dut.io.csN.poke(0.B)
      dut.clock.step()

      for (enable <- Seq(0,1)) {
        for (setTemp <- inputSeq) {
          val frame = (BigInt(setTemp) << 128) | (BigInt(enable) << 96)
          spiTransfer(dut, frame, 160)

          dut.io.csN.poke(1.B)
          dut.clock.step()

          dut.io.data.setPoint.expect(setTemp.S(32.W))
          dut.io.data.enable.expect(enable.B)

          dut.clock.step()
          dut.io.csN.poke(0.B)
          dut.clock.step()
        }
      }
    }
  }
}
