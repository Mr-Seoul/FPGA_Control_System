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
  val pResponse = Output(FixedPoint(config.fixedWidth.W,config.decimalWidth.BP))
  val iResponse = Output(FixedPoint(config.fixedWidth.W,config.decimalWidth.BP))
  val dResponse = Output(FixedPoint(config.fixedWidth.W,config.decimalWidth.BP))
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

  val pResponse = RegInit(0.F(config.fixedWidth.W,config.decimalWidth.BP))
  val iResponse = RegInit(0.F(config.fixedWidth.W,config.decimalWidth.BP))
  val dResponse = RegInit(0.F(config.fixedWidth.W,config.decimalWidth.BP))
  pResponse := io.P*propE
  iResponse := io.I*intE
  dResponse := io.D*diffE
  io.pResponse := pResponse
  io.iResponse := iResponse
  io.dResponse := dResponse

  val res = RegInit(0.F(config.fixedWidth.W,config.decimalWidth.BP))
  res := pResponse + iResponse + dResponse

  val minResponse = 0.05.F(config.fixedWidth.W,config.decimalWidth.BP)
  val maxResponse = 0.95.F(config.fixedWidth.W, config.decimalWidth.BP)

  io.response := Mux(res < minResponse, minResponse, Mux(res > maxResponse, maxResponse, res))
}