package controller

import chisel3._
import chisel3.util._

class ClampIO() extends Bundle {
  val in = Input(SInt(config.width.W))

  val clampedValue = Output(SInt(config.width.W))
  val isClamped = Output(Bool())
}

class Clamp(min : Int, max : Int) extends Module {
  val io = IO(new ClampIO())

  io.clampedValue := Mux(io.in < min.S, min.S, Mux(io.in > max.S, max.S, io.in))
  io.isClamped := io.in < min.S || io.in > max.S
}