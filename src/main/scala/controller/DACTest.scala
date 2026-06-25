package controller

import chisel3._
import chisel3.util._

class DACTestIO() extends Bundle {
  val in = Input(UInt(config.ADCWidth.W))
  val out = Output(UInt(config.ADCWidth.W))
}

class DACTest() extends Module {
  val io = IO(new DACTestIO())
  val in = RegNext(RegNext(io.in))
  io.out := in
}

//object Test extends App {
//  emitVerilog(new DACTest())
//}