package controller

import chisel3._
import chisel3.util._

class TestIO() extends Bundle {
  val in = Input(UInt(8.W))
  val out = Output(UInt(8.W))
}

class Test() extends Module {
  val io = IO(new TestIO)
  val in = RegNext(RegNext(io.in))
  io.out := in
}

object Test extends App {
  emitVerilog(new Test())
}