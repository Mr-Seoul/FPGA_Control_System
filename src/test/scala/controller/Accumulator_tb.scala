package controller

import chisel3._
import chisel3.util._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import testSuite._

class Accumulator_tb extends AnyFlatSpec with ChiselScalatestTester {
  val minSize = 2
  val maxSize = 16
  val maxTimeout = 2*maxSize*nTests

  it should "output the total value" in {
    val sizes = randNums(minSize, maxSize, nTests)
    val minVal = -pow2(config.width - 1)
    val maxVal = pow2(config.width - 1) - 1

    for (size <- sizes) {
      val inputSeq = Seq(
        List.fill(size)(0),
        List.fill(size)(minVal),
        List.fill(size)(maxVal),
        List.fill(size)(randNum(minVal+1,-1)),
        List.fill(size)(randNum(1,maxVal-1)),
      )

      for (input <- inputSeq) {
        test(new Accumulator(size)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
          resetDUT(dut, maxTimeout)
          var tot = 0
          for (i <- input) {
            dut.io.next.poke(i.S)
            tot += i
            dut.clock.step()
          }
          dut.io.tot.expect(tot.S)
        }
      }
    }
  }

  it should "clear when clear is asserted" in {
    val sizes = randNums(minSize, maxSize, nTests)
    val minVal = -pow2(config.width - 1)
    val maxVal = pow2(config.width - 1) - 1

    for (size <- sizes) {
      val inputSeq = Seq(
        List.fill(size)(0),
        List.fill(size)(minVal),
        List.fill(size)(maxVal),
        List.fill(size)(randNum(minVal+1,-1)),
        List.fill(size)(randNum(1,maxVal-1)),
      )

      for (input <- inputSeq) {
        test(new Accumulator(size)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
          resetDUT(dut, maxTimeout)
          for (i <- input) {
            dut.io.next.poke(i.S)
            dut.clock.step()
          }
          dut.io.clear.poke(1.B)
          dut.io.next.poke(0.S)
          dut.clock.step()
          dut.io.clear.poke(0.B)
          dut.clock.step()
          dut.io.tot.expect(0.S)
        }
      }
    }
  }
}
