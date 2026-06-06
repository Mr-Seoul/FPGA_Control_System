package controller

import chisel3._
import chisel3.util._

class TemperatureLookupIO() extends Bundle {
}

class TemperatureLookup() extends Module {
  val io = IO(new TemperatureLookupIO())
}