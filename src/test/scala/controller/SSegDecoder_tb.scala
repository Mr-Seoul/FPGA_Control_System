package controller

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import testSuite._

import java.io.File
import scala.io.Source

class SSegDecoder_tb extends AnyFlatSpec with ChiselScalatestTester {
  val maxTimeout = 1000

  it should "Correctly decode SSEG code" in {

    test(new SSegDecoder()).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      resetDUT(dut, maxTimeout)

      val file = new File("src/main/scala/controller/SSEGLookup.hex")
      require(file.exists(), s"Error: No file at ${file.getAbsolutePath}")

      val hexData = Source.fromFile(file).getLines().toList
      val nums = hexData.map(line => { BigInt(line.trim,16) } )

      for (i <- 0 until nums.length) {
        dut.io.in.poke(i.U)
        dut.clock.step()
        dut.io.out.expect(nums(i))
      }
    }
  }
}
