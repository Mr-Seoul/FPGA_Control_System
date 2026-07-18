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

  val totError = Output(FixedPoint(config.fixedWidth.W,config.decimalWidth.BP))
}

class PID(errorPeriod : Int, updatePeriod : Int) extends Module {
  val io = IO(new PIDIO())

  def pow2(exponent: Int): Int = {
    return 1 << exponent
  }

  val minVal = -pow2(config.fixedWidth-1)
  val maxVal = pow2(config.fixedWidth-1)-1

  val propE = Wire(FixedPoint(config.fixedWidth.W,config.decimalWidth.BP))
  val intE = Wire(FixedPoint(config.fixedWidth.W,config.decimalWidth.BP))
  val diffE = Wire(FixedPoint(config.fixedWidth.W,config.decimalWidth.BP))

  val lastE = RegInit(0.F(config.fixedWidth.W,config.decimalWidth.BP))
  val (updateCnt, updateWrap) = Counter(1.B, updatePeriod)
  lastE := Mux(updateWrap, io.e, lastE)
  val accumulator = Module(new SAccumulator(errorPeriod, config.fixedWidth))
  accumulator.io.update := updateWrap
  accumulator.io.clear := 0.B
  accumulator.io.in := io.e.asSInt

  propE := io.e
  val intEClamp = Module(new Clamp(minVal, maxVal, config.fixedWidth+log2Ceil(errorPeriod)+1))
  intEClamp.io.in := accumulator.io.out
  intE := intEClamp.io.clampedValue.asFixedPoint(config.decimalWidth.BP)
  io.totError := intE
  diffE := io.e - lastE

  //Pipeline individual responses in a register to shorten critical path (large multiplications)
  val pClamp = Module(new Clamp(minVal, maxVal, 2*config.fixedWidth))
  val iClamp = Module(new Clamp(minVal, maxVal, 2*config.fixedWidth))
  val dClamp = Module(new Clamp(minVal, maxVal, 2*config.fixedWidth))
  pClamp.io.in := (io.P*propE).setBinaryPoint(config.decimalWidth).asSInt
  iClamp.io.in := (io.I*intE).setBinaryPoint(config.decimalWidth).asSInt
  dClamp.io.in := (io.D*diffE).setBinaryPoint(config.decimalWidth).asSInt
  val pResponse = RegInit(0.F((2*config.fixedWidth).W,config.decimalWidth.BP))
  val iResponse = RegInit(0.F((2*config.fixedWidth).W,config.decimalWidth.BP))
  val dResponse = RegInit(0.F((2*config.fixedWidth).W,config.decimalWidth.BP))
  pResponse := pClamp.io.clampedValue.asFixedPoint(config.decimalWidth.BP)
  iResponse := iClamp.io.clampedValue.asFixedPoint(config.decimalWidth.BP)
  dResponse := dClamp.io.clampedValue.asFixedPoint(config.decimalWidth.BP)
  io.pResponse := pResponse
  io.iResponse := iResponse
  io.dResponse := dResponse

  //Pipeline response in a register to isolate multiplication from critical path
  val res = RegInit(0.F((2*config.fixedWidth).W,(2*config.decimalWidth).BP))
  res := pResponse + iResponse + dResponse

  //Clamping between 0.05 and 0.95 to avoid relay switching too quickly
  val minResponse = 0.05.F(config.fixedWidth.W,config.decimalWidth.BP)
  val maxResponse = 0.95.F(config.fixedWidth.W, config.decimalWidth.BP)

  io.response := Mux(res < minResponse, minResponse, Mux(res > maxResponse, maxResponse, res))
}

object PIDTestBench extends App {
  emitVerilog(new PID(5,1))
}