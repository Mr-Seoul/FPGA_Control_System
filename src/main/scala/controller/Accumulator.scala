package controller

import chisel3._
import chisel3.util._

class AccumulatorIO(n : Int) extends Bundle {
  val next = Input(SInt(config.width.W))
  val clear = Input(Bool())

  val tot = Output(SInt((config.width*(log2Ceil(n)+1)).W))
}

class Accumulator(n : Int) extends Module {
  val io = IO(new AccumulatorIO(n))
  val tot = RegInit(0.S((config.width*(log2Ceil(n)+1)).W))
  val regChain = RegInit(VecInit(Seq.fill(n)(0.S(config.width.W))))

  regChain(0) := io.next
  for (i <- 1 until n) {
    regChain(i) := regChain(i-1)
  }

  val diff = Wire(SInt((config.width+1).W))
  diff := io.next - regChain(n - 1)

  tot := tot + diff
  io.tot := tot

  when (io.clear) {
    for (i <- 0 until n) {
      regChain(i) := 0.S
    }
    tot := 0.S
  }
}
