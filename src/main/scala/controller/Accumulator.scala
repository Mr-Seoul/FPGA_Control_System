package controller

import chisel3._
import chisel3.util._

class AccumulatorIO(n : Int, width : Int) extends Bundle {
  val in = Input(UInt(width.W))
  val clear = Input(Bool())
  val update = Input(Bool())

  val out = Output(UInt((width+(log2Ceil(n)+1)).W))
  val valid = Output(Bool())
}

class Accumulator(n : Int, width : Int) extends Module {
  val io = IO(new AccumulatorIO(n ,width))
  val tot = RegInit(0.U((width+(log2Ceil(n)+1)).W))
  val regChain = RegInit(VecInit(Seq.fill(n)(0.U(width.W))))

  val full = RegInit(0.B)
  val updateTick = Wire(Bool())
  updateTick := 0.B
  val (cnt, cntWrap) = Counter(updateTick, n)
  when (cntWrap) {
    full := 1.B
  }
  io.valid := full

  when (io.clear) {
    for (i <- 0 until n) {
      regChain(i) := 0.U
    }
    tot := 0.U
    full := 0.B
  } .elsewhen(io.update) {
    updateTick := 1.B
    regChain(0) := io.in
    for (i <- 1 until n) {
      regChain(i) := regChain(i - 1)
    }

    val diff = Wire(SInt((width + 2).W))
    diff := Cat(0.U(1.W),io.in).asSInt - Cat(0.U(1.W),regChain(n - 1)).asSInt

    tot := (tot.asSInt + diff).asUInt
  }
  io.out := tot
}
