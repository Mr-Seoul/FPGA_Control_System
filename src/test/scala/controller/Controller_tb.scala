
package controller

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import testSuite._

class Controller_tb extends AnyFlatSpec with ChiselScalatestTester {
  val maxTimeout = 1000

  it should " " in {

    test(new Controller(1, 1, 1, 1)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      resetDUT(dut, maxTimeout)

    }
  }
}



