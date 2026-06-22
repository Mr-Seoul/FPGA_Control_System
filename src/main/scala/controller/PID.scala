package controller

import chisel3._
import chisel3.experimental.FixedPoint
import chisel3.util._

class PIDIO() extends Bundle {
  val P = Input(FixedPoint(config.fixedWidth.W,config.decimalWidth.BP))
  val I = Input(FixedPoint(config.fixedWidth.W,config.decimalWidth.BP))
  val D = Input(FixedPoint(config.fixedWidth.W,config.decimalWidth.BP))
  val e = Input(FixedPoint(config.fixedWidth.W,config.decimalWidth.BP))

  val response = Output(FixedPoint(config.fixedWidth.W,config.decimalWidth.BP))
}

class PID(errorPeriod : Int) extends Module {
  val io = IO(new PIDIO())

  val propE = Wire(FixedPoint(config.fixedWidth.W,config.decimalWidth.BP))
  val intE = Wire(FixedPoint(config.fixedWidth.W,config.decimalWidth.BP))
  val diffE = Wire(FixedPoint(config.fixedWidth.W,config.decimalWidth.BP))

  val lastE = RegNext(io.e)
  val accumulator = Module(new SAccumulator(errorPeriod))
  accumulator.io.clear := 0.B
  accumulator.io.in := io.e.asSInt

  propE := io.e
  intE := accumulator.io.out.asFixedPoint(config.decimalWidth.BP)
  diffE := io.e - lastE

  val res = io.P*propE + io.I*intE + io.D*diffE

  io.response := Mux(res < 0.F(config.fixedWidth.W,config.decimalWidth.BP), 0.F(config.fixedWidth.W,config.decimalWidth.BP), Mux(res > 1.F(config.fixedWidth.W,config.decimalWidth.BP), 1.F(config.fixedWidth.W,config.decimalWidth.BP), res))
}