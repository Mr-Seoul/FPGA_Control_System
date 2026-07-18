package controller

import chisel3._
import chisel3.util._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import testSuite._

class Accumulator_tb extends AnyFlatSpec with ChiselScalatestTester {
  val minSize = 2
  val maxSize = 10
  val maxTimeout = 2*maxSize*nTests

  val maxVal = pow2(config.width) - 1

  it should "output the total value" in {
    val updatePeriods = randNums(minSize,maxSize,nTests)
    val sizes = randNums(minSize, maxSize, nTests)

    for (size <- sizes) {
      val inputSeq = Seq(
        List.fill(size)(0),
        List.fill(size)(maxVal),
        List.fill(size)(randNum(1,maxVal-1)),
      )
      for (updatePeriod <- updatePeriods) {
        for (input <- inputSeq) {
          test(new Accumulator(size, config.width)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
            resetDUT(dut, maxTimeout)
            var tot = 0
            for (i <- input) {
              dut.io.update.poke(1.B)
              dut.io.in.poke(i.U)
              dut.clock.step()
              dut.io.update.poke(0.B)
              tot += i
              dut.clock.step(updatePeriod)
            }
            dut.io.out.expect(tot.U)
          }
        }
      }
    }
  }

  it should "clear when clear is asserted" in {
    val updatePeriods = randNums(minSize,maxSize,nTests)
    val sizes = randNums(minSize, maxSize, nTests)

    for (size <- sizes) {
      val inputSeq = Seq(
        List.fill(size)(0),
        List.fill(size)(maxVal),
        List.fill(size)(randNum(1,maxVal-1)),
      )

      for (updatePeriod <- updatePeriods) {
        for (input <- inputSeq) {
          test(new Accumulator(size, config.width)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
            resetDUT(dut, maxTimeout)
            dut.io.update.poke(1.B)
            for (i <- input) {
              dut.io.update.poke(1.B)
              dut.io.in.poke(i.U)
              dut.clock.step()
              dut.io.update.poke(0.B)
              dut.clock.step(updatePeriod)
            }
            dut.io.clear.poke(1.B)
            dut.io.in.poke(0.U)
            dut.clock.step()
            dut.io.clear.poke(0.B)
            dut.clock.step()
            dut.io.out.expect(0.U)
          }
        }
      }
    }
  }

  it should "output valid after accumulator is full" in {
    val updatePeriods = randNums(minSize,maxSize,nTests)
    val sizes = randNums(minSize, maxSize, nTests)

    for (size <- sizes) {
      val inputSeq = Seq(
        List.fill(size)(0),
        List.fill(size)(maxVal),
        List.fill(size)(randNum(1,maxVal-1)),
      )

      for (updatePeriod <- updatePeriods) {
        for (input <- inputSeq) {
          test(new Accumulator(size, config.width)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
            resetDUT(dut, maxTimeout)
            dut.io.update.poke(1.B)
            var n = 0
            for (i <- input) {
              dut.io.update.poke(1.B)
              dut.io.in.poke(i.U)
              dut.clock.step()
              dut.io.update.poke(0.B)
              n += 1
              dut.io.valid.expect((n >= size).B)
              dut.clock.step(updatePeriod)
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
}
