
package controller

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import testSuite._
import scala.math.pow

import java.io.File
import scala.io.Source

class TemperatureLookup_tb extends AnyFlatSpec with ChiselScalatestTester {
  val maxTimeout = 1000

  it should "return value from lookup file" in {

    test(new TemperatureLookup()).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      resetDUT(dut, maxTimeout)

      def UIntToQ824F(num : BigInt): BigDecimal = {
        val totalWidth = 32
        val signedVal = if (num.testBit(totalWidth - 1)) {
          num - (BigInt(1) << totalWidth)
        } else {
          num
        }

        val baseDec = BigDecimal(signedVal)
        val divisor = BigDecimal(2).pow(24)

        baseDec / divisor
      }

      val file = new File("ADCDesign/lookup.hex")
      require(file.exists(), s"Error: No file at ${file.getAbsolutePath}")

      val hexData = Source.fromFile(file).getLines().toList
      val nums = hexData.map(line => { UIntToQ824F(BigInt(line.trim,16)) } )

      for (i <- 0 until nums.length) {
        dut.io.in.poke(i.U)
        dut.clock.step()
        dut.io.out.expect(nums(i))
      }
    }
  }
}



