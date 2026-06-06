package controller

import chisel3._
import chisel3.util._

object config {
  val width = 16
  val modeFreq = 200000000
  val blinkFreq = 50000000
  val accumulatorN = 64
}

class ControllerIO() extends Bundle {
  val target = Input(SInt(config.width.W))
  val cur = Input(SInt(config.width.W))

  val heatingResponse = Output(Bool())
  val coolingResponse = Output(Bool())

  val sseg = Output(UInt(7.W))
  val an = Output(UInt(4.W))
}

//To do: Add FP / UInt, and add LUT for input DAC to temperature. Note that the input is a FP (write a script to automatically generate temp to voltage convertion), and the output should be a FP from -0 to 128 degrees (4 bits of decimal precicion)
//Go through project and decide how much precision is needed everywhere. The response of the PID should be a FP from 0 to 1. Be carefull of overflow in the PID.
class Controller(modeFreq : Int, blinkFreq : Int, accumulatorN : Int) extends Module {
  val io = IO(new ControllerIO())

  val target = RegNext(io.target)
  val cur = RegNext(io.cur)

  val display = Module(new Display(modeFreq, blinkFreq))
  display.io.currentTemp := cur
  display.io.targetTemp := target
  io.sseg := display.io.sseg
  io.an := display.io.an

  val e = Wire(SInt(config.width.W))
  e := target - cur

  val pid = Module(new PID(accumulatorN))
  pid.io.P := 1.S(config.width.W)
  pid.io.I := 1.S(config.width.W)
  pid.io.D := 1.S(config.width.W)
  pid.io.e := e

  val response = pid.io.response.asUInt
  val inverseResponse = -1.S(config.width.W)*response.asUInt

  val heatingPWM = Module(new PWM((1 << (config.width-1))-1))
  val coolingPWM = Module(new PWM((1 << (config.width-1))-1))
  heatingPWM.io.in := response
  coolingPWM.io.in := inverseResponse

  io.heatingResponse := Mux(pid.io.response > 0.S(config.width.W), heatingPWM.io.out, 0.B)
  io.coolingResponse := Mux(pid.io.response < 0.S(config.width.W), coolingPWM.io.out, 0.B)
}

object Controller extends App {
  emitVerilog(new Controller(config.modeFreq, config.blinkFreq, config.accumulatorN))
}
