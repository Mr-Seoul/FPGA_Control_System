package controller

import chisel3._
import chisel3.experimental.FixedPoint
import chisel3.util._

object displayModes extends ChiselEnum {
  val current, target, enable = Value
}

class DisplayIO() extends Bundle {
  val currentTemp = Input(SInt(config.fixedWidth.W))
  val targetTemp = Input(SInt(config.fixedWidth.W))
  val enable = Input(Bool())

  val sseg = Output(UInt(7.W))
  val an = Output(UInt(4.W))
}

class Display(modePeriod : Int, blinkPeriod : Int) extends Module {
  val io = IO(new DisplayIO())
  val displayPeriod = 100000

  val currentTemp = (io.currentTemp>>config.decimalWidth)
  val targetTemp = (io.targetTemp>>config.decimalWidth)

  val curMode = RegInit(displayModes.current)
  val (modeCnt, modeCntWrap) = Counter(1.B, modePeriod)
  when (modeCntWrap) {
    switch (curMode) {
      is (displayModes.current) { curMode := displayModes.target }
      is (displayModes.target) { curMode := displayModes.enable }
      is (displayModes.enable) { curMode := displayModes.current }
    }
  }

  val showTemp = RegInit(true.B)
  val (blinkCnt, blinkCntWrap) = Counter(1.B, blinkPeriod)
  when (blinkCntWrap) {
      showTemp := ~showTemp
  }

  val curMessage = Wire(Vec(4, UInt(7.W)))
  val leadingChar = WireDefault(' '.U(7.W))
  val Clamp = Module(new Clamp(0, 99))
  val clampIn = WireDefault(0.S(config.fixedWidth.W))

  switch (curMode) {
    is (displayModes.current) {
      leadingChar := 'C'.U
      clampIn := currentTemp
    }
    is (displayModes.target) {
      leadingChar := 'T'.U
      clampIn := targetTemp
    }
    is (displayModes.enable) {
      leadingChar := 'E'.U
    }
  }

  Clamp.io.in := clampIn
  val curNumber = Clamp.io.clampedValue.asUInt

  curMessage(3) := leadingChar
  curMessage(2) := '='.U
  when (curMode === displayModes.current || curMode === displayModes.target) {
    curMessage(1) := Mux(!showTemp && Clamp.io.isClamped, ' '.U, curNumber / 10.U)
    curMessage(0) := Mux(!showTemp && Clamp.io.isClamped, ' '.U, curNumber % 10.U)
  } .otherwise {
    when (io.enable) {
      curMessage(1) := 'Y'.U
      curMessage(0) := 'E'.U
    } .otherwise {
      curMessage(1) := 'N'.U
      curMessage(0) := 'O'.U
    }
  }

  val (displayCnt, displayWrap) = Counter(1.B, displayPeriod)
  val (anodeCnt,anodeCntWrap) = Counter(displayWrap,4)
  val sseg = Module(new SSegDecoder())
  sseg.io.in := curMessage(anodeCnt)

  io.sseg := ~sseg.io.out
  io.an := ~(1.U << anodeCnt)
}
