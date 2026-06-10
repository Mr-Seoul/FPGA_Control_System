package controller

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import testSuite._

class ADC_tb extends AnyFlatSpec with ChiselScalatestTester {
  val width = 8
  val nIterations = 3
  val maxVal = pow2(width)-1
  val maxTimeout = 1000


  it should "Reconstruct Analogue Signal" in {

    val inputSeq = Seq(
      List.fill(1)(0),
      List.fill(nIterations)(randNum(1,maxVal - 1)),
      List.fill(1)(maxVal),
    )

    for (input <- inputSeq) {
      test(new ADC(width, 2)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
        resetDUT(dut, maxTimeout)

        for (i <- input) {
          while (!dut.io.valid.peekBoolean()) {
            dut.io.in.poke((i >= dut.io.DACOut.peekInt()).B)
            dut.clock.step()
          }
          dut.io.out.expect(i.U)
          dut.clock.step()
        }
      }
    }
  }
}
