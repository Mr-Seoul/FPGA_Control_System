package controller

import chisel3._
import chisel3.experimental.FixedPoint
import chisel3.util._

class SPIData extends Bundle {
  val setPoint   = Output(SInt(config.fixedWidth.W))
  val enable     = Output(Bool())

  val temperature = Input(SInt(config.fixedWidth.W))
  val pEffort     = Input(SInt(config.fixedWidth.W))
  val iEffort     = Input(SInt(config.fixedWidth.W))
  val dEffort     = Input(SInt(config.fixedWidth.W))
  val totEffort   = Input(SInt(config.fixedWidth.W))
}

class SPIIO extends Bundle {
  val sck  = Input(Bool())
  val mosi = Input(Bool())
  val miso = Output(Bool())
  val csN = Input(Bool())

  val packetUpdate = Output(Bool())

  val data = new SPIData()
}

class SPI extends Module {
  val packetSize = config.fixedWidth*5

  val io = IO(new SPIIO())

  val sck  = io.sck
  val mosi = io.mosi
  val csn  = io.csN

  val regSckPrev = RegNext(sck, 0.B)
  val regCsnPrev = RegNext(csn, 1.B)

  val sckRising  = sck  && !regSckPrev
  val sckFalling = !sck  && regSckPrev
  val csnFalling = !csn && regCsnPrev
  val csnRising  = csn  && !regCsnPrev

  val regShrMosi  = RegInit(0.U(packetSize.W))
  val regShrMiso  = RegInit(0.U(packetSize.W))
  val regBitCount = RegInit(0.U(8.W))

  when(csnFalling) {
    regShrMiso  := Cat(
      io.data.temperature.asUInt,
      io.data.pEffort.asUInt,
      io.data.iEffort.asUInt,
      io.data.dEffort.asUInt,
      io.data.totEffort.asUInt,
    )
    regBitCount := 0.U
  }.elsewhen(!csn && sckFalling) {
    regShrMiso  := regShrMiso << 1
  }.elsewhen(!csn && sckRising) {
    regShrMosi  := Cat(regShrMosi(packetSize - 2, 0), mosi)
    regBitCount := regBitCount + 1.U
  }

  io.miso := regShrMiso(packetSize - 1)

  val regSetPoint = RegInit(301989888.S(32.W))
  val regEnable   = RegInit(1.B)

  val regPacketToggle = RegInit(0.B)
  when(csnRising && regBitCount >= packetSize.U) {
    regSetPoint        := regShrMosi(159, 128).asSInt
    regEnable          := regShrMosi(96)
    regPacketToggle    := !regPacketToggle
  }
  io.packetUpdate  := regPacketToggle

  io.data.setPoint := regSetPoint
  io.data.enable   := regEnable
}