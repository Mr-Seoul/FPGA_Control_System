package controller

import chisel3._
import chisel3.experimental.FixedPoint
import chisel3.util._

class SPIData extends Bundle {
  val setPoint   = Output(SInt(config.fixedWidth.W))
  val enable     = Output(Bool())

  val temperature = Input(SInt(config.fixedWidth.W))
  val pEffort   = Input(SInt(config.fixedWidth.W))
  val iEffort   = Input(SInt(config.fixedWidth.W))
  val dEffort   = Input(SInt(config.fixedWidth.W))
  val totEffort = Input(SInt(config.fixedWidth.W))
}

class SPIIO extends Bundle {
  val sck  = Input(Bool())
  val mosi = Input(Bool())
  val miso = Output(Bool())
  val csN = Input(Bool())

  val packetUpdate = Output(Bool())

  val data = new SPIData()
}

class SpiSlave extends Module {
  val packetSize = config.fixedWidth*5

  val io = IO(new SPIIO())

  val sck  = io.sck
  val mosi = io.mosi
  val csn  = io.csN

  val sckPrev = RegNext(sck, 0.B)
  val csnPrev = RegNext(csn, 1.B)

  val sckRising  = sck  && !sckPrev
  val sckFalling  = !sck  && sckPrev
  val csnFalling = !csn && csnPrev
  val csnRising  = csn  && !csnPrev

  val shrMosi  = RegInit(0.U(packetSize.W))
  val shrMiso  = RegInit(0.U(packetSize.W))
  val bitCount = RegInit(0.U(8.W))

  when(csnFalling) {
    shrMiso  := Cat(
      io.data.temperature.asUInt,
      io.data.pEffort.asUInt,
      io.data.iEffort.asUInt,
      io.data.dEffort.asUInt,
      io.data.totEffort.asUInt,
    )
    bitCount := 0.U
  }.elsewhen(!csn && sckFalling) {
    shrMiso := shrMiso << 1
  }.elsewhen(!csn && sckRising) {
    shrMosi := Cat(shrMosi(packetSize - 2, 0), mosi)
    bitCount := bitCount + 1.U
  }

  io.miso := shrMiso(packetSize - 1)

  val setPointReg = RegInit(301989888.S(32.W))
  val enableReg   = RegInit(1.B)

  val packetUpdateToggle = RegInit(0.B)
  when(csnRising && bitCount === packetSize.U) {
    setPointReg        := shrMosi(159, 128).asSInt
    enableReg          := shrMosi(96)
    packetUpdateToggle := !packetUpdateToggle
  }
  io.packetUpdate := packetUpdateToggle

  io.data.setPoint := setPointReg
  io.data.enable   := enableReg
}