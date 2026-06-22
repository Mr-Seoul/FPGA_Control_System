package controller

import chisel3._
import chisel3.util._

class ADCTest(n : Int, sampleCycles : Int) extends Module {
  val io = IO(new ADCIO(n))

  val synchedReset = RegNext(RegNext(reset.asBool))
  withReset(synchedReset.asAsyncReset) {
    val in = RegNext(RegNext(io.in))

    val ADC = Module(new ADC(n,sampleCycles))
    val out = RegInit(0.U(8.W))
    val (updateCNT, updateWrap) = Counter(1.B,100000000)
    out := Mux(updateWrap, ADC.io.out,out)
    ADC.io.in := in
    io.out := out
    io.DACOut := ADC.io.DACOut
    io.valid := ADC.io.valid
  }
}

//object ADCTest extends App {
//  emitVerilog(new ADCTest(8,250))
//}