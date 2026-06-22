package controller

import chisel3._
import chisel3.experimental.FixedPoint
import chisel3.util._

object config {
  val ADCWidth = 8
  val samplingPeriod = 250

  val width = 16
  val modeFreq = 200000000
  val blinkFreq = 50000000
  val errorPeriod = 64
  val smootheningPeriod = 64

  val fixedWidth = 32
  val decimalWidth = 24
}

class ControllerIO() extends Bundle {
  val ADCIn = Input(Bool())
  val DACOut = Output(UInt(8.W))
  val coolingResponse = Output(Bool())

  val sseg = Output(UInt(7.W))
  val an = Output(UInt(4.W))
}

class Controller() extends Module {
  val io = IO(new ControllerIO())

  val synchronizedReset = RegNext(RegNext(reset))

  withReset(synchronizedReset.asAsyncReset) {
    val target = 18.F(config.fixedWidth.W, config.decimalWidth.BP)
    val ADCIn = RegNext(RegNext(io.ADCIn))

    val adc = Module(new ADC(config.ADCWidth,config.samplingPeriod))
    adc.io.in := ADCIn
    io.DACOut := adc.io.DACOut

    val inputSmoothener = Module(new Accumulator(config.smootheningPeriod))
    inputSmoothener.io.in := adc.io.out
    inputSmoothener.io.clear := 0.B

    val tempLookup = Module(new TemperatureLookup())
    tempLookup.io.in := inputSmoothener.io.out >> (log2Ceil(config.smootheningPeriod))
    val curTemp = tempLookup.io.out

    val display = Module(new Display(config.modeFreq, config.blinkFreq))
    display.io.currentTemp := curTemp
    display.io.targetTemp := target
    io.sseg := display.io.sseg
    io.an := display.io.an

    val e = Wire(FixedPoint(config.fixedWidth.W, config.decimalWidth.BP))
    e := target - curTemp

    val pid = Module(new PID(config.errorPeriod))
    pid.io.P := 1.F(config.fixedWidth.W, config.decimalWidth.BP)
    pid.io.I := 1.F(config.fixedWidth.W, config.decimalWidth.BP)
    pid.io.D := 1.F(config.fixedWidth.W, config.decimalWidth.BP)
    pid.io.e := e

    val response = ((pid.io.response << (config.fixedWidth - config.decimalWidth - 1))(config.fixedWidth-1,0).asSInt>>(config.fixedWidth - config.decimalWidth - 1)).asUInt
    val coolingPWM = Module(new PWM((1 << config.decimalWidth-1)-1))
    coolingPWM.io.in := response

    when (inputSmoothener.io.valid) {
      io.coolingResponse := 0.B
    } .otherwise {
      io.coolingResponse := Mux(pid.io.response > 0.F(config.fixedWidth.W, config.decimalWidth.BP), coolingPWM.io.out, 0.B)
    }
  }
}
object Controller extends App {
  emitVerilog(new Controller())
}
