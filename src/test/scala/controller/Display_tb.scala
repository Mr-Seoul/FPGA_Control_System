package controller

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import testSuite._

class Display_tb extends AnyFlatSpec with ChiselScalatestTester {
  val maxTimeout = 1000
  val size = 5
  val minClamp = 0
  val maxClamp = 99
  val minVal = -128
  val maxVal = 127

  val minPeriod = 4
  val maxPeriod = 16

  def waitForWrap(dut : Display): Unit = {
    while (!dut.io.modeWrapped.peek().litToBoolean) {
      dut.clock.step()
    }
    dut.clock.step()
  }

  it should "show Current temp" in {
    val modePeriods = randNums(minPeriod, maxPeriod, nTests)

    for (modePeriod <- modePeriods) {

      val inputSeq = Seq(
        List.fill(1)(minClamp),
        List.fill(1)(maxClamp),
        List.fill(size)(randNum(minClamp+1,maxClamp-1)),
      )

      for (input <- inputSeq) {
        test(new Display(modePeriod, 1, 1)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
          resetDUT(dut, maxTimeout)
          for (i <- input) {
            dut.io.currentTemp.poke((i << config.decimalWidth).S)
            waitForWrap(dut)
            dut.io.asciiOut.expect((i % 10).U)
            dut.clock.step()
            dut.io.asciiOut.expect((i / 10).U)
            dut.clock.step()
            dut.io.asciiOut.expect('='.U)
            dut.clock.step()
            dut.io.asciiOut.expect('C'.U)
            dut.clock.step()
          }
        }
      }
    }
  }

  it should "show Target temp" in {
    val modePeriods = randNums(minPeriod, maxPeriod, nTests)

    for (modePeriod <- modePeriods) {

      val inputSeq = Seq(
        List.fill(1)(minClamp),
        List.fill(1)(maxClamp),
        List.fill(size)(randNum(minClamp+1,maxClamp-1)),
      )

      for (input <- inputSeq) {
        test(new Display(modePeriod, 1, 1)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
          resetDUT(dut, maxTimeout)
            for (i <- input) {
            dut.io.targetTemp.poke((i << config.decimalWidth).S)
            waitForWrap(dut)
            dut.clock.step(modePeriod)
            dut.io.asciiOut.expect((i % 10).U)
            dut.clock.step()
            dut.io.asciiOut.expect((i / 10).U)
            dut.clock.step()
            dut.io.asciiOut.expect('='.U)
            dut.clock.step()
            dut.io.asciiOut.expect('T'.U)
            dut.clock.step()
          }
        }
      }
    }
  }

  it should "show enable status" in {
    val modePeriods = randNums(minPeriod, maxPeriod, nTests)

    for (modePeriod <- modePeriods) {

      val inputSeq = Seq(
        false,
        true,
      )

      test(new Display(modePeriod, 1, 1)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
        resetDUT(dut, maxTimeout)
          for (enabled <- inputSeq) {
          dut.io.enable.poke(enabled.B)
          waitForWrap(dut)
          dut.clock.step(2*modePeriod)
          dut.io.asciiOut.expect((if (enabled) 'E' else 'O').U)
          dut.clock.step()
          dut.io.asciiOut.expect((if (enabled) 'Y' else 'N').U)
          dut.clock.step()
          dut.io.asciiOut.expect('='.U)
          dut.clock.step()
          dut.io.asciiOut.expect('E'.U)
          dut.clock.step()
        }
      }
    }
  }

  it should "blink current temperature when too small or large to display" in {
    val modePeriods = randNums(minPeriod, maxPeriod, nTests)

    for (modePeriod <- modePeriods) {

      val inputSeq = Seq(
        List.fill(1)(minClamp),
        List.fill(1)(maxClamp),
        List.fill(size)(randNum(minClamp+1,maxClamp-1)),
        List.fill(size)(minVal),
        List.fill(size)(maxVal),
        List.fill(size)(randNum(minVal+1,minClamp-1)),
        List.fill(size)(randNum(maxClamp+1,maxVal-1)),
      )

      for (input <- inputSeq) {
        test(new Display(modePeriod, 1, 2)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
          resetDUT(dut, maxTimeout)
          for (i <- input) {
            dut.io.currentTemp.poke((i << config.decimalWidth).S)
            val inRange = (i >= minClamp & i <= maxClamp)
            val clampedVal = clamp(i, minClamp, maxClamp)
            waitForWrap(dut)

            dut.io.asciiOut.expect((if (inRange) (i % 10) else clampedVal % 10).U)
            dut.clock.step()
            dut.io.asciiOut.expect((if (inRange) (i % 10) else ' ').U)
            dut.clock.step()
            dut.io.asciiOut.expect((if (inRange) (i / 10) else clampedVal / 10).U)
            dut.clock.step()
            dut.io.asciiOut.expect((if (inRange) (i / 10) else ' ').U)
          }
        }
      }
    }
  }

  it should "blink target temperature when too small or large to display" in {
    val modePeriods = randNums(minPeriod, maxPeriod, nTests)

    for (modePeriod <- modePeriods) {

      val inputSeq = Seq(
        List.fill(1)(minClamp),
        List.fill(1)(maxClamp),
        List.fill(size)(randNum(minClamp+1,maxClamp-1)),
        List.fill(size)(minVal),
        List.fill(size)(maxVal),
        List.fill(size)(randNum(minVal+1,minClamp-1)),
        List.fill(size)(randNum(maxClamp+1,maxVal-1)),
      )

      for (input <- inputSeq) {
        test(new Display(modePeriod, 1, 2)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
          resetDUT(dut, maxTimeout)
          for (i <- input) {
            dut.io.targetTemp.poke((i << config.decimalWidth).S)
            val inRange = (i >= minClamp & i <= maxClamp)
            val clampedVal = clamp(i, minClamp, maxClamp)
            waitForWrap(dut)
            dut.clock.step(modePeriod)

            dut.io.asciiOut.expect((if (inRange) (i % 10) else clampedVal % 10).U)
            dut.clock.step()
            dut.io.asciiOut.expect((if (inRange) (i % 10) else ' ').U)
            dut.clock.step()
            dut.io.asciiOut.expect((if (inRange) (i / 10) else clampedVal / 10).U)
            dut.clock.step()
            dut.io.asciiOut.expect((if (inRange) (i / 10) else ' ').U)
          }
        }
      }
    }
  }
}




