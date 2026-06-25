package controller

import chisel3._
import chisel3.util._

class SSegDecoderIO() extends Bundle {
  val in = Input(UInt(7.W))
  val out = Output(UInt(7.W))
}

class SSegDecoder() extends Module {
  val io = IO(new SSegDecoderIO())

  val sevSeg = WireDefault(0.U(7.W))

  switch(io.in) {
    is(0.U) { sevSeg := "b0111111".U } // '0'
    is(1.U) { sevSeg := "b0000110".U } // '1'
    is(2.U) { sevSeg := "b1011011".U } // '2'
    is(3.U) { sevSeg := "b1001111".U } // '3'
    is(4.U) { sevSeg := "b1100110".U } // '4'
    is(5.U) { sevSeg := "b1101101".U } // '5'
    is(6.U) { sevSeg := "b1111101".U } // '6'
    is(7.U) { sevSeg := "b0000111".U } // '7'
    is(8.U) { sevSeg := "b1111111".U } // '8'
    is(9.U) { sevSeg := "b1101111".U } // '9'

    is(48.U) { sevSeg := "b0111111".U } // '0'
    is(49.U) { sevSeg := "b0000110".U } // '1'
    is(50.U) { sevSeg := "b1011011".U } // '2'
    is(51.U) { sevSeg := "b1001111".U } // '3'
    is(52.U) { sevSeg := "b1100110".U } // '4'
    is(53.U) { sevSeg := "b1101101".U } // '5'
    is(54.U) { sevSeg := "b1111101".U } // '6'
    is(55.U) { sevSeg := "b0000111".U } // '7'
    is(56.U) { sevSeg := "b1111111".U } // '8'
    is(57.U) { sevSeg := "b1101111".U } // '9'

    is(61.U) { sevSeg := "b1001000".U } // '='

    is(65.U) { sevSeg := "b1110111".U } // 'A'
    is(66.U) { sevSeg := "b1111100".U } // 'B'
    is(67.U) { sevSeg := "b0111001".U } // 'C'
    is(68.U) { sevSeg := "b1011110".U } // 'D'
    is(69.U) { sevSeg := "b1111001".U } // 'E'
    is(70.U) { sevSeg := "b1110001".U } // 'F'
    is(71.U) { sevSeg := "b0111101".U } // 'G'
    is(72.U) { sevSeg := "b1110110".U } // 'H'
    is(73.U) { sevSeg := "b0000110".U } // 'I'
    is(74.U) { sevSeg := "b0001110".U } // 'J'
    is(75.U) { sevSeg := "b1110101".U } // 'K'
    is(76.U) { sevSeg := "b0111000".U } // 'L'
    is(77.U) { sevSeg := "b0110111".U } // 'M'
    is(78.U) { sevSeg := "b0110111".U } // 'N'
    is(79.U) { sevSeg := "b0111111".U } // 'O'
    is(80.U) { sevSeg := "b1110011".U } // 'P'
    is(81.U) { sevSeg := "b1100111".U } // 'Q'
    is(82.U) { sevSeg := "b1010000".U } // 'R'
    is(83.U) { sevSeg := "b1101101".U } // 'S'
    is(84.U) { sevSeg := "b1110000".U } // 'T'
    is(85.U) { sevSeg := "b0111110".U } // 'U'
    is(86.U) { sevSeg := "b0011100".U } // 'V'
    is(87.U) { sevSeg := "b0111110".U } // 'W'
    is(88.U) { sevSeg := "b1110110".U } // 'X'
    is(89.U) { sevSeg := "b1101110".U } // 'Y'
    is(90.U) { sevSeg := "b1011011".U } // 'Z'

    is(97.U)  { sevSeg := "b1011111".U } // 'a'
    is(98.U)  { sevSeg := "b1111100".U } // 'b'
    is(99.U)  { sevSeg := "b1011000".U } // 'c'
    is(100.U) { sevSeg := "b1011110".U } // 'd'
    is(101.U) { sevSeg := "b1111011".U } // 'e'
    is(102.U) { sevSeg := "b1110001".U } // 'f'
    is(103.U) { sevSeg := "b1101111".U } // 'g'
    is(104.U) { sevSeg := "b1110100".U } // 'h'
    is(105.U) { sevSeg := "b0000100".U } // 'i'
    is(106.U) { sevSeg := "b0001100".U } // 'j'
    is(107.U) { sevSeg := "b1110101".U } // 'k'
    is(108.U) { sevSeg := "b0011000".U } // 'l'
    is(109.U) { sevSeg := "b0110111".U } // 'm'
    is(110.U) { sevSeg := "b1010100".U } // 'n'
    is(111.U) { sevSeg := "b1011100".U } // 'o'
    is(112.U) { sevSeg := "b1110011".U } // 'p'
    is(113.U) { sevSeg := "b1100111".U } // 'q'
    is(114.U) { sevSeg := "b1010000".U } // 'r'
    is(115.U) { sevSeg := "b1101101".U } // 's'
    is(116.U) { sevSeg := "b1110000".U } // 't'
    is(117.U) { sevSeg := "b0011100".U } // 'v'
    is(118.U) { sevSeg := "b0011100".U } // 'w'
    is(119.U) { sevSeg := "b1110110".U } // 'x'
    is(120.U) { sevSeg := "b1101110".U } // 'y'
    is(121.U) { sevSeg := "b1011011".U } // 'z'
  }

  io.out := sevSeg
}