package controller

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import testSuite._

class ADC_tb extends AnyFlatSpec with ChiselScalatestTester {
  val nIterations = 5
  val minSamplePeriod = 3
  val maxSamplePeriod = 16
  val minSize = 2
  val maxSize = 16
  val maxTimeout = 2*maxSize*nTests*nIterations*maxSamplePeriod

  it should "Reconstruct Analogue Signal" in {

    val sizeSeq = Seq(
      List.fill(1)(minSize),
      List.fill(nTests)(randNum(minSize + 1,maxSize - 1)),
      List.fill(1)(maxSize),
    )

    for (sizes <- sizeSeq) {
      for (size <- sizes) {
        val maxVal = pow2(size) - 1
        val inputSeq = Seq(
          List.fill(1)(0),
          List.fill(nIterations)(randNum(1,maxVal - 1)),
          List.fill(1)(maxVal),
        )

        val samplePeriod = randNum(minSamplePeriod,maxSamplePeriod)

        for (input <- inputSeq) {
          test(new ADC(size, samplePeriod)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
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
  }
}
