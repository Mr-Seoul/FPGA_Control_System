package controller

import chisel3._
import chisel3.experimental.FixedPoint
import chisel3.util._

class PIDIO() extends Bundle {
  val P = Input(FixedPoint(config.fixedWidth.W,config.decimalWidth.BP))
  val I = Input(FixedPoint(config.fixedWidth.W,config.decimalWidth.BP))
  val D = Input(FixedPoint(config.fixedWidth.W,config.decimalWidth.BP))
  val e = Input(FixedPoint(config.fixedWidth.W,config.decimalWidth.BP))

  val response  = Output(FixedPoint(config.fixedWidth.W,config.decimalWidth.BP))
  val pResponse = Output(FixedPoint(config.fixedWidth.W,config.decimalWidth.BP))
  val iResponse = Output(FixedPoint(config.fixedWidth.W,config.decimalWidth.BP))
  val dResponse = Output(FixedPoint(config.fixedWidth.W,config.decimalWidth.BP))

  val totError  = Output(FixedPoint(config.fixedWidth.W,config.decimalWidth.BP))
}

class PID(errorPeriod : Int, updatePeriod : Int) extends Module {
  val io = IO(new PIDIO())

  def pow2(exponent: Int): Int = {
    return 1 << exponent
  }

  val minVal = -pow2(config.fixedWidth-1)
  val maxVal = pow2(config.fixedWidth-1)-1

  val propE = Wire(FixedPoint(config.fixedWidth.W,config.decimalWidth.BP))
  val intE  = Wire(FixedPoint(config.fixedWidth.W,config.decimalWidth.BP))
  val diffE = Wire(FixedPoint(config.fixedWidth.W,config.decimalWidth.BP))

  //Update stored errors every update period, not every cycle
  val regLastE = RegInit(0.F(config.fixedWidth.W,config.decimalWidth.BP))
  val (updateCnt, updateWrap) = Counter(1.B, updatePeriod)
  regLastE := Mux(updateWrap, io.e, regLastE)
  val accumulator = Module(new SAccumulator(errorPeriod, config.fixedWidth))
  accumulator.io.update := updateWrap
  accumulator.io.clear  := 0.B
  accumulator.io.in     := io.e.asSInt

  propE := io.e
  val intEClamp = Module(new Clamp(minVal, maxVal, config.fixedWidth+log2Ceil(errorPeriod)+1))
  intEClamp.io.in := accumulator.io.out
  intE := intEClamp.io.clampedValue.asFixedPoint(config.decimalWidth.BP)
  io.totError := intE
  diffE := io.e - regLastE

  //Pipeline individual responses in a register to shorten critical path (large multiplications)
  val regPMult = RegInit(0.F((2*config.fixedWidth).W,config.decimalWidth.BP))
  val regIMult = RegInit(0.F((2*config.fixedWidth).W,config.decimalWidth.BP))
  val regDMult = RegInit(0.F((2*config.fixedWidth).W,config.decimalWidth.BP))
  regPMult := (io.P*propE).setBinaryPoint(config.decimalWidth)
  regIMult := (io.I*intE).setBinaryPoint(config.decimalWidth)
  regDMult := (io.D*diffE).setBinaryPoint(config.decimalWidth)

  val pClamp = Module(new Clamp(minVal, maxVal, 2*config.fixedWidth))
  val iClamp = Module(new Clamp(minVal, maxVal, 2*config.fixedWidth))
  val dClamp = Module(new Clamp(minVal, maxVal, 2*config.fixedWidth))
  pClamp.io.in := regPMult.asSInt
  iClamp.io.in := regIMult.asSInt
  dClamp.io.in := regDMult.asSInt

  val regPResponse = RegInit(0.F((2*config.fixedWidth).W,config.decimalWidth.BP))
  val regIResponse = RegInit(0.F((2*config.fixedWidth).W,config.decimalWidth.BP))
  val regDResponse = RegInit(0.F((2*config.fixedWidth).W,config.decimalWidth.BP))
  regPResponse := pClamp.io.clampedValue.asFixedPoint(config.decimalWidth.BP)
  regIResponse := iClamp.io.clampedValue.asFixedPoint(config.decimalWidth.BP)
  regDResponse := dClamp.io.clampedValue.asFixedPoint(config.decimalWidth.BP)
  io.pResponse := regPResponse
  io.iResponse := regIResponse
  io.dResponse := regDResponse

  //Pipeline response in a register to isolate multiplication from critical path
  val res = RegInit(0.F((2*config.fixedWidth).W,config.decimalWidth.BP))
  res := regPResponse + regIResponse + regDResponse

  //Clamping between 0.05 and 0.95 to avoid relay switching too quickly
  val minResponse = config.minPWM.F(config.fixedWidth.W,config.decimalWidth.BP)
  val maxResponse = config.maxPWM.F(config.fixedWidth.W, config.decimalWidth.BP)

  io.response := Mux(res < minResponse, minResponse, Mux(res > maxResponse, maxResponse, res))
}

object PIDTestBench extends App {
  emitVerilog(new PID(5,1))
}