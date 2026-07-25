package controller

import chisel3._
import chisel3.util._

class SAccumulatorIO(n : Int, width : Int) extends Bundle {
  val in     = Input(SInt(width.W))
  val clear  = Input(Bool())
  val update = Input(Bool())

  val out   = Output(SInt((width+log2Ceil(n)+1).W))
  val valid = Output(Bool())
}

class SAccumulator(n : Int, width : Int) extends Module {
  val io = IO(new SAccumulatorIO(n, width))
  val regTot   = RegInit(0.S((width+log2Ceil(n)+1).W))
  val regChain = RegInit(VecInit(Seq.fill(n)(0.S(width.W))))

  //Valid Logic
  val regCnt = RegInit(0.U((log2Ceil(n)+1).W))
  regCnt := Mux(io.update && regCnt < n.U, regCnt+1.U, regCnt)
  val regFull = RegInit(0.B)
  regFull := regCnt === n.U
  io.valid := regFull

  //Operational Logic
  when (io.clear) {
    for (i <- 0 until n) {
      regChain(i) := 0.S
    }
    regTot := 0.S
    regCnt := 0.U
  } .elsewhen(io.update) {
    regChain(0) := io.in
    for (i <- 1 until n) {
      regChain(i) := regChain(i-1)
    }

    val diff = Wire(SInt((width+1).W))
    diff := io.in - regChain(n - 1)

    regTot := regTot + diff
  }

  io.out := regTot
}
