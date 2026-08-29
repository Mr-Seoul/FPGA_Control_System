package controller

import chisel3._
import chisel3.experimental.FixedPoint
import chisel3.util._

object config {
  val ADCWidth = 8
  val samplingPeriod = 250

  val width = 16
  val modePeriod = 200000000
  val FPGAFrequency = 100000000
  val blinkPeriod = 50000000
  val errorPeriod = 64
  //Note that the smoothening Period MUST be a power of 2.
  val smootheningPeriod = 64
  val multiplexPeriod = 100000

  val fixedWidth = 32
  val decimalWidth = 24

  val P = 0.5
  val I = 0.001
  val D = -5

  val minPWM = 0.05
  val maxPWM = 0.95
}

class ControllerIO() extends Bundle {
  val ADCIn  = Input(Bool())
  val DACOut = Output(UInt(8.W))
  val ADCOut = Output(UInt(8.W))
  val coolingResponse = Output(Bool())

  val sseg = Output(UInt(7.W))
  val an   = Output(UInt(4.W))

  val packetUpdate = Output(Bool())

  val sck  = Input(Bool())
  val csN  = Input(Bool())
  val mosi = Input(Bool())
  val miso = Output(Bool())
}

class Controller(
  samplingPeriod    : Int = config.samplingPeriod,
  smootheningPeriod : Int = config.smootheningPeriod,
  blinkPeriod       : Int = config.blinkPeriod,
  modePeriod        : Int = config.modePeriod,
  multiplexPeriod   : Int = config.multiplexPeriod,
  errorPeriod       : Int = config.errorPeriod,
  updatePeriod      : Int = config.FPGAFrequency,
) extends Module {

  val io = IO(new ControllerIO())

  val synchronizedReset = RegNext(RegNext(reset, 0.B), 0.B)

  withReset(synchronizedReset.asAsyncReset) {
    val ADCIn      = RegNext(RegNext(io.ADCIn, 1.B), 0.B)
    val targetTemp = RegInit(18.F(config.fixedWidth.W,config.decimalWidth.BP))
    val enable     = RegInit(1.B)

    //ADC, input smoothening and converting to temperature
    val adc    = Module(new ADC(config.ADCWidth,samplingPeriod))
    adc.io.in := ADCIn
    io.DACOut := adc.io.DACOut

    val inputSmoothener = Module(new Accumulator(smootheningPeriod, config.ADCWidth))
    inputSmoothener.io.update := adc.io.valid
    inputSmoothener.io.in     := adc.io.out
    inputSmoothener.io.clear  := 0.B

    val (adcCnt, adcWrap) = Counter(1.B,blinkPeriod)
    val regADC = RegInit(0.U(8.W))
    when (adcWrap) {
      regADC  := inputSmoothener.io.out >> (log2Ceil(smootheningPeriod))
    }
    io.ADCOut := regADC

    val tempLookup    = Module(new TemperatureLookup())
    tempLookup.io.in := regADC
    val curTemp       = tempLookup.io.out

    //Display initialisation
    val display = Module(new Display(modePeriod, blinkPeriod, multiplexPeriod))
    val (curTempCnt, curTempWrap) = Counter(1.B,blinkPeriod)
    val regCurTemp = RegInit(0.S(config.fixedWidth.W))
    when (curTempWrap) {
      regCurTemp := curTemp.asSInt
    }
    display.io.currentTemp := regCurTemp
    val (targetTempCnt, targetTempWrap) = Counter(1.B,blinkPeriod)
    val regTargetTemp = RegInit(0.S(config.fixedWidth.W))
    when (targetTempWrap) {
      regTargetTemp := targetTemp.asSInt
    }
    display.io.targetTemp := regTargetTemp
    display.io.enable     := enable

    val sseg    = Module(new SSegDecoder())
    sseg.io.in := display.io.asciiOut

    io.sseg := ~sseg.io.out
    io.an   := ~(1.U << display.io.anode)

    //PID controller initialisation
    val e = Wire(FixedPoint(config.fixedWidth.W, config.decimalWidth.BP))
    e := curTemp - targetTemp

    val pid = Module(new PID(errorPeriod, updatePeriod))
    pid.io.P := config.P.F(config.fixedWidth.W, config.decimalWidth.BP)
    pid.io.I := config.I.F(config.fixedWidth.W, config.decimalWidth.BP)
    pid.io.D := config.D.F(config.fixedWidth.W, config.decimalWidth.BP)
    pid.io.e := e

    val response      = pid.io.response.asUInt
    val coolingPWM    = Module(new PWM((1 << config.decimalWidth)))
    coolingPWM.io.in := response

    when (inputSmoothener.io.valid && enable) {
      io.coolingResponse := Mux(pid.io.response > 0.F(config.fixedWidth.W, config.decimalWidth.BP), coolingPWM.io.out, 0.B)
    } .otherwise {
      io.coolingResponse := 0.B
    }

    //SPI initialisation
    val spi = Module(new SPI())
    spi.io.sck  := RegNext(RegNext(io.sck,0.B), 0.B)
    spi.io.csN  := RegNext(RegNext(io.csN,1.B),1.B)
    spi.io.mosi := RegNext(RegNext(io.mosi,0.B),0.B)

    io.miso         := spi.io.miso
    io.packetUpdate := spi.io.packetUpdate

    targetTemp := spi.io.data.setPoint.asFixedPoint(config.decimalWidth.BP)
    enable     := spi.io.data.enable
    spi.io.data.temperature := curTemp.asSInt
    spi.io.data.pEffort     := pid.io.pResponse.asSInt
    spi.io.data.iEffort     := pid.io.iResponse.asSInt
    spi.io.data.dEffort     := pid.io.dResponse.asSInt
    spi.io.data.totEffort   := pid.io.response.asSInt
  }
}

object Controller extends App {
  emitVerilog(new Controller())
}
