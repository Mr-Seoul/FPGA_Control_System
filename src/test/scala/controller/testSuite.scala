import chisel3._
import chiseltest._

import scala.util.Random

package object testSuite {
  val nTests = 3

  def pow2(exponent: Int): Int = {
    return 1 << exponent
  }

  def resetDUT(dut: Module, maxTimeout : Int): Unit = {
    dut.clock.setTimeout(maxTimeout)
    dut.reset.poke(1.B)
    dut.clock.step()
    dut.reset.poke(0.B)
    dut.clock.step()
  }

  def randNum(minNum : Int, maxNum : Int): Int = {
    return Random.nextInt(maxNum - minNum) + minNum
  }

  def randNums(minNum : Int, maxNum : Int, n : Int): Set[Int] = {
    var res = Set.empty[Int]
    Set.empty[Int]
    while (res.size < n) {
      val newNum = randNum(minNum,maxNum)
      if (!res.contains(newNum)) {
        res += newNum
      }
    }
    return res
  }
}