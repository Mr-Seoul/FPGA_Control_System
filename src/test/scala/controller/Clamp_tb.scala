package controller

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import testSuite._

class Clamp_tb extends AnyFlatSpec with ChiselScalatestTester {
  val maxTimeout = 2*nTests
  val nIterations = 5

  def clamp(valueOf: Int, min: Int, max: Int): Int = {
    if (valueOf < min) min
    else if (valueOf > max) max
    else valueOf
  }

  it should "Clamp input" in {
    val minClamp = 0
    val maxClamp = 99

    val minVal = -pow2(config.width - 1)
    val maxVal = pow2(config.width - 1) - 1

    val inputSeq = Seq(
      List.fill(1)(minClamp),
      List.fill(nIterations)(randNum(minClamp + 1,maxClamp - 1)),
      List.fill(1)(maxClamp),
      List.fill(nIterations)(randNum(minVal,minClamp - 1)),
      List.fill(nIterations)(randNum(maxClamp + 1,maxVal)),
    )

    for (input <- inputSeq) {
      test(new Clamp(minClamp, maxClamp)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
        resetDUT(dut, maxTimeout)

        for (i <- input) {
           dut.io.in.poke(i.S)
           dut.clock.step()
           dut.io.clampedValue.expect(clamp(i,minClamp,maxClamp).S)
        }
      }
    }
  }

  it should "assert isClamped when clamping" in {
    val minClamp = 0
    val maxClamp = 99

    val minVal = -pow2(config.width - 1)
    val maxVal = pow2(config.width - 1) - 1

    val inputSeq = Seq(
      List.fill(nTests)(minClamp),
      List.fill(nTests)(randNum(minClamp + 1,maxClamp - 1)),
      List.fill(nTests)(maxClamp),
      List.fill(nTests)(randNum(minVal,minClamp - 1)),
      List.fill(nTests)(randNum(maxClamp + 1,maxVal)),
    )

    for (input <- inputSeq) {
      test(new Clamp(minClamp, maxClamp)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
        resetDUT(dut, maxTimeout)

        for (i <- input) {
          dut.io.in.poke(i.S)
          dut.clock.step()
          dut.io.isClamped.expect((i < minClamp || i > maxClamp).B)
        }
      }
    }
  }
}




