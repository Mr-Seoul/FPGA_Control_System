package controller

import chisel3._
import chisel3.util._

class PIDIO() extends Bundle {
  val P = Input(SInt(config.width.W))
  val I = Input(SInt(config.width.W))
  val D = Input(SInt(config.width.W))
  val e = Input(SInt(config.width.W))

  val response = Output(SInt(config.width.W))
}

class PID(errorPeriod : Int) extends Module {
  val io = IO(new PIDIO())

  val propE = Wire(SInt(config.width.W))
  val intE = Wire(SInt(config.width.W))
  val diffE = Wire(SInt(config.width.W))

  val lastE = RegNext(io.e)
  val accumulator = Module(new Accumulator(errorPeriod))
  accumulator.io.clear := 0.B
  accumulator.io.in := io.e

  propE := io.e
  intE := accumulator.io.out
  diffE := io.e - lastE

  io.response := io.P*propE + io.I*intE + io.D*diffE
}