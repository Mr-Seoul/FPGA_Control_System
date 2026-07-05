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

  val anode = Output(UInt(2.W))
  val asciiOut = Output(UInt(7.W))
  val modeWrapped = Output(Bool())
}

class Display(modePeriod : Int, blinkPeriod : Int, multiplexPeriod : Int) extends Module {
  val io = IO(new DisplayIO())

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

  val showTemp = RegInit(1.B)


  val curMessage = Wire(Vec(4, UInt(7.W)))
  val leadingChar = WireDefault(' '.U(7.W))
  val Clamp = Module(new Clamp(0, 99, config.width))
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

  val anodeCnt = RegInit(0.U(2.W))
  val multiplexCnt = RegInit(0.U((log2Ceil(multiplexPeriod)+1).W))
  val blinkCnt = RegInit(0.U((log2Ceil(blinkPeriod)+1).W))

  when (modeCntWrap) {
    multiplexCnt := 0.U
    anodeCnt := 0.U
    blinkCnt := 0.U
    showTemp := 1.B
  } .otherwise {
    when (multiplexCnt === (multiplexPeriod-1).U) {
      multiplexCnt := 0.U
      when (anodeCnt === 3.U) {
        anodeCnt := 0.U
      } .otherwise {
        anodeCnt := anodeCnt + 1.U
      }
    } .otherwise {
      multiplexCnt := multiplexCnt + 1.U
    }

    when (blinkCnt === (blinkPeriod-1).U) {
      blinkCnt := 0.U
      showTemp := ~showTemp
    } .otherwise {
      blinkCnt := blinkCnt + 1.U
    }
  }

  io.anode := anodeCnt
  io.asciiOut := curMessage(anodeCnt)
  io.modeWrapped := modeCntWrap && curMode === displayModes.enable
}
