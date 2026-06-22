package controller

import chisel3._
import chisel3.util._
import chisel3.experimental.FixedPoint
import chisel3.util.experimental.loadMemoryFromFileInline

class TemperatureLookupIO() extends Bundle {
  val in = Input(UInt(config.ADCWidth.W))
  val out = Output(FixedPoint(config.fixedWidth.W,config.decimalWidth.BP))
}

class TemperatureLookup() extends Module {
  val io = IO(new TemperatureLookupIO())

  val mem = SyncReadMem(256, FixedPoint(config.fixedWidth.W,config.decimalWidth.BP))

  loadMemoryFromFileInline(mem, "lookup.mem")

  io.out := mem.read(io.in)

}