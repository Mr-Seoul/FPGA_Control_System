package controller

import chisel3._
import chisel3.util._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import testSuite._

class SAccumulator_tb extends AnyFlatSpec with ChiselScalatestTester {
  val minSize = 2
  val maxSize = 10
  val maxTimeout = 2*maxSize*nTests

  val minVal = -pow2(config.width-1)
  val maxVal = pow2(config.width-1) - 1

  it should "output the total value" in {
    val sizes = randNums(minSize, maxSize, nTests)

    for (size <- sizes) {
      val inputSeq = Seq(
        List.fill(size)(0),
        List.fill(size)(minVal),
        List.fill(size)(maxVal),
        List.fill(size)(randNum(minVal+1,-1)),
        List.fill(size)(randNum(1,maxVal-1)),
      )

      for (input <- inputSeq) {
        test(new SAccumulator(size, config.width)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
          resetDUT(dut, maxTimeout)
          var tot = 0
          for (i <- input) {
            dut.io.in.poke(i.S)
            tot += i
            dut.clock.step()
          }
          dut.io.out.expect(tot.S)
        }
      }
    }
  }

  it should "clear when clear is asserted" in {
    val sizes = randNums(minSize, maxSize, nTests)

    for (size <- sizes) {
      val inputSeq = Seq(
        List.fill(size)(0),
        List.fill(size)(minVal),
        List.fill(size)(maxVal),
        List.fill(size)(randNum(minVal+1,-1)),
        List.fill(size)(randNum(1,maxVal-1)),
      )

      for (input <- inputSeq) {
        test(new SAccumulator(size, config.width)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
          resetDUT(dut, maxTimeout)
          for (i <- input) {
            dut.io.in.poke(i.S)
            dut.clock.step()
          }
          dut.io.clear.poke(1.B)
          dut.io.in.poke(0.S)
          dut.clock.step()
          dut.io.clear.poke(0.B)
          dut.clock.step()
          dut.io.out.expect(0.S)
        }
      }
    }
  }

  it should "output valid after accumulator is full" in {
    val sizes = randNums(minSize, maxSize, nTests)

    for (size <- sizes) {
      val inputSeq = Seq(
        List.fill(size)(0),
        List.fill(size)(minVal),
        List.fill(size)(maxVal),
        List.fill(size)(randNum(minVal+1,-1)),
        List.fill(size)(randNum(1,maxVal-1)),
      )

      for (input <- inputSeq) {
        test(new SAccumulator(size, config.width)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
          resetDUT(dut, maxTimeout)
          var n = 0
          for (i <- input) {
            dut.io.in.poke(i.S)
            n += 1
            dut.io.valid.expect((n >= size).B)
            dut.clock.step()
          }
          for (i <- 0 until size) {
            dut.io.valid.expect(1.B)
            dut.clock.step()
          }
        }
      }
    }
  }
}
