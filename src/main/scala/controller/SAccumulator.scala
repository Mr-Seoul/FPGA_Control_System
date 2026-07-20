package controller

import chisel3._
import chisel3.util._

class SAccumulatorIO(n : Int, width : Int) extends Bundle {
  val in = Input(SInt(width.W))
  val clear = Input(Bool())
  val update = Input(Bool())

  val out = Output(SInt((width+log2Ceil(n)+1).W))
  val valid = Output(Bool())
}

class SAccumulator(n : Int, width : Int) extends Module {
  val io = IO(new SAccumulatorIO(n, width))
  val tot = RegInit(0.S((width+log2Ceil(n)+1).W))
  val regChain = RegInit(VecInit(Seq.fill(n)(0.S(width.W))))

  //Valid Logic
  val cnt = RegInit(0.U((log2Ceil(n)+1).W))
  cnt := Mux(io.update && cnt < n.U, cnt+1.U, cnt)
  val full = RegInit(0.B)
  full := cnt === n.U
  io.valid := full

  //Operational Logic
  when (io.clear) {
    for (i <- 0 until n) {
      regChain(i) := 0.S
    }
    tot := 0.S
    cnt := 0.U
  } .elsewhen(io.update) {
    regChain(0) := io.in
    for (i <- 1 until n) {
      regChain(i) := regChain(i-1)
    }

    val diff = Wire(SInt((width+1).W))
    diff := io.in - regChain(n - 1)

    tot := tot + diff
  }

  io.out := tot
}
