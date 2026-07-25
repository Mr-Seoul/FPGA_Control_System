package controller

import chisel3._
import chisel3.util._

import scala.io.Source
import java.io.File


class SSegDecoderIO() extends Bundle {
  val in  = Input(UInt(7.W))
  val out = Output(UInt(7.W))
}

class SSegDecoder() extends Module {
  val io = IO(new SSegDecoderIO())

  val file = new File("src/main/scala/controller/SSEGLookup.hex")
  require(file.exists(), s"Error: No file at ${file.getAbsolutePath}")

  val hexData = Source.fromFile(file).getLines().toList
  val nums    = hexData.map(line => BigInt(line.trim, 16))

  val lookupData = nums.map{ value =>value.U(7.W)}

  val table = VecInit(lookupData)

  io.out := table(io.in)
}