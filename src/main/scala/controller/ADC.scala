package controller

import chisel3._
import chisel3.util._

class ADCIO(n : Int) extends Bundle {
  val in = Input(Bool())
  val out = Output(UInt(n.W))
  val DACOut = Output(UInt(n.W))
  val valid = Output(Bool())
}

class ADC(n : Int, sampleCycles : Int) extends Module {
  val io = IO(new ADCIO(n))

  val in = RegNext(RegNext(io.in))

  val sMeasure :: sUpdate :: sOutput :: Nil = Enum(3)
  val state = RegInit(sMeasure)

  val curTest = RegInit(VecInit(Seq.fill(n)(0.B)))
  io.DACOut := curTest.asUInt
  val incBit = Wire(Bool())
  incBit := 0.B

  val (sampleCnt, sampleWrap)= Counter(state === sMeasure, sampleCycles)
  val (bitCnt, bitWrap)= Counter(incBit, n)
  val regOutput = RegInit(0.U(n.W))
  val validOut = RegInit(0.B)
  validOut := 0.B

  switch(state) {
    is(sMeasure) {
      when(sampleWrap) {
        state := sUpdate
        curTest((n-1).U - bitCnt) := in
      } .otherwise {
        curTest((n-1).U - bitCnt) := 1.B
      }
    }

    is(sUpdate) {
      incBit := 1.B
      when (bitCnt === (n-1).U) {
        state := sOutput
      } .otherwise {
        state := sMeasure
      }
    }

    is(sOutput) {
      state := sMeasure
      bitCnt := 0.U
      regOutput := curTest.asUInt
      curTest := 0.U(n.W).asBools
      validOut := 1.B
    }
  }

  io.valid := validOut
  io.out := regOutput
}

//object ADC extends App {
//  emitVerilog(new ADC(8,800))
//}