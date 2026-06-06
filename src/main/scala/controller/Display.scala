package controller

import chisel3._
import chisel3.util._

object displayModes extends ChiselEnum {
  val current, target = Value
}

class DisplayIO() extends Bundle {
  val currentTemp = Input(SInt(config.width.W))
  val targetTemp = Input(SInt(config.width.W))

  val sseg = Output(UInt(7.W))
  val an = Output(UInt(4.W))
}

class Display(modeFreq : Int, blinkFreq : Int) extends Module {
  val io = IO(new DisplayIO())

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
  val clampIn = WireDefault(0.S(config.width.W))

  switch (curMode) {
    is (displayModes.current) {
      leadingChar := 'C'.U
      clampIn := io.currentTemp
    }
    is (displayModes.target) {
      leadingChar := 'T'.U
      clampIn := io.targetTemp
    }
  }

  Clamp.io.in := clampIn
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
