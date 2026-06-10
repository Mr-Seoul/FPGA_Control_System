package controller

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import testSuite._

class PWM_tb extends AnyFlatSpec with ChiselScalatestTester {
  val minPeriod = 2
  val maxPeriod = 100
  val nIterations = 3
  val maxTimeout = 2*nTests*nIterations*maxPeriod

  def waitForReady(dut : PWM): Unit = {
    while (!dut.io.ready.peekBoolean()) {
      dut.clock.step()
    }
  }

  it should "Generate PWM signal" in {
    val periods = randNums(minPeriod, maxPeriod, nTests)

    for (period <- periods) {
      val inputSeq = Seq(
        List.fill(1)(0),
        List.fill(nIterations)(randNum(1,period-1)),
        List.fill(1)(period),
      )

      test(new PWM(period)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
        resetDUT(dut, maxTimeout)

        for (input <- inputSeq) {
          for (i <- input) {
            waitForReady(dut)
            dut.io.in.poke(i.U)
            for (j <- 0 until period) {
              dut.clock.step()
              dut.io.out.expect((j < i).B)
            }
          }
        }
      }
    }
  }
}
