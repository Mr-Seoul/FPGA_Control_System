package controller

import chisel3._
import chisel3.util._

class AccumulatorIO(n : Int) extends Bundle {
  val in = Input(UInt(config.width.W))
  val clear = Input(Bool())

  val out = Output(UInt((config.width+(log2Ceil(n)+1)).W))
  val valid = Output(Bool())
}

class Accumulator(n : Int) extends Module {
  val io = IO(new AccumulatorIO(n))
  val tot = RegInit(0.S((config.width+(log2Ceil(n)+1)).W))
  val regChain = RegInit(VecInit(Seq.fill(n)(0.U(config.width.W))))

  val full = RegInit(0.B)
  val (cnt, cntWrap) = Counter(1.B, n)
  when (cntWrap) {
    full := 1.B
  }
  io.valid := full

  regChain(0) := io.in
  for (i <- 1 until n) {
    regChain(i) := regChain(i-1)
  }

  val diff = Wire(SInt((config.width+2).W))
  diff := io.in.asSInt - regChain(n - 1).asSInt

  tot := tot + diff
  io.out := (tot).asUInt

  when (io.clear) {
    for (i <- 0 until n) {
      regChain(i) := 0.U
    }
    tot := 0.S
  }
}
