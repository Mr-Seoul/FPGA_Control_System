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

  def randDouble(minNum : Double, maxNum : Double): Double = {
    if (minNum == maxNum) {
      return minNum
    }
    return Random.nextDouble() * (maxNum - minNum) + minNum
  }

  def randDoubles(minNum : Double, maxNum : Double, n : Double): Set[Double] = {
    var res = Set.empty[Double]
    while (res.size < n) {
      val newNum = randDouble(minNum,maxNum)
      if (!res.contains(newNum)) {
        res += newNum
      }
    }
    return res
  }

  def randNum(minNum : Int, maxNum : Int): Int = {
    if (minNum == maxNum) {
      return minNum
    }
    return Random.nextInt(maxNum - minNum) + minNum
  }

  def randNums(minNum : Int, maxNum : Int, n : Int): Set[Int] = {
    var res = Set.empty[Int]
    while (res.size < n) {
      val newNum = randNum(minNum,maxNum)
      if (!res.contains(newNum)) {
        res += newNum
      }
    }
    return res
  }

  def clamp(valueOf: Int, min: Int, max: Int): Int = {
    if (valueOf < min) min
    else if (valueOf > max) max
    else valueOf
  }

  def clampDouble(valueOf: Double, min: Double, max: Double): Double = {
    if (valueOf < min) min
    else if (valueOf > max) max
    else valueOf
  }
}