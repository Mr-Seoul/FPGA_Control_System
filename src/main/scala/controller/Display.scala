package controller

import chisel3._
import chisel3.experimental.FixedPoint
import chisel3.util._

object displayModes extends ChiselEnum {
  val current, target, enable = Value
}

class DisplayIO() extends Bundle {
  val currentTemp = Input(SInt(config.fixedWidth.W))
  val targetTemp  = Input(SInt(config.fixedWidth.W))
  val enable      = Input(Bool())

  val anode       = Output(UInt(2.W))
  val asciiOut    = Output(UInt(7.W))
  val modeWrapped = Output(Bool())
}

class Display(modePeriod : Int, blinkPeriod : Int, multiplexPeriod : Int) extends Module {
  val io = IO(new DisplayIO())

  val currentTemp = (io.currentTemp>>config.decimalWidth)
  val targetTemp  = (io.targetTemp>>config.decimalWidth)

  val regMode = RegInit(displayModes.current)
  val (modeCnt, modeCntWrap) = Counter(1.B, modePeriod)
  when (modeCntWrap) {
    switch (regMode) {
      is (displayModes.current){ regMode := displayModes.target }
      is (displayModes.target) { regMode := displayModes.enable }
      is (displayModes.enable) { regMode := displayModes.current }
    }
  }

  val showTemp = RegInit(1.B)

  val curMessage  = Wire(Vec(4, UInt(7.W)))
  val leadingChar = WireDefault(' '.U(7.W))
  val Clamp       = Module(new Clamp(0, 99, config.width))
  val clampIn     = WireDefault(0.S(config.fixedWidth.W))

  switch (regMode) {
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
  when (regMode === displayModes.current || regMode === displayModes.target) {
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

  val regAnodeCnt     = RegInit(0.U(2.W))
  val regMultiplexCnt = RegInit(0.U((log2Ceil(multiplexPeriod)+1).W))
  val regBlinkCnt     = RegInit(0.U((log2Ceil(blinkPeriod)+1).W))

  when (modeCntWrap) {
    regMultiplexCnt := 0.U
    regAnodeCnt     := 0.U
    regBlinkCnt     := 0.U
    showTemp        := 1.B
  } .otherwise {
    when (regMultiplexCnt === (multiplexPeriod-1).U) {
      regMultiplexCnt := 0.U
      when (regAnodeCnt === 3.U) {
        regAnodeCnt := 0.U
      } .otherwise {
        regAnodeCnt := regAnodeCnt + 1.U
      }
    } .otherwise {
      regMultiplexCnt := regMultiplexCnt + 1.U
    }

    when (regBlinkCnt === (blinkPeriod-1).U) {
      regBlinkCnt := 0.U
      showTemp    := ~showTemp
    } .otherwise {
      regBlinkCnt := regBlinkCnt + 1.U
    }
  }

  io.anode       := regAnodeCnt
  io.asciiOut    := curMessage(regAnodeCnt)
  io.modeWrapped := modeCntWrap && regMode === displayModes.enable
}
