package controller

import chisel3._
import chisel3.util._

class ADCIO(n : Int) extends Bundle {
  val in     = Input(Bool())
  val out    = Output(UInt(n.W))
  val DACOut = Output(UInt(n.W))
  val valid  = Output(Bool())
}

class ADC(n : Int, sampleCycles : Int) extends Module {
  val io = IO(new ADCIO(n))

  val in = io.in

  val sMeasure :: sUpdate :: sOutput :: Nil = Enum(3)
  val regState = RegInit(sMeasure)

  val regCurTest = RegInit(VecInit(Seq.fill(n)(0.B)))
  io.DACOut := regCurTest.asUInt - 1.U //Due to positive voltage biasing
  val incBit = Wire(Bool())
  incBit    := 0.B

  val (sampleCnt, sampleWrap) = Counter(regState === sMeasure, sampleCycles)
  val (bitCnt, bitWrap)       = Counter(incBit, n)

  val regOutput = RegInit(0.U(n.W))
  val regValid  = RegInit(0.B)
  regValid := 0.B

  switch(regState) {
    is(sMeasure) {
      when(sampleWrap) {
        regState := sUpdate
        regCurTest((n-1).U - bitCnt) := in
      } .otherwise {
        regCurTest((n-1).U - bitCnt) := 1.B
      }
    }

    is(sUpdate) {
      incBit := 1.B
      when (bitCnt === (n-1).U) {
        regState := sOutput
      } .otherwise {
        regState := sMeasure
      }
    }

    is(sOutput) {
      regState   := sMeasure
      bitCnt     := 0.U
      regOutput  := regCurTest.asUInt
      regCurTest := 0.U(n.W).asBools
      regValid   := 1.B
    }
  }

  io.valid := regValid
  io.out := regOutput
}

//object ADC extends App {
//  emitVerilog(new ADC(8,800))
//}