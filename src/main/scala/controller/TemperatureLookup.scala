package controller

import chisel3._
import chisel3.util._
import chisel3.experimental.FixedPoint
import java.io.File

import scala.io.Source

class TemperatureLookupIO() extends Bundle {
  val in = Input(UInt(config.ADCWidth.W))
  val out = Output(FixedPoint(config.fixedWidth.W,config.decimalWidth.BP))
}

class TemperatureLookup() extends Module {
  val io = IO(new TemperatureLookupIO())

  val file = new File("ADCDesign/lookup.hex")
  require(file.exists(), s"Error: No file at ${file.getAbsolutePath}")

  val hexData = Source.fromFile(file).getLines().toList
  val nums = hexData.map(line => BigInt(line.trim, 16))

  val lookupData = nums.map{ value =>value.asUInt(config.fixedWidth.W).asFixedPoint(config.decimalWidth.BP)}

  val table = VecInit(lookupData)

  val regOut = RegNext(table(io.in))

  io.out := regOut

}