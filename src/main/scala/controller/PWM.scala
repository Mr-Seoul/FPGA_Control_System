package controller

import chisel3._
import chisel3.util._

class PWMIO() extends Bundle {
  val in = Input(UInt(config.width.W))

  val ready = Output(Bool())
  val out = Output(Bool())
}

class PWM(period : Int) extends Module {
  val io = IO(new PWMIO())

  val cur = RegInit(0.U((log2Ceil(period)+1).W))
  cur := Mux(cur >= period.U, 0.U, cur + 1.U)

  val ready = cur === period.U

  val in = RegInit(0.U(config.width.W))
  in := Mux(ready, io.in, in)

  io.ready := ready
  io.out := cur < in
}
