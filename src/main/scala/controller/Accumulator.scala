package controller

import chisel3._
import chisel3.util._

class AccumulatorIO(n : Int) extends Bundle {
  val in = Input(SInt(config.width.W))
  val clear = Input(Bool())

  val out = Output(SInt((config.width*(log2Ceil(n)+1)).W))
  val valid = Output(Bool())
}

class Accumulator(n : Int) extends Module {
  val io = IO(new AccumulatorIO(n))
  val tot = RegInit(0.S((config.width*(log2Ceil(n)+1)).W))
  val regChain = RegInit(VecInit(Seq.fill(n)(0.S(config.width.W))))

  val cnt = RegInit(0.U(log2Ceil(n+1)+1))
  when (cnt < n.U) {
    io.valid := 0.B
    cnt := cnt + 1.U
  } .otherwise {
    io.valid := 1.B
  }

  regChain(0) := io.in
  for (i <- 1 until n) {
    regChain(i) := regChain(i-1)
  }

  val diff = Wire(SInt((config.width+1).W))
  diff := io.in - regChain(n - 1)

  tot := tot + diff
  io.out := tot

  when (io.clear) {
    for (i <- 0 until n) {
      regChain(i) := 0.S
    }
    tot := 0.S
  }
}
