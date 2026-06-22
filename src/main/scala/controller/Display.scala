package controller

import chisel3._
import chisel3.experimental.FixedPoint
import chisel3.util._

object displayModes extends ChiselEnum {
  val current, target = Value
}

class DisplayIO() extends Bundle {
  val currentTemp = Input(FixedPoint(config.fixedWidth.W, config.decimalWidth.BP))
  val targetTemp = Input(FixedPoint(config.fixedWidth.W, config.decimalWidth.BP))

  val sseg = Output(UInt(7.W))
  val an = Output(UInt(4.W))
}

class Display(modeFreq : Int, blinkFreq : Int) extends Module {
  val io = IO(new DisplayIO())

  val currentTemp = (io.currentTemp>>config.decimalWidth)
  val targetTemp = (io.targetTemp>>config.decimalWidth)

  val curMode = RegInit(displayModes.current)
  val (modeCnt, modeCntWrap) = Counter(1.B, modeFreq)
  when (modeCntWrap) {
    switch (curMode) {
      is (displayModes.current) { curMode := displayModes.target }
      is (displayModes.target) { curMode := displayModes.current }
    }
  }

  val showTemp = RegInit(true.B)
  val (blinkCnt, blinkCntWrap) = Counter(1.B, blinkFreq)
  when (blinkCntWrap) {
      showTemp := ~showTemp
  }

  val curMessage = Wire(Vec(4, UInt(7.W)))
  val leadingChar = WireDefault(' '.U(7.W))
  val Clamp = Module(new Clamp(0, 99))
  val clampIn = WireDefault(0.F(config.fixedWidth.W, config.decimalWidth.BP))

  switch (curMode) {
    is (displayModes.current) {
      leadingChar := 'C'.U
      clampIn := currentTemp
    }
    is (displayModes.target) {
      leadingChar := 'T'.U
      clampIn := targetTemp
    }
  }

  Clamp.io.in := (clampIn >> config.decimalWidth).asSInt
  val curNumber = Clamp.io.clampedValue.asUInt

  curMessage(0) := leadingChar
  curMessage(1) := '='.U
  curMessage(2) := Mux(!showTemp && Clamp.io.isClamped, ' '.U, curNumber / 10.U)
  curMessage(3) := Mux(!showTemp && Clamp.io.isClamped, ' '.U, curNumber % 10.U)

  val (anodeCnt,anodeCntWrap) = Counter(1.B,4)
  val sseg = Module(new SSegDecoder())
  sseg.io.in := curMessage(anodeCnt)

  io.sseg := ~sseg.io.out
  io.an := ~(1.U << anodeCnt)
}
