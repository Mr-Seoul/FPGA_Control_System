module ADC(
  input        clock,
  input        reset,
  input        io_in, // @[\\src\\main\\scala\\controller\\ADC.scala 14:14]
  output [7:0] io_out, // @[\\src\\main\\scala\\controller\\ADC.scala 14:14]
  output [7:0] io_DACOut // @[\\src\\main\\scala\\controller\\ADC.scala 14:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] state; // @[\\src\\main\\scala\\controller\\ADC.scala 19:22]
  reg  curTest_0; // @[\\src\\main\\scala\\controller\\ADC.scala 21:24]
  reg  curTest_1; // @[\\src\\main\\scala\\controller\\ADC.scala 21:24]
  reg  curTest_2; // @[\\src\\main\\scala\\controller\\ADC.scala 21:24]
  reg  curTest_3; // @[\\src\\main\\scala\\controller\\ADC.scala 21:24]
  reg  curTest_4; // @[\\src\\main\\scala\\controller\\ADC.scala 21:24]
  reg  curTest_5; // @[\\src\\main\\scala\\controller\\ADC.scala 21:24]
  reg  curTest_6; // @[\\src\\main\\scala\\controller\\ADC.scala 21:24]
  reg  curTest_7; // @[\\src\\main\\scala\\controller\\ADC.scala 21:24]
  wire [7:0] _io_DACOut_T = {curTest_7,curTest_6,curTest_5,curTest_4,curTest_3,curTest_2,curTest_1,curTest_0}; // @[\\src\\main\\scala\\controller\\ADC.scala 22:24]
  wire  _T = state == 2'h0; // @[\\src\\main\\scala\\controller\\ADC.scala 26:46]
  reg [9:0] sampleCnt; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
  wire  wrap_wrap = sampleCnt == 10'h289; // @[src/main/scala/chisel3/util/Counter.scala 73:24]
  wire [9:0] _wrap_value_T_1 = sampleCnt + 10'h1; // @[src/main/scala/chisel3/util/Counter.scala 77:24]
  wire  sampleWrap = _T & wrap_wrap; // @[src/main/scala/chisel3/util/Counter.scala 118:{16,23} 117:24]
  reg [2:0] bitCnt; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
  wire  wrap_wrap_1 = bitCnt == 3'h7; // @[src/main/scala/chisel3/util/Counter.scala 73:24]
  wire [2:0] _wrap_value_T_3 = bitCnt + 3'h1; // @[src/main/scala/chisel3/util/Counter.scala 77:24]
  wire  incBit = 2'h0 == state ? 1'h0 : 2'h1 == state; // @[\\src\\main\\scala\\controller\\ADC.scala 24:10 32:17]
  wire [2:0] _GEN_3 = incBit ? _wrap_value_T_3 : bitCnt; // @[src/main/scala/chisel3/util/Counter.scala 118:16 77:15 61:40]
  reg [7:0] regOutput; // @[\\src\\main\\scala\\controller\\ADC.scala 28:26]
  wire [2:0] _T_3 = 3'h7 - bitCnt; // @[\\src\\main\\scala\\controller\\ADC.scala 36:25]
  wire  _GEN_13 = 3'h0 == _T_3 | curTest_0; // @[\\src\\main\\scala\\controller\\ADC.scala 21:24 38:{35,35}]
  wire  _GEN_14 = 3'h1 == _T_3 | curTest_1; // @[\\src\\main\\scala\\controller\\ADC.scala 21:24 38:{35,35}]
  wire  _GEN_15 = 3'h2 == _T_3 | curTest_2; // @[\\src\\main\\scala\\controller\\ADC.scala 21:24 38:{35,35}]
  wire  _GEN_16 = 3'h3 == _T_3 | curTest_3; // @[\\src\\main\\scala\\controller\\ADC.scala 21:24 38:{35,35}]
  wire  _GEN_17 = 3'h4 == _T_3 | curTest_4; // @[\\src\\main\\scala\\controller\\ADC.scala 21:24 38:{35,35}]
  wire  _GEN_18 = 3'h5 == _T_3 | curTest_5; // @[\\src\\main\\scala\\controller\\ADC.scala 21:24 38:{35,35}]
  wire  _GEN_19 = 3'h6 == _T_3 | curTest_6; // @[\\src\\main\\scala\\controller\\ADC.scala 21:24 38:{35,35}]
  wire  _GEN_20 = 3'h7 == _T_3 | curTest_7; // @[\\src\\main\\scala\\controller\\ADC.scala 21:24 38:{35,35}]
  assign io_out = regOutput; // @[\\src\\main\\scala\\controller\\ADC.scala 61:10]
  assign io_DACOut = _io_DACOut_T - 8'h1; // @[\\src\\main\\scala\\controller\\ADC.scala 22:31]
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\ADC.scala 32:17]
      state <= 2'h0; // @[\\src\\main\\scala\\controller\\ADC.scala 34:24 35:15 19:22]
    end else if (2'h0 == state) begin // @[\\src\\main\\scala\\controller\\ADC.scala 32:17]
      if (sampleWrap) begin // @[\\src\\main\\scala\\controller\\ADC.scala 44:33]
        state <= 2'h1; // @[\\src\\main\\scala\\controller\\ADC.scala 45:15]
      end
    end else if (2'h1 == state) begin // @[\\src\\main\\scala\\controller\\ADC.scala 32:17]
      if (wrap_wrap_1) begin // @[\\src\\main\\scala\\controller\\ADC.scala 52:13]
        state <= 2'h2;
      end else begin
        state <= 2'h0;
      end
    end else if (2'h2 == state) begin // @[\\src\\main\\scala\\controller\\ADC.scala 19:22]
      state <= 2'h0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\ADC.scala 32:17]
      curTest_0 <= 1'h0; // @[\\src\\main\\scala\\controller\\ADC.scala 21:24 34:24 36:{35,35}]
    end else if (2'h0 == state) begin // @[\\src\\main\\scala\\controller\\ADC.scala 32:17]
      if (sampleWrap) begin // @[\\src\\main\\scala\\controller\\ADC.scala 21:24]
        if (3'h0 == _T_3) begin
          curTest_0 <= io_in;
        end
      end else begin
        curTest_0 <= _GEN_13;
      end
    end else if (!(2'h1 == state)) begin // @[\\src\\main\\scala\\controller\\ADC.scala 32:17]
      if (2'h2 == state) begin // @[\\src\\main\\scala\\controller\\ADC.scala 21:24]
        curTest_0 <= 1'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\ADC.scala 32:17]
      curTest_1 <= 1'h0; // @[\\src\\main\\scala\\controller\\ADC.scala 21:24 34:24 36:{35,35}]
    end else if (2'h0 == state) begin // @[\\src\\main\\scala\\controller\\ADC.scala 32:17]
      if (sampleWrap) begin // @[\\src\\main\\scala\\controller\\ADC.scala 21:24]
        if (3'h1 == _T_3) begin
          curTest_1 <= io_in;
        end
      end else begin
        curTest_1 <= _GEN_14;
      end
    end else if (!(2'h1 == state)) begin // @[\\src\\main\\scala\\controller\\ADC.scala 32:17]
      if (2'h2 == state) begin // @[\\src\\main\\scala\\controller\\ADC.scala 21:24]
        curTest_1 <= 1'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\ADC.scala 32:17]
      curTest_2 <= 1'h0; // @[\\src\\main\\scala\\controller\\ADC.scala 21:24 34:24 36:{35,35}]
    end else if (2'h0 == state) begin // @[\\src\\main\\scala\\controller\\ADC.scala 32:17]
      if (sampleWrap) begin // @[\\src\\main\\scala\\controller\\ADC.scala 21:24]
        if (3'h2 == _T_3) begin
          curTest_2 <= io_in;
        end
      end else begin
        curTest_2 <= _GEN_15;
      end
    end else if (!(2'h1 == state)) begin // @[\\src\\main\\scala\\controller\\ADC.scala 32:17]
      if (2'h2 == state) begin // @[\\src\\main\\scala\\controller\\ADC.scala 21:24]
        curTest_2 <= 1'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\ADC.scala 32:17]
      curTest_3 <= 1'h0; // @[\\src\\main\\scala\\controller\\ADC.scala 21:24 34:24 36:{35,35}]
    end else if (2'h0 == state) begin // @[\\src\\main\\scala\\controller\\ADC.scala 32:17]
      if (sampleWrap) begin // @[\\src\\main\\scala\\controller\\ADC.scala 21:24]
        if (3'h3 == _T_3) begin
          curTest_3 <= io_in;
        end
      end else begin
        curTest_3 <= _GEN_16;
      end
    end else if (!(2'h1 == state)) begin // @[\\src\\main\\scala\\controller\\ADC.scala 32:17]
      if (2'h2 == state) begin // @[\\src\\main\\scala\\controller\\ADC.scala 21:24]
        curTest_3 <= 1'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\ADC.scala 32:17]
      curTest_4 <= 1'h0; // @[\\src\\main\\scala\\controller\\ADC.scala 21:24 34:24 36:{35,35}]
    end else if (2'h0 == state) begin // @[\\src\\main\\scala\\controller\\ADC.scala 32:17]
      if (sampleWrap) begin // @[\\src\\main\\scala\\controller\\ADC.scala 21:24]
        if (3'h4 == _T_3) begin
          curTest_4 <= io_in;
        end
      end else begin
        curTest_4 <= _GEN_17;
      end
    end else if (!(2'h1 == state)) begin // @[\\src\\main\\scala\\controller\\ADC.scala 32:17]
      if (2'h2 == state) begin // @[\\src\\main\\scala\\controller\\ADC.scala 21:24]
        curTest_4 <= 1'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\ADC.scala 32:17]
      curTest_5 <= 1'h0; // @[\\src\\main\\scala\\controller\\ADC.scala 21:24 34:24 36:{35,35}]
    end else if (2'h0 == state) begin // @[\\src\\main\\scala\\controller\\ADC.scala 32:17]
      if (sampleWrap) begin // @[\\src\\main\\scala\\controller\\ADC.scala 21:24]
        if (3'h5 == _T_3) begin
          curTest_5 <= io_in;
        end
      end else begin
        curTest_5 <= _GEN_18;
      end
    end else if (!(2'h1 == state)) begin // @[\\src\\main\\scala\\controller\\ADC.scala 32:17]
      if (2'h2 == state) begin // @[\\src\\main\\scala\\controller\\ADC.scala 21:24]
        curTest_5 <= 1'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\ADC.scala 32:17]
      curTest_6 <= 1'h0; // @[\\src\\main\\scala\\controller\\ADC.scala 21:24 34:24 36:{35,35}]
    end else if (2'h0 == state) begin // @[\\src\\main\\scala\\controller\\ADC.scala 32:17]
      if (sampleWrap) begin // @[\\src\\main\\scala\\controller\\ADC.scala 21:24]
        if (3'h6 == _T_3) begin
          curTest_6 <= io_in;
        end
      end else begin
        curTest_6 <= _GEN_19;
      end
    end else if (!(2'h1 == state)) begin // @[\\src\\main\\scala\\controller\\ADC.scala 32:17]
      if (2'h2 == state) begin // @[\\src\\main\\scala\\controller\\ADC.scala 21:24]
        curTest_6 <= 1'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\ADC.scala 32:17]
      curTest_7 <= 1'h0; // @[\\src\\main\\scala\\controller\\ADC.scala 21:24 34:24 36:{35,35}]
    end else if (2'h0 == state) begin // @[\\src\\main\\scala\\controller\\ADC.scala 32:17]
      if (sampleWrap) begin // @[\\src\\main\\scala\\controller\\ADC.scala 21:24]
        if (3'h7 == _T_3) begin
          curTest_7 <= io_in;
        end
      end else begin
        curTest_7 <= _GEN_20;
      end
    end else if (!(2'h1 == state)) begin // @[\\src\\main\\scala\\controller\\ADC.scala 32:17]
      if (2'h2 == state) begin // @[\\src\\main\\scala\\controller\\ADC.scala 21:24]
        curTest_7 <= 1'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[src/main/scala/chisel3/util/Counter.scala 118:16]
      sampleCnt <= 10'h0; // @[src/main/scala/chisel3/util/Counter.scala 77:15 87:{20,28}]
    end else if (_T) begin // @[src/main/scala/chisel3/util/Counter.scala 61:40]
      if (wrap_wrap) begin
        sampleCnt <= 10'h0;
      end else begin
        sampleCnt <= _wrap_value_T_1;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\ADC.scala 32:17]
      bitCnt <= 3'h0;
    end else if (2'h0 == state) begin // @[\\src\\main\\scala\\controller\\ADC.scala 32:17]
      bitCnt <= _GEN_3;
    end else if (2'h1 == state) begin // @[\\src\\main\\scala\\controller\\ADC.scala 32:17]
      bitCnt <= _GEN_3; // @[\\src\\main\\scala\\controller\\ADC.scala 53:14]
    end else if (2'h2 == state) begin
      bitCnt <= 3'h0;
    end else begin
      bitCnt <= _GEN_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\ADC.scala 32:17]
      regOutput <= 8'h0; // @[\\src\\main\\scala\\controller\\ADC.scala 28:26]
    end else if (!(2'h0 == state)) begin // @[\\src\\main\\scala\\controller\\ADC.scala 32:17]
      if (!(2'h1 == state)) begin // @[\\src\\main\\scala\\controller\\ADC.scala 32:17]
        if (2'h2 == state) begin // @[\\src\\main\\scala\\controller\\ADC.scala 28:26]
          regOutput <= _io_DACOut_T;
        end
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  curTest_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  curTest_1 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  curTest_2 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  curTest_3 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  curTest_4 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  curTest_5 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  curTest_6 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  curTest_7 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  sampleCnt = _RAND_9[9:0];
  _RAND_10 = {1{`RANDOM}};
  bitCnt = _RAND_10[2:0];
  _RAND_11 = {1{`RANDOM}};
  regOutput = _RAND_11[7:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    state = 2'h0;
  end
  if (reset) begin
    curTest_0 = 1'h0;
  end
  if (reset) begin
    curTest_1 = 1'h0;
  end
  if (reset) begin
    curTest_2 = 1'h0;
  end
  if (reset) begin
    curTest_3 = 1'h0;
  end
  if (reset) begin
    curTest_4 = 1'h0;
  end
  if (reset) begin
    curTest_5 = 1'h0;
  end
  if (reset) begin
    curTest_6 = 1'h0;
  end
  if (reset) begin
    curTest_7 = 1'h0;
  end
  if (reset) begin
    sampleCnt = 10'h0;
  end
  if (reset) begin
    bitCnt = 3'h0;
  end
  if (reset) begin
    regOutput = 8'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Accumulator(
  input         clock,
  input         reset,
  input  [15:0] io_in, // @[\\src\\main\\scala\\controller\\Accumulator.scala 15:14]
  output [24:0] io_out, // @[\\src\\main\\scala\\controller\\Accumulator.scala 15:14]
  output        io_valid // @[\\src\\main\\scala\\controller\\Accumulator.scala 15:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_96;
  reg [31:0] _RAND_97;
  reg [31:0] _RAND_98;
  reg [31:0] _RAND_99;
  reg [31:0] _RAND_100;
  reg [31:0] _RAND_101;
  reg [31:0] _RAND_102;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_105;
  reg [31:0] _RAND_106;
  reg [31:0] _RAND_107;
  reg [31:0] _RAND_108;
  reg [31:0] _RAND_109;
  reg [31:0] _RAND_110;
  reg [31:0] _RAND_111;
  reg [31:0] _RAND_112;
  reg [31:0] _RAND_113;
  reg [31:0] _RAND_114;
  reg [31:0] _RAND_115;
  reg [31:0] _RAND_116;
  reg [31:0] _RAND_117;
  reg [31:0] _RAND_118;
  reg [31:0] _RAND_119;
  reg [31:0] _RAND_120;
  reg [31:0] _RAND_121;
  reg [31:0] _RAND_122;
  reg [31:0] _RAND_123;
  reg [31:0] _RAND_124;
  reg [31:0] _RAND_125;
  reg [31:0] _RAND_126;
  reg [31:0] _RAND_127;
  reg [31:0] _RAND_128;
  reg [31:0] _RAND_129;
  reg [31:0] _RAND_130;
  reg [31:0] _RAND_131;
  reg [31:0] _RAND_132;
  reg [31:0] _RAND_133;
  reg [31:0] _RAND_134;
  reg [31:0] _RAND_135;
  reg [31:0] _RAND_136;
  reg [31:0] _RAND_137;
  reg [31:0] _RAND_138;
  reg [31:0] _RAND_139;
  reg [31:0] _RAND_140;
  reg [31:0] _RAND_141;
  reg [31:0] _RAND_142;
  reg [31:0] _RAND_143;
  reg [31:0] _RAND_144;
  reg [31:0] _RAND_145;
  reg [31:0] _RAND_146;
  reg [31:0] _RAND_147;
  reg [31:0] _RAND_148;
  reg [31:0] _RAND_149;
  reg [31:0] _RAND_150;
  reg [31:0] _RAND_151;
  reg [31:0] _RAND_152;
  reg [31:0] _RAND_153;
  reg [31:0] _RAND_154;
  reg [31:0] _RAND_155;
  reg [31:0] _RAND_156;
  reg [31:0] _RAND_157;
  reg [31:0] _RAND_158;
  reg [31:0] _RAND_159;
  reg [31:0] _RAND_160;
  reg [31:0] _RAND_161;
  reg [31:0] _RAND_162;
  reg [31:0] _RAND_163;
  reg [31:0] _RAND_164;
  reg [31:0] _RAND_165;
  reg [31:0] _RAND_166;
  reg [31:0] _RAND_167;
  reg [31:0] _RAND_168;
  reg [31:0] _RAND_169;
  reg [31:0] _RAND_170;
  reg [31:0] _RAND_171;
  reg [31:0] _RAND_172;
  reg [31:0] _RAND_173;
  reg [31:0] _RAND_174;
  reg [31:0] _RAND_175;
  reg [31:0] _RAND_176;
  reg [31:0] _RAND_177;
  reg [31:0] _RAND_178;
  reg [31:0] _RAND_179;
  reg [31:0] _RAND_180;
  reg [31:0] _RAND_181;
  reg [31:0] _RAND_182;
  reg [31:0] _RAND_183;
  reg [31:0] _RAND_184;
  reg [31:0] _RAND_185;
  reg [31:0] _RAND_186;
  reg [31:0] _RAND_187;
  reg [31:0] _RAND_188;
  reg [31:0] _RAND_189;
  reg [31:0] _RAND_190;
  reg [31:0] _RAND_191;
  reg [31:0] _RAND_192;
  reg [31:0] _RAND_193;
  reg [31:0] _RAND_194;
  reg [31:0] _RAND_195;
  reg [31:0] _RAND_196;
  reg [31:0] _RAND_197;
  reg [31:0] _RAND_198;
  reg [31:0] _RAND_199;
  reg [31:0] _RAND_200;
  reg [31:0] _RAND_201;
  reg [31:0] _RAND_202;
  reg [31:0] _RAND_203;
  reg [31:0] _RAND_204;
  reg [31:0] _RAND_205;
  reg [31:0] _RAND_206;
  reg [31:0] _RAND_207;
  reg [31:0] _RAND_208;
  reg [31:0] _RAND_209;
  reg [31:0] _RAND_210;
  reg [31:0] _RAND_211;
  reg [31:0] _RAND_212;
  reg [31:0] _RAND_213;
  reg [31:0] _RAND_214;
  reg [31:0] _RAND_215;
  reg [31:0] _RAND_216;
  reg [31:0] _RAND_217;
  reg [31:0] _RAND_218;
  reg [31:0] _RAND_219;
  reg [31:0] _RAND_220;
  reg [31:0] _RAND_221;
  reg [31:0] _RAND_222;
  reg [31:0] _RAND_223;
  reg [31:0] _RAND_224;
  reg [31:0] _RAND_225;
  reg [31:0] _RAND_226;
  reg [31:0] _RAND_227;
  reg [31:0] _RAND_228;
  reg [31:0] _RAND_229;
  reg [31:0] _RAND_230;
  reg [31:0] _RAND_231;
  reg [31:0] _RAND_232;
  reg [31:0] _RAND_233;
  reg [31:0] _RAND_234;
  reg [31:0] _RAND_235;
  reg [31:0] _RAND_236;
  reg [31:0] _RAND_237;
  reg [31:0] _RAND_238;
  reg [31:0] _RAND_239;
  reg [31:0] _RAND_240;
  reg [31:0] _RAND_241;
  reg [31:0] _RAND_242;
  reg [31:0] _RAND_243;
  reg [31:0] _RAND_244;
  reg [31:0] _RAND_245;
  reg [31:0] _RAND_246;
  reg [31:0] _RAND_247;
  reg [31:0] _RAND_248;
  reg [31:0] _RAND_249;
  reg [31:0] _RAND_250;
  reg [31:0] _RAND_251;
  reg [31:0] _RAND_252;
  reg [31:0] _RAND_253;
  reg [31:0] _RAND_254;
  reg [31:0] _RAND_255;
  reg [31:0] _RAND_256;
  reg [31:0] _RAND_257;
  reg [31:0] _RAND_258;
`endif // RANDOMIZE_REG_INIT
  reg [24:0] tot; // @[\\src\\main\\scala\\controller\\Accumulator.scala 16:20]
  reg [15:0] regChain_0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_1; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_2; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_3; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_4; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_5; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_6; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_7; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_8; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_9; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_10; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_11; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_12; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_13; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_14; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_15; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_16; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_17; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_18; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_19; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_20; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_21; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_22; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_23; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_24; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_25; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_26; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_27; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_28; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_29; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_30; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_31; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_32; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_33; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_34; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_35; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_36; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_37; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_38; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_39; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_40; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_41; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_42; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_43; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_44; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_45; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_46; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_47; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_48; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_49; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_50; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_51; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_52; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_53; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_54; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_55; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_56; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_57; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_58; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_59; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_60; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_61; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_62; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_63; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_64; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_65; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_66; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_67; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_68; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_69; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_70; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_71; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_72; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_73; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_74; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_75; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_76; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_77; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_78; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_79; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_80; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_81; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_82; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_83; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_84; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_85; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_86; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_87; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_88; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_89; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_90; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_91; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_92; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_93; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_94; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_95; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_96; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_97; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_98; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_99; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_100; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_101; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_102; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_103; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_104; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_105; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_106; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_107; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_108; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_109; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_110; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_111; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_112; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_113; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_114; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_115; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_116; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_117; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_118; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_119; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_120; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_121; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_122; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_123; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_124; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_125; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_126; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_127; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_128; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_129; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_130; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_131; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_132; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_133; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_134; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_135; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_136; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_137; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_138; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_139; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_140; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_141; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_142; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_143; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_144; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_145; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_146; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_147; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_148; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_149; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_150; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_151; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_152; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_153; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_154; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_155; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_156; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_157; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_158; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_159; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_160; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_161; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_162; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_163; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_164; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_165; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_166; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_167; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_168; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_169; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_170; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_171; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_172; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_173; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_174; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_175; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_176; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_177; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_178; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_179; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_180; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_181; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_182; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_183; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_184; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_185; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_186; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_187; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_188; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_189; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_190; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_191; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_192; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_193; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_194; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_195; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_196; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_197; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_198; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_199; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_200; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_201; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_202; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_203; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_204; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_205; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_206; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_207; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_208; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_209; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_210; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_211; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_212; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_213; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_214; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_215; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_216; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_217; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_218; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_219; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_220; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_221; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_222; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_223; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_224; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_225; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_226; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_227; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_228; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_229; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_230; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_231; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_232; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_233; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_234; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_235; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_236; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_237; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_238; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_239; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_240; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_241; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_242; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_243; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_244; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_245; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_246; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_247; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_248; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_249; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_250; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_251; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_252; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_253; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_254; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg [15:0] regChain_255; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
  reg  full; // @[\\src\\main\\scala\\controller\\Accumulator.scala 19:21]
  reg [7:0] cnt; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
  wire  wrap_wrap = cnt == 8'hff; // @[src/main/scala/chisel3/util/Counter.scala 73:24]
  wire [15:0] _diff_T_4 = $signed(io_in) - $signed(regChain_255); // @[\\src\\main\\scala\\controller\\Accumulator.scala 32:24]
  wire [17:0] diff = {{2{_diff_T_4[15]}},_diff_T_4}; // @[\\src\\main\\scala\\controller\\Accumulator.scala 31:18 32:8]
  wire [24:0] _GEN_260 = {{7{diff[17]}},diff}; // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:14]
  assign io_out = tot; // @[\\src\\main\\scala\\controller\\Accumulator.scala 35:19]
  assign io_valid = full; // @[\\src\\main\\scala\\controller\\Accumulator.scala 24:12]
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:14]
      tot <= 25'sh0;
    end else begin
      tot <= $signed(tot) + $signed(_GEN_260);
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_0 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_0 <= io_in; // @[\\src\\main\\scala\\controller\\Accumulator.scala 26:15]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_1 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_1 <= regChain_0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_2 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_2 <= regChain_1; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_3 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_3 <= regChain_2; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_4 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_4 <= regChain_3; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_5 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_5 <= regChain_4; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_6 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_6 <= regChain_5; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_7 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_7 <= regChain_6; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_8 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_8 <= regChain_7; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_9 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_9 <= regChain_8; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_10 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_10 <= regChain_9; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_11 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_11 <= regChain_10; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_12 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_12 <= regChain_11; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_13 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_13 <= regChain_12; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_14 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_14 <= regChain_13; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_15 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_15 <= regChain_14; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_16 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_16 <= regChain_15; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_17 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_17 <= regChain_16; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_18 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_18 <= regChain_17; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_19 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_19 <= regChain_18; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_20 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_20 <= regChain_19; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_21 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_21 <= regChain_20; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_22 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_22 <= regChain_21; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_23 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_23 <= regChain_22; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_24 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_24 <= regChain_23; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_25 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_25 <= regChain_24; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_26 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_26 <= regChain_25; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_27 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_27 <= regChain_26; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_28 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_28 <= regChain_27; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_29 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_29 <= regChain_28; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_30 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_30 <= regChain_29; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_31 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_31 <= regChain_30; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_32 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_32 <= regChain_31; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_33 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_33 <= regChain_32; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_34 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_34 <= regChain_33; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_35 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_35 <= regChain_34; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_36 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_36 <= regChain_35; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_37 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_37 <= regChain_36; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_38 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_38 <= regChain_37; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_39 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_39 <= regChain_38; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_40 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_40 <= regChain_39; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_41 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_41 <= regChain_40; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_42 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_42 <= regChain_41; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_43 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_43 <= regChain_42; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_44 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_44 <= regChain_43; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_45 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_45 <= regChain_44; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_46 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_46 <= regChain_45; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_47 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_47 <= regChain_46; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_48 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_48 <= regChain_47; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_49 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_49 <= regChain_48; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_50 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_50 <= regChain_49; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_51 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_51 <= regChain_50; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_52 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_52 <= regChain_51; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_53 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_53 <= regChain_52; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_54 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_54 <= regChain_53; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_55 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_55 <= regChain_54; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_56 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_56 <= regChain_55; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_57 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_57 <= regChain_56; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_58 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_58 <= regChain_57; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_59 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_59 <= regChain_58; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_60 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_60 <= regChain_59; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_61 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_61 <= regChain_60; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_62 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_62 <= regChain_61; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_63 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_63 <= regChain_62; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_64 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_64 <= regChain_63; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_65 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_65 <= regChain_64; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_66 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_66 <= regChain_65; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_67 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_67 <= regChain_66; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_68 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_68 <= regChain_67; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_69 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_69 <= regChain_68; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_70 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_70 <= regChain_69; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_71 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_71 <= regChain_70; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_72 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_72 <= regChain_71; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_73 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_73 <= regChain_72; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_74 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_74 <= regChain_73; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_75 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_75 <= regChain_74; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_76 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_76 <= regChain_75; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_77 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_77 <= regChain_76; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_78 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_78 <= regChain_77; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_79 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_79 <= regChain_78; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_80 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_80 <= regChain_79; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_81 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_81 <= regChain_80; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_82 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_82 <= regChain_81; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_83 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_83 <= regChain_82; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_84 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_84 <= regChain_83; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_85 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_85 <= regChain_84; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_86 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_86 <= regChain_85; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_87 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_87 <= regChain_86; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_88 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_88 <= regChain_87; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_89 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_89 <= regChain_88; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_90 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_90 <= regChain_89; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_91 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_91 <= regChain_90; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_92 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_92 <= regChain_91; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_93 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_93 <= regChain_92; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_94 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_94 <= regChain_93; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_95 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_95 <= regChain_94; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_96 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_96 <= regChain_95; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_97 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_97 <= regChain_96; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_98 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_98 <= regChain_97; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_99 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_99 <= regChain_98; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_100 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_100 <= regChain_99; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_101 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_101 <= regChain_100; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_102 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_102 <= regChain_101; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_103 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_103 <= regChain_102; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_104 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_104 <= regChain_103; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_105 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_105 <= regChain_104; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_106 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_106 <= regChain_105; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_107 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_107 <= regChain_106; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_108 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_108 <= regChain_107; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_109 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_109 <= regChain_108; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_110 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_110 <= regChain_109; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_111 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_111 <= regChain_110; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_112 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_112 <= regChain_111; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_113 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_113 <= regChain_112; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_114 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_114 <= regChain_113; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_115 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_115 <= regChain_114; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_116 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_116 <= regChain_115; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_117 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_117 <= regChain_116; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_118 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_118 <= regChain_117; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_119 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_119 <= regChain_118; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_120 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_120 <= regChain_119; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_121 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_121 <= regChain_120; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_122 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_122 <= regChain_121; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_123 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_123 <= regChain_122; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_124 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_124 <= regChain_123; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_125 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_125 <= regChain_124; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_126 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_126 <= regChain_125; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_127 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_127 <= regChain_126; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_128 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_128 <= regChain_127; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_129 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_129 <= regChain_128; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_130 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_130 <= regChain_129; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_131 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_131 <= regChain_130; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_132 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_132 <= regChain_131; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_133 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_133 <= regChain_132; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_134 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_134 <= regChain_133; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_135 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_135 <= regChain_134; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_136 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_136 <= regChain_135; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_137 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_137 <= regChain_136; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_138 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_138 <= regChain_137; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_139 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_139 <= regChain_138; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_140 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_140 <= regChain_139; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_141 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_141 <= regChain_140; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_142 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_142 <= regChain_141; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_143 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_143 <= regChain_142; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_144 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_144 <= regChain_143; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_145 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_145 <= regChain_144; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_146 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_146 <= regChain_145; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_147 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_147 <= regChain_146; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_148 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_148 <= regChain_147; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_149 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_149 <= regChain_148; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_150 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_150 <= regChain_149; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_151 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_151 <= regChain_150; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_152 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_152 <= regChain_151; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_153 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_153 <= regChain_152; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_154 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_154 <= regChain_153; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_155 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_155 <= regChain_154; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_156 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_156 <= regChain_155; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_157 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_157 <= regChain_156; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_158 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_158 <= regChain_157; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_159 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_159 <= regChain_158; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_160 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_160 <= regChain_159; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_161 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_161 <= regChain_160; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_162 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_162 <= regChain_161; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_163 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_163 <= regChain_162; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_164 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_164 <= regChain_163; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_165 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_165 <= regChain_164; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_166 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_166 <= regChain_165; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_167 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_167 <= regChain_166; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_168 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_168 <= regChain_167; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_169 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_169 <= regChain_168; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_170 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_170 <= regChain_169; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_171 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_171 <= regChain_170; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_172 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_172 <= regChain_171; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_173 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_173 <= regChain_172; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_174 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_174 <= regChain_173; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_175 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_175 <= regChain_174; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_176 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_176 <= regChain_175; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_177 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_177 <= regChain_176; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_178 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_178 <= regChain_177; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_179 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_179 <= regChain_178; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_180 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_180 <= regChain_179; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_181 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_181 <= regChain_180; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_182 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_182 <= regChain_181; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_183 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_183 <= regChain_182; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_184 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_184 <= regChain_183; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_185 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_185 <= regChain_184; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_186 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_186 <= regChain_185; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_187 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_187 <= regChain_186; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_188 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_188 <= regChain_187; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_189 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_189 <= regChain_188; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_190 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_190 <= regChain_189; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_191 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_191 <= regChain_190; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_192 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_192 <= regChain_191; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_193 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_193 <= regChain_192; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_194 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_194 <= regChain_193; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_195 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_195 <= regChain_194; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_196 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_196 <= regChain_195; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_197 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_197 <= regChain_196; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_198 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_198 <= regChain_197; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_199 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_199 <= regChain_198; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_200 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_200 <= regChain_199; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_201 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_201 <= regChain_200; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_202 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_202 <= regChain_201; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_203 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_203 <= regChain_202; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_204 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_204 <= regChain_203; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_205 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_205 <= regChain_204; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_206 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_206 <= regChain_205; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_207 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_207 <= regChain_206; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_208 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_208 <= regChain_207; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_209 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_209 <= regChain_208; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_210 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_210 <= regChain_209; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_211 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_211 <= regChain_210; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_212 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_212 <= regChain_211; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_213 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_213 <= regChain_212; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_214 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_214 <= regChain_213; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_215 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_215 <= regChain_214; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_216 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_216 <= regChain_215; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_217 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_217 <= regChain_216; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_218 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_218 <= regChain_217; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_219 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_219 <= regChain_218; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_220 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_220 <= regChain_219; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_221 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_221 <= regChain_220; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_222 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_222 <= regChain_221; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_223 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_223 <= regChain_222; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_224 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_224 <= regChain_223; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_225 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_225 <= regChain_224; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_226 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_226 <= regChain_225; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_227 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_227 <= regChain_226; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_228 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_228 <= regChain_227; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_229 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_229 <= regChain_228; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_230 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_230 <= regChain_229; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_231 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_231 <= regChain_230; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_232 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_232 <= regChain_231; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_233 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_233 <= regChain_232; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_234 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_234 <= regChain_233; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_235 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_235 <= regChain_234; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_236 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_236 <= regChain_235; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_237 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_237 <= regChain_236; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_238 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_238 <= regChain_237; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_239 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_239 <= regChain_238; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_240 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_240 <= regChain_239; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_241 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_241 <= regChain_240; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_242 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_242 <= regChain_241; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_243 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_243 <= regChain_242; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_244 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_244 <= regChain_243; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_245 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_245 <= regChain_244; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_246 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_246 <= regChain_245; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_247 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_247 <= regChain_246; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_248 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_248 <= regChain_247; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_249 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_249 <= regChain_248; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_250 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_250 <= regChain_249; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_251 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_251 <= regChain_250; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_252 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_252 <= regChain_251; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_253 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_253 <= regChain_252; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_254 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_254 <= regChain_253; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
      regChain_255 <= 16'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 39:19]
    end else begin
      regChain_255 <= regChain_254; // @[\\src\\main\\scala\\controller\\Accumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 21:18]
      full <= 1'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 22:10]
    end else begin
      full <= wrap_wrap | full; // @[\\src\\main\\scala\\controller\\Accumulator.scala 19:21]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[src/main/scala/chisel3/util/Counter.scala 77:24]
      cnt <= 8'h0;
    end else begin
      cnt <= cnt + 8'h1;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  tot = _RAND_0[24:0];
  _RAND_1 = {1{`RANDOM}};
  regChain_0 = _RAND_1[15:0];
  _RAND_2 = {1{`RANDOM}};
  regChain_1 = _RAND_2[15:0];
  _RAND_3 = {1{`RANDOM}};
  regChain_2 = _RAND_3[15:0];
  _RAND_4 = {1{`RANDOM}};
  regChain_3 = _RAND_4[15:0];
  _RAND_5 = {1{`RANDOM}};
  regChain_4 = _RAND_5[15:0];
  _RAND_6 = {1{`RANDOM}};
  regChain_5 = _RAND_6[15:0];
  _RAND_7 = {1{`RANDOM}};
  regChain_6 = _RAND_7[15:0];
  _RAND_8 = {1{`RANDOM}};
  regChain_7 = _RAND_8[15:0];
  _RAND_9 = {1{`RANDOM}};
  regChain_8 = _RAND_9[15:0];
  _RAND_10 = {1{`RANDOM}};
  regChain_9 = _RAND_10[15:0];
  _RAND_11 = {1{`RANDOM}};
  regChain_10 = _RAND_11[15:0];
  _RAND_12 = {1{`RANDOM}};
  regChain_11 = _RAND_12[15:0];
  _RAND_13 = {1{`RANDOM}};
  regChain_12 = _RAND_13[15:0];
  _RAND_14 = {1{`RANDOM}};
  regChain_13 = _RAND_14[15:0];
  _RAND_15 = {1{`RANDOM}};
  regChain_14 = _RAND_15[15:0];
  _RAND_16 = {1{`RANDOM}};
  regChain_15 = _RAND_16[15:0];
  _RAND_17 = {1{`RANDOM}};
  regChain_16 = _RAND_17[15:0];
  _RAND_18 = {1{`RANDOM}};
  regChain_17 = _RAND_18[15:0];
  _RAND_19 = {1{`RANDOM}};
  regChain_18 = _RAND_19[15:0];
  _RAND_20 = {1{`RANDOM}};
  regChain_19 = _RAND_20[15:0];
  _RAND_21 = {1{`RANDOM}};
  regChain_20 = _RAND_21[15:0];
  _RAND_22 = {1{`RANDOM}};
  regChain_21 = _RAND_22[15:0];
  _RAND_23 = {1{`RANDOM}};
  regChain_22 = _RAND_23[15:0];
  _RAND_24 = {1{`RANDOM}};
  regChain_23 = _RAND_24[15:0];
  _RAND_25 = {1{`RANDOM}};
  regChain_24 = _RAND_25[15:0];
  _RAND_26 = {1{`RANDOM}};
  regChain_25 = _RAND_26[15:0];
  _RAND_27 = {1{`RANDOM}};
  regChain_26 = _RAND_27[15:0];
  _RAND_28 = {1{`RANDOM}};
  regChain_27 = _RAND_28[15:0];
  _RAND_29 = {1{`RANDOM}};
  regChain_28 = _RAND_29[15:0];
  _RAND_30 = {1{`RANDOM}};
  regChain_29 = _RAND_30[15:0];
  _RAND_31 = {1{`RANDOM}};
  regChain_30 = _RAND_31[15:0];
  _RAND_32 = {1{`RANDOM}};
  regChain_31 = _RAND_32[15:0];
  _RAND_33 = {1{`RANDOM}};
  regChain_32 = _RAND_33[15:0];
  _RAND_34 = {1{`RANDOM}};
  regChain_33 = _RAND_34[15:0];
  _RAND_35 = {1{`RANDOM}};
  regChain_34 = _RAND_35[15:0];
  _RAND_36 = {1{`RANDOM}};
  regChain_35 = _RAND_36[15:0];
  _RAND_37 = {1{`RANDOM}};
  regChain_36 = _RAND_37[15:0];
  _RAND_38 = {1{`RANDOM}};
  regChain_37 = _RAND_38[15:0];
  _RAND_39 = {1{`RANDOM}};
  regChain_38 = _RAND_39[15:0];
  _RAND_40 = {1{`RANDOM}};
  regChain_39 = _RAND_40[15:0];
  _RAND_41 = {1{`RANDOM}};
  regChain_40 = _RAND_41[15:0];
  _RAND_42 = {1{`RANDOM}};
  regChain_41 = _RAND_42[15:0];
  _RAND_43 = {1{`RANDOM}};
  regChain_42 = _RAND_43[15:0];
  _RAND_44 = {1{`RANDOM}};
  regChain_43 = _RAND_44[15:0];
  _RAND_45 = {1{`RANDOM}};
  regChain_44 = _RAND_45[15:0];
  _RAND_46 = {1{`RANDOM}};
  regChain_45 = _RAND_46[15:0];
  _RAND_47 = {1{`RANDOM}};
  regChain_46 = _RAND_47[15:0];
  _RAND_48 = {1{`RANDOM}};
  regChain_47 = _RAND_48[15:0];
  _RAND_49 = {1{`RANDOM}};
  regChain_48 = _RAND_49[15:0];
  _RAND_50 = {1{`RANDOM}};
  regChain_49 = _RAND_50[15:0];
  _RAND_51 = {1{`RANDOM}};
  regChain_50 = _RAND_51[15:0];
  _RAND_52 = {1{`RANDOM}};
  regChain_51 = _RAND_52[15:0];
  _RAND_53 = {1{`RANDOM}};
  regChain_52 = _RAND_53[15:0];
  _RAND_54 = {1{`RANDOM}};
  regChain_53 = _RAND_54[15:0];
  _RAND_55 = {1{`RANDOM}};
  regChain_54 = _RAND_55[15:0];
  _RAND_56 = {1{`RANDOM}};
  regChain_55 = _RAND_56[15:0];
  _RAND_57 = {1{`RANDOM}};
  regChain_56 = _RAND_57[15:0];
  _RAND_58 = {1{`RANDOM}};
  regChain_57 = _RAND_58[15:0];
  _RAND_59 = {1{`RANDOM}};
  regChain_58 = _RAND_59[15:0];
  _RAND_60 = {1{`RANDOM}};
  regChain_59 = _RAND_60[15:0];
  _RAND_61 = {1{`RANDOM}};
  regChain_60 = _RAND_61[15:0];
  _RAND_62 = {1{`RANDOM}};
  regChain_61 = _RAND_62[15:0];
  _RAND_63 = {1{`RANDOM}};
  regChain_62 = _RAND_63[15:0];
  _RAND_64 = {1{`RANDOM}};
  regChain_63 = _RAND_64[15:0];
  _RAND_65 = {1{`RANDOM}};
  regChain_64 = _RAND_65[15:0];
  _RAND_66 = {1{`RANDOM}};
  regChain_65 = _RAND_66[15:0];
  _RAND_67 = {1{`RANDOM}};
  regChain_66 = _RAND_67[15:0];
  _RAND_68 = {1{`RANDOM}};
  regChain_67 = _RAND_68[15:0];
  _RAND_69 = {1{`RANDOM}};
  regChain_68 = _RAND_69[15:0];
  _RAND_70 = {1{`RANDOM}};
  regChain_69 = _RAND_70[15:0];
  _RAND_71 = {1{`RANDOM}};
  regChain_70 = _RAND_71[15:0];
  _RAND_72 = {1{`RANDOM}};
  regChain_71 = _RAND_72[15:0];
  _RAND_73 = {1{`RANDOM}};
  regChain_72 = _RAND_73[15:0];
  _RAND_74 = {1{`RANDOM}};
  regChain_73 = _RAND_74[15:0];
  _RAND_75 = {1{`RANDOM}};
  regChain_74 = _RAND_75[15:0];
  _RAND_76 = {1{`RANDOM}};
  regChain_75 = _RAND_76[15:0];
  _RAND_77 = {1{`RANDOM}};
  regChain_76 = _RAND_77[15:0];
  _RAND_78 = {1{`RANDOM}};
  regChain_77 = _RAND_78[15:0];
  _RAND_79 = {1{`RANDOM}};
  regChain_78 = _RAND_79[15:0];
  _RAND_80 = {1{`RANDOM}};
  regChain_79 = _RAND_80[15:0];
  _RAND_81 = {1{`RANDOM}};
  regChain_80 = _RAND_81[15:0];
  _RAND_82 = {1{`RANDOM}};
  regChain_81 = _RAND_82[15:0];
  _RAND_83 = {1{`RANDOM}};
  regChain_82 = _RAND_83[15:0];
  _RAND_84 = {1{`RANDOM}};
  regChain_83 = _RAND_84[15:0];
  _RAND_85 = {1{`RANDOM}};
  regChain_84 = _RAND_85[15:0];
  _RAND_86 = {1{`RANDOM}};
  regChain_85 = _RAND_86[15:0];
  _RAND_87 = {1{`RANDOM}};
  regChain_86 = _RAND_87[15:0];
  _RAND_88 = {1{`RANDOM}};
  regChain_87 = _RAND_88[15:0];
  _RAND_89 = {1{`RANDOM}};
  regChain_88 = _RAND_89[15:0];
  _RAND_90 = {1{`RANDOM}};
  regChain_89 = _RAND_90[15:0];
  _RAND_91 = {1{`RANDOM}};
  regChain_90 = _RAND_91[15:0];
  _RAND_92 = {1{`RANDOM}};
  regChain_91 = _RAND_92[15:0];
  _RAND_93 = {1{`RANDOM}};
  regChain_92 = _RAND_93[15:0];
  _RAND_94 = {1{`RANDOM}};
  regChain_93 = _RAND_94[15:0];
  _RAND_95 = {1{`RANDOM}};
  regChain_94 = _RAND_95[15:0];
  _RAND_96 = {1{`RANDOM}};
  regChain_95 = _RAND_96[15:0];
  _RAND_97 = {1{`RANDOM}};
  regChain_96 = _RAND_97[15:0];
  _RAND_98 = {1{`RANDOM}};
  regChain_97 = _RAND_98[15:0];
  _RAND_99 = {1{`RANDOM}};
  regChain_98 = _RAND_99[15:0];
  _RAND_100 = {1{`RANDOM}};
  regChain_99 = _RAND_100[15:0];
  _RAND_101 = {1{`RANDOM}};
  regChain_100 = _RAND_101[15:0];
  _RAND_102 = {1{`RANDOM}};
  regChain_101 = _RAND_102[15:0];
  _RAND_103 = {1{`RANDOM}};
  regChain_102 = _RAND_103[15:0];
  _RAND_104 = {1{`RANDOM}};
  regChain_103 = _RAND_104[15:0];
  _RAND_105 = {1{`RANDOM}};
  regChain_104 = _RAND_105[15:0];
  _RAND_106 = {1{`RANDOM}};
  regChain_105 = _RAND_106[15:0];
  _RAND_107 = {1{`RANDOM}};
  regChain_106 = _RAND_107[15:0];
  _RAND_108 = {1{`RANDOM}};
  regChain_107 = _RAND_108[15:0];
  _RAND_109 = {1{`RANDOM}};
  regChain_108 = _RAND_109[15:0];
  _RAND_110 = {1{`RANDOM}};
  regChain_109 = _RAND_110[15:0];
  _RAND_111 = {1{`RANDOM}};
  regChain_110 = _RAND_111[15:0];
  _RAND_112 = {1{`RANDOM}};
  regChain_111 = _RAND_112[15:0];
  _RAND_113 = {1{`RANDOM}};
  regChain_112 = _RAND_113[15:0];
  _RAND_114 = {1{`RANDOM}};
  regChain_113 = _RAND_114[15:0];
  _RAND_115 = {1{`RANDOM}};
  regChain_114 = _RAND_115[15:0];
  _RAND_116 = {1{`RANDOM}};
  regChain_115 = _RAND_116[15:0];
  _RAND_117 = {1{`RANDOM}};
  regChain_116 = _RAND_117[15:0];
  _RAND_118 = {1{`RANDOM}};
  regChain_117 = _RAND_118[15:0];
  _RAND_119 = {1{`RANDOM}};
  regChain_118 = _RAND_119[15:0];
  _RAND_120 = {1{`RANDOM}};
  regChain_119 = _RAND_120[15:0];
  _RAND_121 = {1{`RANDOM}};
  regChain_120 = _RAND_121[15:0];
  _RAND_122 = {1{`RANDOM}};
  regChain_121 = _RAND_122[15:0];
  _RAND_123 = {1{`RANDOM}};
  regChain_122 = _RAND_123[15:0];
  _RAND_124 = {1{`RANDOM}};
  regChain_123 = _RAND_124[15:0];
  _RAND_125 = {1{`RANDOM}};
  regChain_124 = _RAND_125[15:0];
  _RAND_126 = {1{`RANDOM}};
  regChain_125 = _RAND_126[15:0];
  _RAND_127 = {1{`RANDOM}};
  regChain_126 = _RAND_127[15:0];
  _RAND_128 = {1{`RANDOM}};
  regChain_127 = _RAND_128[15:0];
  _RAND_129 = {1{`RANDOM}};
  regChain_128 = _RAND_129[15:0];
  _RAND_130 = {1{`RANDOM}};
  regChain_129 = _RAND_130[15:0];
  _RAND_131 = {1{`RANDOM}};
  regChain_130 = _RAND_131[15:0];
  _RAND_132 = {1{`RANDOM}};
  regChain_131 = _RAND_132[15:0];
  _RAND_133 = {1{`RANDOM}};
  regChain_132 = _RAND_133[15:0];
  _RAND_134 = {1{`RANDOM}};
  regChain_133 = _RAND_134[15:0];
  _RAND_135 = {1{`RANDOM}};
  regChain_134 = _RAND_135[15:0];
  _RAND_136 = {1{`RANDOM}};
  regChain_135 = _RAND_136[15:0];
  _RAND_137 = {1{`RANDOM}};
  regChain_136 = _RAND_137[15:0];
  _RAND_138 = {1{`RANDOM}};
  regChain_137 = _RAND_138[15:0];
  _RAND_139 = {1{`RANDOM}};
  regChain_138 = _RAND_139[15:0];
  _RAND_140 = {1{`RANDOM}};
  regChain_139 = _RAND_140[15:0];
  _RAND_141 = {1{`RANDOM}};
  regChain_140 = _RAND_141[15:0];
  _RAND_142 = {1{`RANDOM}};
  regChain_141 = _RAND_142[15:0];
  _RAND_143 = {1{`RANDOM}};
  regChain_142 = _RAND_143[15:0];
  _RAND_144 = {1{`RANDOM}};
  regChain_143 = _RAND_144[15:0];
  _RAND_145 = {1{`RANDOM}};
  regChain_144 = _RAND_145[15:0];
  _RAND_146 = {1{`RANDOM}};
  regChain_145 = _RAND_146[15:0];
  _RAND_147 = {1{`RANDOM}};
  regChain_146 = _RAND_147[15:0];
  _RAND_148 = {1{`RANDOM}};
  regChain_147 = _RAND_148[15:0];
  _RAND_149 = {1{`RANDOM}};
  regChain_148 = _RAND_149[15:0];
  _RAND_150 = {1{`RANDOM}};
  regChain_149 = _RAND_150[15:0];
  _RAND_151 = {1{`RANDOM}};
  regChain_150 = _RAND_151[15:0];
  _RAND_152 = {1{`RANDOM}};
  regChain_151 = _RAND_152[15:0];
  _RAND_153 = {1{`RANDOM}};
  regChain_152 = _RAND_153[15:0];
  _RAND_154 = {1{`RANDOM}};
  regChain_153 = _RAND_154[15:0];
  _RAND_155 = {1{`RANDOM}};
  regChain_154 = _RAND_155[15:0];
  _RAND_156 = {1{`RANDOM}};
  regChain_155 = _RAND_156[15:0];
  _RAND_157 = {1{`RANDOM}};
  regChain_156 = _RAND_157[15:0];
  _RAND_158 = {1{`RANDOM}};
  regChain_157 = _RAND_158[15:0];
  _RAND_159 = {1{`RANDOM}};
  regChain_158 = _RAND_159[15:0];
  _RAND_160 = {1{`RANDOM}};
  regChain_159 = _RAND_160[15:0];
  _RAND_161 = {1{`RANDOM}};
  regChain_160 = _RAND_161[15:0];
  _RAND_162 = {1{`RANDOM}};
  regChain_161 = _RAND_162[15:0];
  _RAND_163 = {1{`RANDOM}};
  regChain_162 = _RAND_163[15:0];
  _RAND_164 = {1{`RANDOM}};
  regChain_163 = _RAND_164[15:0];
  _RAND_165 = {1{`RANDOM}};
  regChain_164 = _RAND_165[15:0];
  _RAND_166 = {1{`RANDOM}};
  regChain_165 = _RAND_166[15:0];
  _RAND_167 = {1{`RANDOM}};
  regChain_166 = _RAND_167[15:0];
  _RAND_168 = {1{`RANDOM}};
  regChain_167 = _RAND_168[15:0];
  _RAND_169 = {1{`RANDOM}};
  regChain_168 = _RAND_169[15:0];
  _RAND_170 = {1{`RANDOM}};
  regChain_169 = _RAND_170[15:0];
  _RAND_171 = {1{`RANDOM}};
  regChain_170 = _RAND_171[15:0];
  _RAND_172 = {1{`RANDOM}};
  regChain_171 = _RAND_172[15:0];
  _RAND_173 = {1{`RANDOM}};
  regChain_172 = _RAND_173[15:0];
  _RAND_174 = {1{`RANDOM}};
  regChain_173 = _RAND_174[15:0];
  _RAND_175 = {1{`RANDOM}};
  regChain_174 = _RAND_175[15:0];
  _RAND_176 = {1{`RANDOM}};
  regChain_175 = _RAND_176[15:0];
  _RAND_177 = {1{`RANDOM}};
  regChain_176 = _RAND_177[15:0];
  _RAND_178 = {1{`RANDOM}};
  regChain_177 = _RAND_178[15:0];
  _RAND_179 = {1{`RANDOM}};
  regChain_178 = _RAND_179[15:0];
  _RAND_180 = {1{`RANDOM}};
  regChain_179 = _RAND_180[15:0];
  _RAND_181 = {1{`RANDOM}};
  regChain_180 = _RAND_181[15:0];
  _RAND_182 = {1{`RANDOM}};
  regChain_181 = _RAND_182[15:0];
  _RAND_183 = {1{`RANDOM}};
  regChain_182 = _RAND_183[15:0];
  _RAND_184 = {1{`RANDOM}};
  regChain_183 = _RAND_184[15:0];
  _RAND_185 = {1{`RANDOM}};
  regChain_184 = _RAND_185[15:0];
  _RAND_186 = {1{`RANDOM}};
  regChain_185 = _RAND_186[15:0];
  _RAND_187 = {1{`RANDOM}};
  regChain_186 = _RAND_187[15:0];
  _RAND_188 = {1{`RANDOM}};
  regChain_187 = _RAND_188[15:0];
  _RAND_189 = {1{`RANDOM}};
  regChain_188 = _RAND_189[15:0];
  _RAND_190 = {1{`RANDOM}};
  regChain_189 = _RAND_190[15:0];
  _RAND_191 = {1{`RANDOM}};
  regChain_190 = _RAND_191[15:0];
  _RAND_192 = {1{`RANDOM}};
  regChain_191 = _RAND_192[15:0];
  _RAND_193 = {1{`RANDOM}};
  regChain_192 = _RAND_193[15:0];
  _RAND_194 = {1{`RANDOM}};
  regChain_193 = _RAND_194[15:0];
  _RAND_195 = {1{`RANDOM}};
  regChain_194 = _RAND_195[15:0];
  _RAND_196 = {1{`RANDOM}};
  regChain_195 = _RAND_196[15:0];
  _RAND_197 = {1{`RANDOM}};
  regChain_196 = _RAND_197[15:0];
  _RAND_198 = {1{`RANDOM}};
  regChain_197 = _RAND_198[15:0];
  _RAND_199 = {1{`RANDOM}};
  regChain_198 = _RAND_199[15:0];
  _RAND_200 = {1{`RANDOM}};
  regChain_199 = _RAND_200[15:0];
  _RAND_201 = {1{`RANDOM}};
  regChain_200 = _RAND_201[15:0];
  _RAND_202 = {1{`RANDOM}};
  regChain_201 = _RAND_202[15:0];
  _RAND_203 = {1{`RANDOM}};
  regChain_202 = _RAND_203[15:0];
  _RAND_204 = {1{`RANDOM}};
  regChain_203 = _RAND_204[15:0];
  _RAND_205 = {1{`RANDOM}};
  regChain_204 = _RAND_205[15:0];
  _RAND_206 = {1{`RANDOM}};
  regChain_205 = _RAND_206[15:0];
  _RAND_207 = {1{`RANDOM}};
  regChain_206 = _RAND_207[15:0];
  _RAND_208 = {1{`RANDOM}};
  regChain_207 = _RAND_208[15:0];
  _RAND_209 = {1{`RANDOM}};
  regChain_208 = _RAND_209[15:0];
  _RAND_210 = {1{`RANDOM}};
  regChain_209 = _RAND_210[15:0];
  _RAND_211 = {1{`RANDOM}};
  regChain_210 = _RAND_211[15:0];
  _RAND_212 = {1{`RANDOM}};
  regChain_211 = _RAND_212[15:0];
  _RAND_213 = {1{`RANDOM}};
  regChain_212 = _RAND_213[15:0];
  _RAND_214 = {1{`RANDOM}};
  regChain_213 = _RAND_214[15:0];
  _RAND_215 = {1{`RANDOM}};
  regChain_214 = _RAND_215[15:0];
  _RAND_216 = {1{`RANDOM}};
  regChain_215 = _RAND_216[15:0];
  _RAND_217 = {1{`RANDOM}};
  regChain_216 = _RAND_217[15:0];
  _RAND_218 = {1{`RANDOM}};
  regChain_217 = _RAND_218[15:0];
  _RAND_219 = {1{`RANDOM}};
  regChain_218 = _RAND_219[15:0];
  _RAND_220 = {1{`RANDOM}};
  regChain_219 = _RAND_220[15:0];
  _RAND_221 = {1{`RANDOM}};
  regChain_220 = _RAND_221[15:0];
  _RAND_222 = {1{`RANDOM}};
  regChain_221 = _RAND_222[15:0];
  _RAND_223 = {1{`RANDOM}};
  regChain_222 = _RAND_223[15:0];
  _RAND_224 = {1{`RANDOM}};
  regChain_223 = _RAND_224[15:0];
  _RAND_225 = {1{`RANDOM}};
  regChain_224 = _RAND_225[15:0];
  _RAND_226 = {1{`RANDOM}};
  regChain_225 = _RAND_226[15:0];
  _RAND_227 = {1{`RANDOM}};
  regChain_226 = _RAND_227[15:0];
  _RAND_228 = {1{`RANDOM}};
  regChain_227 = _RAND_228[15:0];
  _RAND_229 = {1{`RANDOM}};
  regChain_228 = _RAND_229[15:0];
  _RAND_230 = {1{`RANDOM}};
  regChain_229 = _RAND_230[15:0];
  _RAND_231 = {1{`RANDOM}};
  regChain_230 = _RAND_231[15:0];
  _RAND_232 = {1{`RANDOM}};
  regChain_231 = _RAND_232[15:0];
  _RAND_233 = {1{`RANDOM}};
  regChain_232 = _RAND_233[15:0];
  _RAND_234 = {1{`RANDOM}};
  regChain_233 = _RAND_234[15:0];
  _RAND_235 = {1{`RANDOM}};
  regChain_234 = _RAND_235[15:0];
  _RAND_236 = {1{`RANDOM}};
  regChain_235 = _RAND_236[15:0];
  _RAND_237 = {1{`RANDOM}};
  regChain_236 = _RAND_237[15:0];
  _RAND_238 = {1{`RANDOM}};
  regChain_237 = _RAND_238[15:0];
  _RAND_239 = {1{`RANDOM}};
  regChain_238 = _RAND_239[15:0];
  _RAND_240 = {1{`RANDOM}};
  regChain_239 = _RAND_240[15:0];
  _RAND_241 = {1{`RANDOM}};
  regChain_240 = _RAND_241[15:0];
  _RAND_242 = {1{`RANDOM}};
  regChain_241 = _RAND_242[15:0];
  _RAND_243 = {1{`RANDOM}};
  regChain_242 = _RAND_243[15:0];
  _RAND_244 = {1{`RANDOM}};
  regChain_243 = _RAND_244[15:0];
  _RAND_245 = {1{`RANDOM}};
  regChain_244 = _RAND_245[15:0];
  _RAND_246 = {1{`RANDOM}};
  regChain_245 = _RAND_246[15:0];
  _RAND_247 = {1{`RANDOM}};
  regChain_246 = _RAND_247[15:0];
  _RAND_248 = {1{`RANDOM}};
  regChain_247 = _RAND_248[15:0];
  _RAND_249 = {1{`RANDOM}};
  regChain_248 = _RAND_249[15:0];
  _RAND_250 = {1{`RANDOM}};
  regChain_249 = _RAND_250[15:0];
  _RAND_251 = {1{`RANDOM}};
  regChain_250 = _RAND_251[15:0];
  _RAND_252 = {1{`RANDOM}};
  regChain_251 = _RAND_252[15:0];
  _RAND_253 = {1{`RANDOM}};
  regChain_252 = _RAND_253[15:0];
  _RAND_254 = {1{`RANDOM}};
  regChain_253 = _RAND_254[15:0];
  _RAND_255 = {1{`RANDOM}};
  regChain_254 = _RAND_255[15:0];
  _RAND_256 = {1{`RANDOM}};
  regChain_255 = _RAND_256[15:0];
  _RAND_257 = {1{`RANDOM}};
  full = _RAND_257[0:0];
  _RAND_258 = {1{`RANDOM}};
  cnt = _RAND_258[7:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    tot = 25'sh0;
  end
  if (reset) begin
    regChain_0 = 16'h0;
  end
  if (reset) begin
    regChain_1 = 16'h0;
  end
  if (reset) begin
    regChain_2 = 16'h0;
  end
  if (reset) begin
    regChain_3 = 16'h0;
  end
  if (reset) begin
    regChain_4 = 16'h0;
  end
  if (reset) begin
    regChain_5 = 16'h0;
  end
  if (reset) begin
    regChain_6 = 16'h0;
  end
  if (reset) begin
    regChain_7 = 16'h0;
  end
  if (reset) begin
    regChain_8 = 16'h0;
  end
  if (reset) begin
    regChain_9 = 16'h0;
  end
  if (reset) begin
    regChain_10 = 16'h0;
  end
  if (reset) begin
    regChain_11 = 16'h0;
  end
  if (reset) begin
    regChain_12 = 16'h0;
  end
  if (reset) begin
    regChain_13 = 16'h0;
  end
  if (reset) begin
    regChain_14 = 16'h0;
  end
  if (reset) begin
    regChain_15 = 16'h0;
  end
  if (reset) begin
    regChain_16 = 16'h0;
  end
  if (reset) begin
    regChain_17 = 16'h0;
  end
  if (reset) begin
    regChain_18 = 16'h0;
  end
  if (reset) begin
    regChain_19 = 16'h0;
  end
  if (reset) begin
    regChain_20 = 16'h0;
  end
  if (reset) begin
    regChain_21 = 16'h0;
  end
  if (reset) begin
    regChain_22 = 16'h0;
  end
  if (reset) begin
    regChain_23 = 16'h0;
  end
  if (reset) begin
    regChain_24 = 16'h0;
  end
  if (reset) begin
    regChain_25 = 16'h0;
  end
  if (reset) begin
    regChain_26 = 16'h0;
  end
  if (reset) begin
    regChain_27 = 16'h0;
  end
  if (reset) begin
    regChain_28 = 16'h0;
  end
  if (reset) begin
    regChain_29 = 16'h0;
  end
  if (reset) begin
    regChain_30 = 16'h0;
  end
  if (reset) begin
    regChain_31 = 16'h0;
  end
  if (reset) begin
    regChain_32 = 16'h0;
  end
  if (reset) begin
    regChain_33 = 16'h0;
  end
  if (reset) begin
    regChain_34 = 16'h0;
  end
  if (reset) begin
    regChain_35 = 16'h0;
  end
  if (reset) begin
    regChain_36 = 16'h0;
  end
  if (reset) begin
    regChain_37 = 16'h0;
  end
  if (reset) begin
    regChain_38 = 16'h0;
  end
  if (reset) begin
    regChain_39 = 16'h0;
  end
  if (reset) begin
    regChain_40 = 16'h0;
  end
  if (reset) begin
    regChain_41 = 16'h0;
  end
  if (reset) begin
    regChain_42 = 16'h0;
  end
  if (reset) begin
    regChain_43 = 16'h0;
  end
  if (reset) begin
    regChain_44 = 16'h0;
  end
  if (reset) begin
    regChain_45 = 16'h0;
  end
  if (reset) begin
    regChain_46 = 16'h0;
  end
  if (reset) begin
    regChain_47 = 16'h0;
  end
  if (reset) begin
    regChain_48 = 16'h0;
  end
  if (reset) begin
    regChain_49 = 16'h0;
  end
  if (reset) begin
    regChain_50 = 16'h0;
  end
  if (reset) begin
    regChain_51 = 16'h0;
  end
  if (reset) begin
    regChain_52 = 16'h0;
  end
  if (reset) begin
    regChain_53 = 16'h0;
  end
  if (reset) begin
    regChain_54 = 16'h0;
  end
  if (reset) begin
    regChain_55 = 16'h0;
  end
  if (reset) begin
    regChain_56 = 16'h0;
  end
  if (reset) begin
    regChain_57 = 16'h0;
  end
  if (reset) begin
    regChain_58 = 16'h0;
  end
  if (reset) begin
    regChain_59 = 16'h0;
  end
  if (reset) begin
    regChain_60 = 16'h0;
  end
  if (reset) begin
    regChain_61 = 16'h0;
  end
  if (reset) begin
    regChain_62 = 16'h0;
  end
  if (reset) begin
    regChain_63 = 16'h0;
  end
  if (reset) begin
    regChain_64 = 16'h0;
  end
  if (reset) begin
    regChain_65 = 16'h0;
  end
  if (reset) begin
    regChain_66 = 16'h0;
  end
  if (reset) begin
    regChain_67 = 16'h0;
  end
  if (reset) begin
    regChain_68 = 16'h0;
  end
  if (reset) begin
    regChain_69 = 16'h0;
  end
  if (reset) begin
    regChain_70 = 16'h0;
  end
  if (reset) begin
    regChain_71 = 16'h0;
  end
  if (reset) begin
    regChain_72 = 16'h0;
  end
  if (reset) begin
    regChain_73 = 16'h0;
  end
  if (reset) begin
    regChain_74 = 16'h0;
  end
  if (reset) begin
    regChain_75 = 16'h0;
  end
  if (reset) begin
    regChain_76 = 16'h0;
  end
  if (reset) begin
    regChain_77 = 16'h0;
  end
  if (reset) begin
    regChain_78 = 16'h0;
  end
  if (reset) begin
    regChain_79 = 16'h0;
  end
  if (reset) begin
    regChain_80 = 16'h0;
  end
  if (reset) begin
    regChain_81 = 16'h0;
  end
  if (reset) begin
    regChain_82 = 16'h0;
  end
  if (reset) begin
    regChain_83 = 16'h0;
  end
  if (reset) begin
    regChain_84 = 16'h0;
  end
  if (reset) begin
    regChain_85 = 16'h0;
  end
  if (reset) begin
    regChain_86 = 16'h0;
  end
  if (reset) begin
    regChain_87 = 16'h0;
  end
  if (reset) begin
    regChain_88 = 16'h0;
  end
  if (reset) begin
    regChain_89 = 16'h0;
  end
  if (reset) begin
    regChain_90 = 16'h0;
  end
  if (reset) begin
    regChain_91 = 16'h0;
  end
  if (reset) begin
    regChain_92 = 16'h0;
  end
  if (reset) begin
    regChain_93 = 16'h0;
  end
  if (reset) begin
    regChain_94 = 16'h0;
  end
  if (reset) begin
    regChain_95 = 16'h0;
  end
  if (reset) begin
    regChain_96 = 16'h0;
  end
  if (reset) begin
    regChain_97 = 16'h0;
  end
  if (reset) begin
    regChain_98 = 16'h0;
  end
  if (reset) begin
    regChain_99 = 16'h0;
  end
  if (reset) begin
    regChain_100 = 16'h0;
  end
  if (reset) begin
    regChain_101 = 16'h0;
  end
  if (reset) begin
    regChain_102 = 16'h0;
  end
  if (reset) begin
    regChain_103 = 16'h0;
  end
  if (reset) begin
    regChain_104 = 16'h0;
  end
  if (reset) begin
    regChain_105 = 16'h0;
  end
  if (reset) begin
    regChain_106 = 16'h0;
  end
  if (reset) begin
    regChain_107 = 16'h0;
  end
  if (reset) begin
    regChain_108 = 16'h0;
  end
  if (reset) begin
    regChain_109 = 16'h0;
  end
  if (reset) begin
    regChain_110 = 16'h0;
  end
  if (reset) begin
    regChain_111 = 16'h0;
  end
  if (reset) begin
    regChain_112 = 16'h0;
  end
  if (reset) begin
    regChain_113 = 16'h0;
  end
  if (reset) begin
    regChain_114 = 16'h0;
  end
  if (reset) begin
    regChain_115 = 16'h0;
  end
  if (reset) begin
    regChain_116 = 16'h0;
  end
  if (reset) begin
    regChain_117 = 16'h0;
  end
  if (reset) begin
    regChain_118 = 16'h0;
  end
  if (reset) begin
    regChain_119 = 16'h0;
  end
  if (reset) begin
    regChain_120 = 16'h0;
  end
  if (reset) begin
    regChain_121 = 16'h0;
  end
  if (reset) begin
    regChain_122 = 16'h0;
  end
  if (reset) begin
    regChain_123 = 16'h0;
  end
  if (reset) begin
    regChain_124 = 16'h0;
  end
  if (reset) begin
    regChain_125 = 16'h0;
  end
  if (reset) begin
    regChain_126 = 16'h0;
  end
  if (reset) begin
    regChain_127 = 16'h0;
  end
  if (reset) begin
    regChain_128 = 16'h0;
  end
  if (reset) begin
    regChain_129 = 16'h0;
  end
  if (reset) begin
    regChain_130 = 16'h0;
  end
  if (reset) begin
    regChain_131 = 16'h0;
  end
  if (reset) begin
    regChain_132 = 16'h0;
  end
  if (reset) begin
    regChain_133 = 16'h0;
  end
  if (reset) begin
    regChain_134 = 16'h0;
  end
  if (reset) begin
    regChain_135 = 16'h0;
  end
  if (reset) begin
    regChain_136 = 16'h0;
  end
  if (reset) begin
    regChain_137 = 16'h0;
  end
  if (reset) begin
    regChain_138 = 16'h0;
  end
  if (reset) begin
    regChain_139 = 16'h0;
  end
  if (reset) begin
    regChain_140 = 16'h0;
  end
  if (reset) begin
    regChain_141 = 16'h0;
  end
  if (reset) begin
    regChain_142 = 16'h0;
  end
  if (reset) begin
    regChain_143 = 16'h0;
  end
  if (reset) begin
    regChain_144 = 16'h0;
  end
  if (reset) begin
    regChain_145 = 16'h0;
  end
  if (reset) begin
    regChain_146 = 16'h0;
  end
  if (reset) begin
    regChain_147 = 16'h0;
  end
  if (reset) begin
    regChain_148 = 16'h0;
  end
  if (reset) begin
    regChain_149 = 16'h0;
  end
  if (reset) begin
    regChain_150 = 16'h0;
  end
  if (reset) begin
    regChain_151 = 16'h0;
  end
  if (reset) begin
    regChain_152 = 16'h0;
  end
  if (reset) begin
    regChain_153 = 16'h0;
  end
  if (reset) begin
    regChain_154 = 16'h0;
  end
  if (reset) begin
    regChain_155 = 16'h0;
  end
  if (reset) begin
    regChain_156 = 16'h0;
  end
  if (reset) begin
    regChain_157 = 16'h0;
  end
  if (reset) begin
    regChain_158 = 16'h0;
  end
  if (reset) begin
    regChain_159 = 16'h0;
  end
  if (reset) begin
    regChain_160 = 16'h0;
  end
  if (reset) begin
    regChain_161 = 16'h0;
  end
  if (reset) begin
    regChain_162 = 16'h0;
  end
  if (reset) begin
    regChain_163 = 16'h0;
  end
  if (reset) begin
    regChain_164 = 16'h0;
  end
  if (reset) begin
    regChain_165 = 16'h0;
  end
  if (reset) begin
    regChain_166 = 16'h0;
  end
  if (reset) begin
    regChain_167 = 16'h0;
  end
  if (reset) begin
    regChain_168 = 16'h0;
  end
  if (reset) begin
    regChain_169 = 16'h0;
  end
  if (reset) begin
    regChain_170 = 16'h0;
  end
  if (reset) begin
    regChain_171 = 16'h0;
  end
  if (reset) begin
    regChain_172 = 16'h0;
  end
  if (reset) begin
    regChain_173 = 16'h0;
  end
  if (reset) begin
    regChain_174 = 16'h0;
  end
  if (reset) begin
    regChain_175 = 16'h0;
  end
  if (reset) begin
    regChain_176 = 16'h0;
  end
  if (reset) begin
    regChain_177 = 16'h0;
  end
  if (reset) begin
    regChain_178 = 16'h0;
  end
  if (reset) begin
    regChain_179 = 16'h0;
  end
  if (reset) begin
    regChain_180 = 16'h0;
  end
  if (reset) begin
    regChain_181 = 16'h0;
  end
  if (reset) begin
    regChain_182 = 16'h0;
  end
  if (reset) begin
    regChain_183 = 16'h0;
  end
  if (reset) begin
    regChain_184 = 16'h0;
  end
  if (reset) begin
    regChain_185 = 16'h0;
  end
  if (reset) begin
    regChain_186 = 16'h0;
  end
  if (reset) begin
    regChain_187 = 16'h0;
  end
  if (reset) begin
    regChain_188 = 16'h0;
  end
  if (reset) begin
    regChain_189 = 16'h0;
  end
  if (reset) begin
    regChain_190 = 16'h0;
  end
  if (reset) begin
    regChain_191 = 16'h0;
  end
  if (reset) begin
    regChain_192 = 16'h0;
  end
  if (reset) begin
    regChain_193 = 16'h0;
  end
  if (reset) begin
    regChain_194 = 16'h0;
  end
  if (reset) begin
    regChain_195 = 16'h0;
  end
  if (reset) begin
    regChain_196 = 16'h0;
  end
  if (reset) begin
    regChain_197 = 16'h0;
  end
  if (reset) begin
    regChain_198 = 16'h0;
  end
  if (reset) begin
    regChain_199 = 16'h0;
  end
  if (reset) begin
    regChain_200 = 16'h0;
  end
  if (reset) begin
    regChain_201 = 16'h0;
  end
  if (reset) begin
    regChain_202 = 16'h0;
  end
  if (reset) begin
    regChain_203 = 16'h0;
  end
  if (reset) begin
    regChain_204 = 16'h0;
  end
  if (reset) begin
    regChain_205 = 16'h0;
  end
  if (reset) begin
    regChain_206 = 16'h0;
  end
  if (reset) begin
    regChain_207 = 16'h0;
  end
  if (reset) begin
    regChain_208 = 16'h0;
  end
  if (reset) begin
    regChain_209 = 16'h0;
  end
  if (reset) begin
    regChain_210 = 16'h0;
  end
  if (reset) begin
    regChain_211 = 16'h0;
  end
  if (reset) begin
    regChain_212 = 16'h0;
  end
  if (reset) begin
    regChain_213 = 16'h0;
  end
  if (reset) begin
    regChain_214 = 16'h0;
  end
  if (reset) begin
    regChain_215 = 16'h0;
  end
  if (reset) begin
    regChain_216 = 16'h0;
  end
  if (reset) begin
    regChain_217 = 16'h0;
  end
  if (reset) begin
    regChain_218 = 16'h0;
  end
  if (reset) begin
    regChain_219 = 16'h0;
  end
  if (reset) begin
    regChain_220 = 16'h0;
  end
  if (reset) begin
    regChain_221 = 16'h0;
  end
  if (reset) begin
    regChain_222 = 16'h0;
  end
  if (reset) begin
    regChain_223 = 16'h0;
  end
  if (reset) begin
    regChain_224 = 16'h0;
  end
  if (reset) begin
    regChain_225 = 16'h0;
  end
  if (reset) begin
    regChain_226 = 16'h0;
  end
  if (reset) begin
    regChain_227 = 16'h0;
  end
  if (reset) begin
    regChain_228 = 16'h0;
  end
  if (reset) begin
    regChain_229 = 16'h0;
  end
  if (reset) begin
    regChain_230 = 16'h0;
  end
  if (reset) begin
    regChain_231 = 16'h0;
  end
  if (reset) begin
    regChain_232 = 16'h0;
  end
  if (reset) begin
    regChain_233 = 16'h0;
  end
  if (reset) begin
    regChain_234 = 16'h0;
  end
  if (reset) begin
    regChain_235 = 16'h0;
  end
  if (reset) begin
    regChain_236 = 16'h0;
  end
  if (reset) begin
    regChain_237 = 16'h0;
  end
  if (reset) begin
    regChain_238 = 16'h0;
  end
  if (reset) begin
    regChain_239 = 16'h0;
  end
  if (reset) begin
    regChain_240 = 16'h0;
  end
  if (reset) begin
    regChain_241 = 16'h0;
  end
  if (reset) begin
    regChain_242 = 16'h0;
  end
  if (reset) begin
    regChain_243 = 16'h0;
  end
  if (reset) begin
    regChain_244 = 16'h0;
  end
  if (reset) begin
    regChain_245 = 16'h0;
  end
  if (reset) begin
    regChain_246 = 16'h0;
  end
  if (reset) begin
    regChain_247 = 16'h0;
  end
  if (reset) begin
    regChain_248 = 16'h0;
  end
  if (reset) begin
    regChain_249 = 16'h0;
  end
  if (reset) begin
    regChain_250 = 16'h0;
  end
  if (reset) begin
    regChain_251 = 16'h0;
  end
  if (reset) begin
    regChain_252 = 16'h0;
  end
  if (reset) begin
    regChain_253 = 16'h0;
  end
  if (reset) begin
    regChain_254 = 16'h0;
  end
  if (reset) begin
    regChain_255 = 16'h0;
  end
  if (reset) begin
    full = 1'h0;
  end
  if (reset) begin
    cnt = 8'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module TemperatureLookup(
  input  [7:0]  io_in, // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 16:14]
  output [31:0] io_out // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 16:14]
);
  wire [31:0] _GEN_8 = 8'h8 == io_in ? $signed(32'sh7c4ab0b2) : $signed(32'sh7f000000); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_9 = 8'h9 == io_in ? $signed(32'sh77a72db3) : $signed(_GEN_8); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_10 = 8'ha == io_in ? $signed(32'sh735d00b1) : $signed(_GEN_9); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_11 = 8'hb == io_in ? $signed(32'sh6f64a366) : $signed(_GEN_10); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_12 = 8'hc == io_in ? $signed(32'sh6bb71d96) : $signed(_GEN_11); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_13 = 8'hd == io_in ? $signed(32'sh684dfc86) : $signed(_GEN_12); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_14 = 8'he == io_in ? $signed(32'sh65234acf) : $signed(_GEN_13); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_15 = 8'hf == io_in ? $signed(32'sh623188a1) : $signed(_GEN_14); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_16 = 8'h10 == io_in ? $signed(32'sh5f73a45e) : $signed(_GEN_15); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_17 = 8'h11 == io_in ? $signed(32'sh5ce4f394) : $signed(_GEN_16); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_18 = 8'h12 == io_in ? $signed(32'sh5a812c53) : $signed(_GEN_17); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_19 = 8'h13 == io_in ? $signed(32'sh58445ed5) : $signed(_GEN_18); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_20 = 8'h14 == io_in ? $signed(32'sh562aef7f) : $signed(_GEN_19); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_21 = 8'h15 == io_in ? $signed(32'sh5431912a) : $signed(_GEN_20); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_22 = 8'h16 == io_in ? $signed(32'sh52553fbb) : $signed(_GEN_21); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_23 = 8'h17 == io_in ? $signed(32'sh50933b0c) : $signed(_GEN_22); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_24 = 8'h18 == io_in ? $signed(32'sh4ee9020f) : $signed(_GEN_23); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_25 = 8'h19 == io_in ? $signed(32'sh4d544e41) : $signed(_GEN_24); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_26 = 8'h1a == io_in ? $signed(32'sh4bd30f53) : $signed(_GEN_25); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_27 = 8'h1b == io_in ? $signed(32'sh4a63671d) : $signed(_GEN_26); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_28 = 8'h1c == io_in ? $signed(32'sh4903a5bf) : $signed(_GEN_27); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_29 = 8'h1d == io_in ? $signed(32'sh47b2460c) : $signed(_GEN_28); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_30 = 8'h1e == io_in ? $signed(32'sh466dea1b) : $signed(_GEN_29); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_31 = 8'h1f == io_in ? $signed(32'sh45355819) : $signed(_GEN_30); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_32 = 8'h20 == io_in ? $signed(32'sh44077746) : $signed(_GEN_31); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_33 = 8'h21 == io_in ? $signed(32'sh42e34d26) : $signed(_GEN_32); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_34 = 8'h22 == io_in ? $signed(32'sh41c7fadd) : $signed(_GEN_33); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_35 = 8'h23 == io_in ? $signed(32'sh40b4bab7) : $signed(_GEN_34); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_36 = 8'h24 == io_in ? $signed(32'sh3fa8dddd) : $signed(_GEN_35); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_37 = 8'h25 == io_in ? $signed(32'sh3ea3ca2b) : $signed(_GEN_36); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_38 = 8'h26 == io_in ? $signed(32'sh3da4f835) : $signed(_GEN_37); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_39 = 8'h27 == io_in ? $signed(32'sh3cabf165) : $signed(_GEN_38); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_40 = 8'h28 == io_in ? $signed(32'sh3bb84e45) : $signed(_GEN_39); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_41 = 8'h29 == io_in ? $signed(32'sh3ac9b4e2) : $signed(_GEN_40); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_42 = 8'h2a == io_in ? $signed(32'sh39dfd753) : $signed(_GEN_41); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_43 = 8'h2b == io_in ? $signed(32'sh38fa725b) : $signed(_GEN_42); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_44 = 8'h2c == io_in ? $signed(32'sh38194c26) : $signed(_GEN_43); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_45 = 8'h2d == io_in ? $signed(32'sh373c3320) : $signed(_GEN_44); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_46 = 8'h2e == io_in ? $signed(32'sh3662fce6) : $signed(_GEN_45); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_47 = 8'h2f == io_in ? $signed(32'sh358d854e) : $signed(_GEN_46); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_48 = 8'h30 == io_in ? $signed(32'sh34bbad85) : $signed(_GEN_47); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_49 = 8'h31 == io_in ? $signed(32'sh33ed5b3f) : $signed(_GEN_48); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_50 = 8'h32 == io_in ? $signed(32'sh33227800) : $signed(_GEN_49); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_51 = 8'h33 == io_in ? $signed(32'sh325af071) : $signed(_GEN_50); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_52 = 8'h34 == io_in ? $signed(32'sh3196b3c9) : $signed(_GEN_51); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_53 = 8'h35 == io_in ? $signed(32'sh30d5b349) : $signed(_GEN_52); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_54 = 8'h36 == io_in ? $signed(32'sh3017e1c0) : $signed(_GEN_53); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_55 = 8'h37 == io_in ? $signed(32'sh2f5d3323) : $signed(_GEN_54); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_56 = 8'h38 == io_in ? $signed(32'sh2ea59c32) : $signed(_GEN_55); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_57 = 8'h39 == io_in ? $signed(32'sh2df11220) : $signed(_GEN_56); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_58 = 8'h3a == io_in ? $signed(32'sh2d3f8a55) : $signed(_GEN_57); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_59 = 8'h3b == io_in ? $signed(32'sh2c90fa2c) : $signed(_GEN_58); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_60 = 8'h3c == io_in ? $signed(32'sh2be556c6) : $signed(_GEN_59); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_61 = 8'h3d == io_in ? $signed(32'sh2b3c94dd) : $signed(_GEN_60); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_62 = 8'h3e == io_in ? $signed(32'sh2a96a8a5) : $signed(_GEN_61); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_63 = 8'h3f == io_in ? $signed(32'sh29f385ae) : $signed(_GEN_62); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_64 = 8'h40 == io_in ? $signed(32'sh29531ed8) : $signed(_GEN_63); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_65 = 8'h41 == io_in ? $signed(32'sh28b5663f) : $signed(_GEN_64); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_66 = 8'h42 == io_in ? $signed(32'sh281a4d35) : $signed(_GEN_65); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_67 = 8'h43 == io_in ? $signed(32'sh2781c441) : $signed(_GEN_66); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_68 = 8'h44 == io_in ? $signed(32'sh26ebbb1f) : $signed(_GEN_67); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_69 = 8'h45 == io_in ? $signed(32'sh265820c5) : $signed(_GEN_68); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_70 = 8'h46 == io_in ? $signed(32'sh25c6e36c) : $signed(_GEN_69); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_71 = 8'h47 == io_in ? $signed(32'sh2537f09d) : $signed(_GEN_70); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_72 = 8'h48 == io_in ? $signed(32'sh24ab353e) : $signed(_GEN_71); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_73 = 8'h49 == io_in ? $signed(32'sh24209da0) : $signed(_GEN_72); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_74 = 8'h4a == io_in ? $signed(32'sh23981595) : $signed(_GEN_73); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_75 = 8'h4b == io_in ? $signed(32'sh23118882) : $signed(_GEN_74); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_76 = 8'h4c == io_in ? $signed(32'sh228ce173) : $signed(_GEN_75); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_77 = 8'h4d == io_in ? $signed(32'sh220a0b30) : $signed(_GEN_76); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_78 = 8'h4e == io_in ? $signed(32'sh2188f056) : $signed(_GEN_77); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_79 = 8'h4f == io_in ? $signed(32'sh21097b68) : $signed(_GEN_78); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_80 = 8'h50 == io_in ? $signed(32'sh208b96e9) : $signed(_GEN_79); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_81 = 8'h51 == io_in ? $signed(32'sh200f2d73) : $signed(_GEN_80); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_82 = 8'h52 == io_in ? $signed(32'sh1f9429c9) : $signed(_GEN_81); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_83 = 8'h53 == io_in ? $signed(32'sh1f1a76ef) : $signed(_GEN_82); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_84 = 8'h54 == io_in ? $signed(32'sh1ea2003c) : $signed(_GEN_83); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_85 = 8'h55 == io_in ? $signed(32'sh1e2ab173) : $signed(_GEN_84); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_86 = 8'h56 == io_in ? $signed(32'sh1db476ce) : $signed(_GEN_85); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_87 = 8'h57 == io_in ? $signed(32'sh1d3f3d16) : $signed(_GEN_86); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_88 = 8'h58 == io_in ? $signed(32'sh1ccaf1b0) : $signed(_GEN_87); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_89 = 8'h59 == io_in ? $signed(32'sh1c5782af) : $signed(_GEN_88); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_90 = 8'h5a == io_in ? $signed(32'sh1be4dee0) : $signed(_GEN_89); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_91 = 8'h5b == io_in ? $signed(32'sh1b72f5d5) : $signed(_GEN_90); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_92 = 8'h5c == io_in ? $signed(32'sh1b01b7f4) : $signed(_GEN_91); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_93 = 8'h5d == io_in ? $signed(32'sh1a91167f) : $signed(_GEN_92); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_94 = 8'h5e == io_in ? $signed(32'sh1a21039b) : $signed(_GEN_93); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_95 = 8'h5f == io_in ? $signed(32'sh19b17259) : $signed(_GEN_94); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_96 = 8'h60 == io_in ? $signed(32'sh194256b9) : $signed(_GEN_95); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_97 = 8'h61 == io_in ? $signed(32'sh18d3a5b1) : $signed(_GEN_96); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_98 = 8'h62 == io_in ? $signed(32'sh1865552a) : $signed(_GEN_97); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_99 = 8'h63 == io_in ? $signed(32'sh17f75c08) : $signed(_GEN_98); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_100 = 8'h64 == io_in ? $signed(32'sh1789b225) : $signed(_GEN_99); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_101 = 8'h65 == io_in ? $signed(32'sh171c504e) : $signed(_GEN_100); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_102 = 8'h66 == io_in ? $signed(32'sh16af3045) : $signed(_GEN_101); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_103 = 8'h67 == io_in ? $signed(32'sh16424cb9) : $signed(_GEN_102); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_104 = 8'h68 == io_in ? $signed(32'sh15d5a13e) : $signed(_GEN_103); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_105 = 8'h69 == io_in ? $signed(32'sh15692a4d) : $signed(_GEN_104); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_106 = 8'h6a == io_in ? $signed(32'sh14fce538) : $signed(_GEN_105); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_107 = 8'h6b == io_in ? $signed(32'sh1490d01f) : $signed(_GEN_106); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_108 = 8'h6c == io_in ? $signed(32'sh1424e9eb) : $signed(_GEN_107); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_109 = 8'h6d == io_in ? $signed(32'sh13b93241) : $signed(_GEN_108); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_110 = 8'h6e == io_in ? $signed(32'sh134da975) : $signed(_GEN_109); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_111 = 8'h6f == io_in ? $signed(32'sh12e25080) : $signed(_GEN_110); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_112 = 8'h70 == io_in ? $signed(32'sh127728f4) : $signed(_GEN_111); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_113 = 8'h71 == io_in ? $signed(32'sh120c34e9) : $signed(_GEN_112); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_114 = 8'h72 == io_in ? $signed(32'sh11a176f7) : $signed(_GEN_113); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_115 = 8'h73 == io_in ? $signed(32'sh1136f222) : $signed(_GEN_114); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_116 = 8'h74 == io_in ? $signed(32'sh10cca9cd) : $signed(_GEN_115); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_117 = 8'h75 == io_in ? $signed(32'sh1062a1aa) : $signed(_GEN_116); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_118 = 8'h76 == io_in ? $signed(32'shff8ddaf) : $signed(_GEN_117); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_119 = 8'h77 == io_in ? $signed(32'shf8f6200) : $signed(_GEN_118); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_120 = 8'h78 == io_in ? $signed(32'shf2632e8) : $signed(_GEN_119); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_121 = 8'h79 == io_in ? $signed(32'shebd54c4) : $signed(_GEN_120); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_122 = 8'h7a == io_in ? $signed(32'she54cbf4) : $signed(_GEN_121); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_123 = 8'h7b == io_in ? $signed(32'shdec9cd1) : $signed(_GEN_122); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_124 = 8'h7c == io_in ? $signed(32'shd84cb9b) : $signed(_GEN_123); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_125 = 8'h7d == io_in ? $signed(32'shd1d5c6d) : $signed(_GEN_124); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_126 = 8'h7e == io_in ? $signed(32'shcb6532e) : $signed(_GEN_125); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_127 = 8'h7f == io_in ? $signed(32'shc4fb385) : $signed(_GEN_126); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_128 = 8'h80 == io_in ? $signed(32'shbe980cb) : $signed(_GEN_127); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_129 = 8'h81 == io_in ? $signed(32'shb83be03) : $signed(_GEN_128); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_130 = 8'h82 == io_in ? $signed(32'shb1e6dca) : $signed(_GEN_129); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_131 = 8'h83 == io_in ? $signed(32'shab99252) : $signed(_GEN_130); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_132 = 8'h84 == io_in ? $signed(32'sha552d53) : $signed(_GEN_131); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_133 = 8'h85 == io_in ? $signed(32'sh9f14007) : $signed(_GEN_132); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_134 = 8'h86 == io_in ? $signed(32'sh98dcb1f) : $signed(_GEN_133); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_135 = 8'h87 == io_in ? $signed(32'sh92acebe) : $signed(_GEN_134); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_136 = 8'h88 == io_in ? $signed(32'sh8c84a73) : $signed(_GEN_135); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_137 = 8'h89 == io_in ? $signed(32'sh8663d31) : $signed(_GEN_136); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_138 = 8'h8a == io_in ? $signed(32'sh804a550) : $signed(_GEN_137); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_139 = 8'h8b == io_in ? $signed(32'sh7a38086) : $signed(_GEN_138); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_140 = 8'h8c == io_in ? $signed(32'sh742cbe5) : $signed(_GEN_139); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_141 = 8'h8d == io_in ? $signed(32'sh6e283df) : $signed(_GEN_140); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_142 = 8'h8e == io_in ? $signed(32'sh682a43f) : $signed(_GEN_141); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_143 = 8'h8f == io_in ? $signed(32'sh623282e) : $signed(_GEN_142); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_144 = 8'h90 == io_in ? $signed(32'sh5c40a36) : $signed(_GEN_143); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_145 = 8'h91 == io_in ? $signed(32'sh5654443) : $signed(_GEN_144); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_146 = 8'h92 == io_in ? $signed(32'sh506cfa7) : $signed(_GEN_145); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_147 = 8'h93 == io_in ? $signed(32'sh4a8a521) : $signed(_GEN_146); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_148 = 8'h94 == io_in ? $signed(32'sh44abce0) : $signed(_GEN_147); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_149 = 8'h95 == io_in ? $signed(32'sh3ed0e8d) : $signed(_GEN_148); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_150 = 8'h96 == io_in ? $signed(32'sh38f9151) : $signed(_GEN_149); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_151 = 8'h97 == io_in ? $signed(32'sh3323be0) : $signed(_GEN_150); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_152 = 8'h98 == io_in ? $signed(32'sh2d5047d) : $signed(_GEN_151); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_153 = 8'h99 == io_in ? $signed(32'sh277e10a) : $signed(_GEN_152); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_154 = 8'h9a == io_in ? $signed(32'sh21ac70f) : $signed(_GEN_153); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_155 = 8'h9b == io_in ? $signed(32'sh1bdabca) : $signed(_GEN_154); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_156 = 8'h9c == io_in ? $signed(32'sh1608433) : $signed(_GEN_155); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_157 = 8'h9d == io_in ? $signed(32'sh1034513) : $signed(_GEN_156); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_158 = 8'h9e == io_in ? $signed(32'sha5e308) : $signed(_GEN_157); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_159 = 8'h9f == io_in ? $signed(32'sh485296) : $signed(_GEN_158); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_160 = 8'ha0 == io_in ? $signed(-32'sh1577cb) : $signed(_GEN_159); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_161 = 8'ha1 == io_in ? $signed(-32'sh7387a0) : $signed(_GEN_160); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_162 = 8'ha2 == io_in ? $signed(-32'shd1e862) : $signed(_GEN_161); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_163 = 8'ha3 == io_in ? $signed(-32'sh130a56a) : $signed(_GEN_162); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_164 = 8'ha4 == io_in ? $signed(-32'sh18fc9e8) : $signed(_GEN_163); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_165 = 8'ha5 == io_in ? $signed(-32'sh1ef60d2) : $signed(_GEN_164); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_166 = 8'ha6 == io_in ? $signed(-32'sh24f74d8) : $signed(_GEN_165); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_167 = 8'ha7 == io_in ? $signed(-32'sh2b01055) : $signed(_GEN_166); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_168 = 8'ha8 == io_in ? $signed(-32'sh3113d45) : $signed(_GEN_167); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_169 = 8'ha9 == io_in ? $signed(-32'sh3730539) : $signed(_GEN_168); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_170 = 8'haa == io_in ? $signed(-32'sh3d57146) : $signed(_GEN_169); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_171 = 8'hab == io_in ? $signed(-32'sh4388a00) : $signed(_GEN_170); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_172 = 8'hac == io_in ? $signed(-32'sh49c576f) : $signed(_GEN_171); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_173 = 8'had == io_in ? $signed(-32'sh500e103) : $signed(_GEN_172); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_174 = 8'hae == io_in ? $signed(-32'sh5662d8e) : $signed(_GEN_173); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_175 = 8'haf == io_in ? $signed(-32'sh5cc433c) : $signed(_GEN_174); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_176 = 8'hb0 == io_in ? $signed(-32'sh6332790) : $signed(_GEN_175); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_177 = 8'hb1 == io_in ? $signed(-32'sh69adf5c) : $signed(_GEN_176); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_178 = 8'hb2 == io_in ? $signed(-32'sh7036ec0) : $signed(_GEN_177); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_179 = 8'hb3 == io_in ? $signed(-32'sh76cd929) : $signed(_GEN_178); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_180 = 8'hb4 == io_in ? $signed(-32'sh7d7214f) : $signed(_GEN_179); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_181 = 8'hb5 == io_in ? $signed(-32'sh8424939) : $signed(_GEN_180); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_182 = 8'hb6 == io_in ? $signed(-32'sh8ae523f) : $signed(_GEN_181); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_183 = 8'hb7 == io_in ? $signed(-32'sh91b3d14) : $signed(_GEN_182); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_184 = 8'hb8 == io_in ? $signed(-32'sh98909c4) : $signed(_GEN_183); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_185 = 8'hb9 == io_in ? $signed(-32'sh9f7b7c9) : $signed(_GEN_184); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_186 = 8'hba == io_in ? $signed(-32'sha67460c) : $signed(_GEN_185); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_187 = 8'hbb == io_in ? $signed(-32'shad7b2fc) : $signed(_GEN_186); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_188 = 8'hbc == io_in ? $signed(-32'shb48fc98) : $signed(_GEN_187); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_189 = 8'hbd == io_in ? $signed(-32'shbbb2080) : $signed(_GEN_188); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_190 = 8'hbe == io_in ? $signed(-32'shc2e1c11) : $signed(_GEN_189); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_191 = 8'hbf == io_in ? $signed(-32'shca1ec72) : $signed(_GEN_190); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_192 = 8'hc0 == io_in ? $signed(-32'shd168eb7) : $signed(_GEN_191); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_193 = 8'hc1 == io_in ? $signed(-32'shd8bfff4) : $signed(_GEN_192); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_194 = 8'hc2 == io_in ? $signed(-32'she023d5f) : $signed(_GEN_193); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_195 = 8'hc3 == io_in ? $signed(-32'she794470) : $signed(_GEN_194); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_196 = 8'hc4 == io_in ? $signed(-32'shef11304) : $signed(_GEN_195); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_197 = 8'hc5 == io_in ? $signed(-32'shf69a780) : $signed(_GEN_196); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_198 = 8'hc6 == io_in ? $signed(-32'shfe300f9) : $signed(_GEN_197); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_199 = 8'hc7 == io_in ? $signed(-32'sh105d1f60) : $signed(_GEN_198); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_200 = 8'hc8 == io_in ? $signed(-32'sh10d803a8) : $signed(_GEN_199); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_201 = 8'hc9 == io_in ? $signed(-32'sh1153aff9) : $signed(_GEN_200); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_202 = 8'hca == io_in ? $signed(-32'sh11d027de) : $signed(_GEN_201); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_203 = 8'hcb == io_in ? $signed(-32'sh124d7075) : $signed(_GEN_202); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_204 = 8'hcc == io_in ? $signed(-32'sh12cb90a4) : $signed(_GEN_203); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_205 = 8'hcd == io_in ? $signed(-32'sh134a914f) : $signed(_GEN_204); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_206 = 8'hce == io_in ? $signed(-32'sh13ca7d8b) : $signed(_GEN_205); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_207 = 8'hcf == io_in ? $signed(-32'sh144b62da) : $signed(_GEN_206); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_208 = 8'hd0 == io_in ? $signed(-32'sh14cd5160) : $signed(_GEN_207); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_209 = 8'hd1 == io_in ? $signed(-32'sh15505c20) : $signed(_GEN_208); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_210 = 8'hd2 == io_in ? $signed(-32'sh15d49933) : $signed(_GEN_209); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_211 = 8'hd3 == io_in ? $signed(-32'sh165a2208) : $signed(_GEN_210); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_212 = 8'hd4 == io_in ? $signed(-32'sh16e11397) : $signed(_GEN_211); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_213 = 8'hd5 == io_in ? $signed(-32'sh17698ea6) : $signed(_GEN_212); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_214 = 8'hd6 == io_in ? $signed(-32'sh17f3b7f8) : $signed(_GEN_213); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_215 = 8'hd7 == io_in ? $signed(-32'sh187fb891) : $signed(_GEN_214); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_216 = 8'hd8 == io_in ? $signed(-32'sh190dbde6) : $signed(_GEN_215); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_217 = 8'hd9 == io_in ? $signed(-32'sh199dfa17) : $signed(_GEN_216); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_218 = 8'hda == io_in ? $signed(-32'sh1a30a424) : $signed(_GEN_217); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_219 = 8'hdb == io_in ? $signed(-32'sh1ac5f81e) : $signed(_GEN_218); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_220 = 8'hdc == io_in ? $signed(-32'sh1b5e3755) : $signed(_GEN_219); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_221 = 8'hdd == io_in ? $signed(-32'sh1bf9a885) : $signed(_GEN_220); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_222 = 8'hde == io_in ? $signed(-32'sh1c9897fd) : $signed(_GEN_221); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_223 = 8'hdf == io_in ? $signed(-32'sh1d3b57bf) : $signed(_GEN_222); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_224 = 8'he0 == io_in ? $signed(-32'sh1de23fa2) : $signed(_GEN_223); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_225 = 8'he1 == io_in ? $signed(-32'sh1e8dad66) : $signed(_GEN_224); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_226 = 8'he2 == io_in ? $signed(-32'sh1f3e04c8) : $signed(_GEN_225); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_227 = 8'he3 == io_in ? $signed(-32'sh1ff3af86) : $signed(_GEN_226); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_228 = 8'he4 == io_in ? $signed(-32'sh20af1d69) : $signed(_GEN_227); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_229 = 8'he5 == io_in ? $signed(-32'sh2170c436) : $signed(_GEN_228); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_230 = 8'he6 == io_in ? $signed(-32'sh22391fa0) : $signed(_GEN_229); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_231 = 8'he7 == io_in ? $signed(-32'sh2308b12f) : $signed(_GEN_230); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_232 = 8'he8 == io_in ? $signed(-32'sh23e00015) : $signed(_GEN_231); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_233 = 8'he9 == io_in ? $signed(-32'sh24bf9900) : $signed(_GEN_232); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_234 = 8'hea == io_in ? $signed(-32'sh25a80dd2) : $signed(_GEN_233); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_235 = 8'heb == io_in ? $signed(-32'sh2699f559) : $signed(_GEN_234); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_236 = 8'hec == io_in ? $signed(-32'sh2795eaef) : $signed(_GEN_235); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_237 = 8'hed == io_in ? $signed(-32'sh289c8e06) : $signed(_GEN_236); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_238 = 8'hee == io_in ? $signed(-32'sh29ae81b0) : $signed(_GEN_237); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_239 = 8'hef == io_in ? $signed(-32'sh2acc6c03) : $signed(_GEN_238); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_240 = 8'hf0 == io_in ? $signed(-32'sh2bf6f575) : $signed(_GEN_239); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_241 = 8'hf1 == io_in ? $signed(-32'sh2d2ec81e) : $signed(_GEN_240); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_242 = 8'hf2 == io_in ? $signed(-32'sh2e748ee3) : $signed(_GEN_241); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_243 = 8'hf3 == io_in ? $signed(-32'sh2fc8f489) : $signed(_GEN_242); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_244 = 8'hf4 == io_in ? $signed(-32'sh312ca2b0) : $signed(_GEN_243); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_245 = 8'hf5 == io_in ? $signed(-32'sh32a040ac) : $signed(_GEN_244); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_246 = 8'hf6 == io_in ? $signed(-32'sh3424724c) : $signed(_GEN_245); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_247 = 8'hf7 == io_in ? $signed(-32'sh35b9d679) : $signed(_GEN_246); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_248 = 8'hf8 == io_in ? $signed(-32'sh376105b7) : $signed(_GEN_247); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_249 = 8'hf9 == io_in ? $signed(-32'sh391a9086) : $signed(_GEN_248); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_250 = 8'hfa == io_in ? $signed(-32'sh3ae6fd9f) : $signed(_GEN_249); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_251 = 8'hfb == io_in ? $signed(-32'sh3cc6c80a) : $signed(_GEN_250); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_252 = 8'hfc == io_in ? $signed(-32'sh3eba5d09) : $signed(_GEN_251); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_253 = 8'hfd == io_in ? $signed(-32'sh40c219e0) : $signed(_GEN_252); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  wire [31:0] _GEN_254 = 8'hfe == io_in ? $signed(-32'sh42de496f) : $signed(_GEN_253); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
  assign io_out = 8'hff == io_in ? $signed(-32'sh450f2197) : $signed(_GEN_254); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:{10,10}]
endmodule
module Clamp(
  input  [15:0] io_in, // @[\\src\\main\\scala\\controller\\Clamp.scala 14:14]
  output [15:0] io_clampedValue, // @[\\src\\main\\scala\\controller\\Clamp.scala 14:14]
  output        io_isClamped // @[\\src\\main\\scala\\controller\\Clamp.scala 14:14]
);
  wire  _io_clampedValue_T = $signed(io_in) < 16'sh0; // @[\\src\\main\\scala\\controller\\Clamp.scala 16:32]
  wire  _io_clampedValue_T_1 = $signed(io_in) > 16'sh63; // @[\\src\\main\\scala\\controller\\Clamp.scala 16:58]
  wire [15:0] _io_clampedValue_T_2 = $signed(io_in) > 16'sh63 ? $signed(16'sh63) : $signed(io_in); // @[\\src\\main\\scala\\controller\\Clamp.scala 16:51]
  assign io_clampedValue = $signed(io_in) < 16'sh0 ? $signed(16'sh0) : $signed(_io_clampedValue_T_2); // @[\\src\\main\\scala\\controller\\Clamp.scala 16:25]
  assign io_isClamped = _io_clampedValue_T | _io_clampedValue_T_1; // @[\\src\\main\\scala\\controller\\Clamp.scala 17:33]
endmodule
module SSegDecoder(
  input  [6:0] io_in, // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 12:14]
  output [6:0] io_out // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 12:14]
);
  wire [6:0] _GEN_0 = 7'h79 == io_in ? 7'h5b : 7'h0; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 92:24 14:27]
  wire [6:0] _GEN_1 = 7'h78 == io_in ? 7'h6e : _GEN_0; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 91:24]
  wire [6:0] _GEN_2 = 7'h77 == io_in ? 7'h76 : _GEN_1; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 90:24]
  wire [6:0] _GEN_3 = 7'h76 == io_in ? 7'h1c : _GEN_2; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 89:24]
  wire [6:0] _GEN_4 = 7'h75 == io_in ? 7'h1c : _GEN_3; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 88:24]
  wire [6:0] _GEN_5 = 7'h74 == io_in ? 7'h70 : _GEN_4; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 87:24]
  wire [6:0] _GEN_6 = 7'h73 == io_in ? 7'h6d : _GEN_5; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 86:24]
  wire [6:0] _GEN_7 = 7'h72 == io_in ? 7'h50 : _GEN_6; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 85:24]
  wire [6:0] _GEN_8 = 7'h71 == io_in ? 7'h67 : _GEN_7; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 84:24]
  wire [6:0] _GEN_9 = 7'h70 == io_in ? 7'h73 : _GEN_8; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 83:24]
  wire [6:0] _GEN_10 = 7'h6f == io_in ? 7'h5c : _GEN_9; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 82:24]
  wire [6:0] _GEN_11 = 7'h6e == io_in ? 7'h54 : _GEN_10; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 81:24]
  wire [6:0] _GEN_12 = 7'h6d == io_in ? 7'h37 : _GEN_11; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 80:24]
  wire [6:0] _GEN_13 = 7'h6c == io_in ? 7'h18 : _GEN_12; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 79:24]
  wire [6:0] _GEN_14 = 7'h6b == io_in ? 7'h75 : _GEN_13; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 78:24]
  wire [6:0] _GEN_15 = 7'h6a == io_in ? 7'hc : _GEN_14; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 77:24]
  wire [6:0] _GEN_16 = 7'h69 == io_in ? 7'h4 : _GEN_15; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 76:24]
  wire [6:0] _GEN_17 = 7'h68 == io_in ? 7'h74 : _GEN_16; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 75:24]
  wire [6:0] _GEN_18 = 7'h67 == io_in ? 7'h6f : _GEN_17; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 74:24]
  wire [6:0] _GEN_19 = 7'h66 == io_in ? 7'h71 : _GEN_18; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 73:24]
  wire [6:0] _GEN_20 = 7'h65 == io_in ? 7'h7b : _GEN_19; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 72:24]
  wire [6:0] _GEN_21 = 7'h64 == io_in ? 7'h5e : _GEN_20; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 71:24]
  wire [6:0] _GEN_22 = 7'h63 == io_in ? 7'h58 : _GEN_21; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 70:24]
  wire [6:0] _GEN_23 = 7'h62 == io_in ? 7'h7c : _GEN_22; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 69:24]
  wire [6:0] _GEN_24 = 7'h61 == io_in ? 7'h5f : _GEN_23; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 68:24]
  wire [6:0] _GEN_25 = 7'h5a == io_in ? 7'h5b : _GEN_24; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 66:23]
  wire [6:0] _GEN_26 = 7'h59 == io_in ? 7'h6e : _GEN_25; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 65:23]
  wire [6:0] _GEN_27 = 7'h58 == io_in ? 7'h76 : _GEN_26; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 64:23]
  wire [6:0] _GEN_28 = 7'h57 == io_in ? 7'h3e : _GEN_27; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 63:23]
  wire [6:0] _GEN_29 = 7'h56 == io_in ? 7'h1c : _GEN_28; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 62:23]
  wire [6:0] _GEN_30 = 7'h55 == io_in ? 7'h3e : _GEN_29; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 61:23]
  wire [6:0] _GEN_31 = 7'h54 == io_in ? 7'h70 : _GEN_30; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 60:23]
  wire [6:0] _GEN_32 = 7'h53 == io_in ? 7'h6d : _GEN_31; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 59:23]
  wire [6:0] _GEN_33 = 7'h52 == io_in ? 7'h50 : _GEN_32; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 58:23]
  wire [6:0] _GEN_34 = 7'h51 == io_in ? 7'h67 : _GEN_33; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 57:23]
  wire [6:0] _GEN_35 = 7'h50 == io_in ? 7'h73 : _GEN_34; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 56:23]
  wire [6:0] _GEN_36 = 7'h4f == io_in ? 7'h3f : _GEN_35; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 55:23]
  wire [6:0] _GEN_37 = 7'h4e == io_in ? 7'h37 : _GEN_36; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 54:23]
  wire [6:0] _GEN_38 = 7'h4d == io_in ? 7'h37 : _GEN_37; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 53:23]
  wire [6:0] _GEN_39 = 7'h4c == io_in ? 7'h38 : _GEN_38; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 52:23]
  wire [6:0] _GEN_40 = 7'h4b == io_in ? 7'h75 : _GEN_39; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 51:23]
  wire [6:0] _GEN_41 = 7'h4a == io_in ? 7'he : _GEN_40; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 50:23]
  wire [6:0] _GEN_42 = 7'h49 == io_in ? 7'h6 : _GEN_41; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 49:23]
  wire [6:0] _GEN_43 = 7'h48 == io_in ? 7'h76 : _GEN_42; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 48:23]
  wire [6:0] _GEN_44 = 7'h47 == io_in ? 7'h3d : _GEN_43; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 47:23]
  wire [6:0] _GEN_45 = 7'h46 == io_in ? 7'h71 : _GEN_44; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 46:23]
  wire [6:0] _GEN_46 = 7'h45 == io_in ? 7'h79 : _GEN_45; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 45:23]
  wire [6:0] _GEN_47 = 7'h44 == io_in ? 7'h5e : _GEN_46; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 44:23]
  wire [6:0] _GEN_48 = 7'h43 == io_in ? 7'h39 : _GEN_47; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 43:23]
  wire [6:0] _GEN_49 = 7'h42 == io_in ? 7'h7c : _GEN_48; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 42:23]
  wire [6:0] _GEN_50 = 7'h41 == io_in ? 7'h77 : _GEN_49; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 41:23]
  wire [6:0] _GEN_51 = 7'h3d == io_in ? 7'h48 : _GEN_50; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 39:23]
  wire [6:0] _GEN_52 = 7'h39 == io_in ? 7'h6f : _GEN_51; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 37:23]
  wire [6:0] _GEN_53 = 7'h38 == io_in ? 7'h7f : _GEN_52; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 36:23]
  wire [6:0] _GEN_54 = 7'h37 == io_in ? 7'h7 : _GEN_53; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 35:23]
  wire [6:0] _GEN_55 = 7'h36 == io_in ? 7'h7d : _GEN_54; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 34:23]
  wire [6:0] _GEN_56 = 7'h35 == io_in ? 7'h6d : _GEN_55; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 33:23]
  wire [6:0] _GEN_57 = 7'h34 == io_in ? 7'h66 : _GEN_56; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 32:23]
  wire [6:0] _GEN_58 = 7'h33 == io_in ? 7'h4f : _GEN_57; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 31:23]
  wire [6:0] _GEN_59 = 7'h32 == io_in ? 7'h5b : _GEN_58; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 30:23]
  wire [6:0] _GEN_60 = 7'h31 == io_in ? 7'h6 : _GEN_59; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 29:23]
  wire [6:0] _GEN_61 = 7'h30 == io_in ? 7'h3f : _GEN_60; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 28:23]
  wire [6:0] _GEN_62 = 7'h9 == io_in ? 7'h6f : _GEN_61; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 26:22]
  wire [6:0] _GEN_63 = 7'h8 == io_in ? 7'h7f : _GEN_62; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 25:22]
  wire [6:0] _GEN_64 = 7'h7 == io_in ? 7'h7 : _GEN_63; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 24:22]
  wire [6:0] _GEN_65 = 7'h6 == io_in ? 7'h7d : _GEN_64; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 23:22]
  wire [6:0] _GEN_66 = 7'h5 == io_in ? 7'h6d : _GEN_65; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 22:22]
  wire [6:0] _GEN_67 = 7'h4 == io_in ? 7'h66 : _GEN_66; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 21:22]
  wire [6:0] _GEN_68 = 7'h3 == io_in ? 7'h4f : _GEN_67; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 20:22]
  wire [6:0] _GEN_69 = 7'h2 == io_in ? 7'h5b : _GEN_68; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 19:22]
  wire [6:0] _GEN_70 = 7'h1 == io_in ? 7'h6 : _GEN_69; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 18:22]
  assign io_out = 7'h0 == io_in ? 7'h3f : _GEN_70; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 17:22]
endmodule
module Display(
  input         clock,
  input         reset,
  input  [31:0] io_currentTemp, // @[\\src\\main\\scala\\controller\\Display.scala 21:14]
  input  [31:0] io_targetTemp, // @[\\src\\main\\scala\\controller\\Display.scala 21:14]
  input         io_enable, // @[\\src\\main\\scala\\controller\\Display.scala 21:14]
  output [6:0]  io_sseg, // @[\\src\\main\\scala\\controller\\Display.scala 21:14]
  output [3:0]  io_an // @[\\src\\main\\scala\\controller\\Display.scala 21:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  wire [15:0] Clamp_io_in; // @[\\src\\main\\scala\\controller\\Display.scala 45:21]
  wire [15:0] Clamp_io_clampedValue; // @[\\src\\main\\scala\\controller\\Display.scala 45:21]
  wire  Clamp_io_isClamped; // @[\\src\\main\\scala\\controller\\Display.scala 45:21]
  wire [6:0] sseg_io_in; // @[\\src\\main\\scala\\controller\\Display.scala 82:20]
  wire [6:0] sseg_io_out; // @[\\src\\main\\scala\\controller\\Display.scala 82:20]
  wire [7:0] currentTemp = io_currentTemp[31:24]; // @[\\src\\main\\scala\\controller\\Display.scala 24:36]
  wire [7:0] targetTemp = io_targetTemp[31:24]; // @[\\src\\main\\scala\\controller\\Display.scala 25:34]
  reg [1:0] curMode; // @[\\src\\main\\scala\\controller\\Display.scala 27:24]
  reg [27:0] modeCnt; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
  wire  wrap_wrap = modeCnt == 28'hbebc1ff; // @[src/main/scala/chisel3/util/Counter.scala 73:24]
  wire [27:0] _wrap_value_T_1 = modeCnt + 28'h1; // @[src/main/scala/chisel3/util/Counter.scala 77:24]
  wire  _T_2 = 2'h0 == curMode; // @[\\src\\main\\scala\\controller\\Display.scala 30:22]
  wire  _T_5 = 2'h1 == curMode; // @[\\src\\main\\scala\\controller\\Display.scala 30:22]
  wire  _T_8 = 2'h2 == curMode; // @[\\src\\main\\scala\\controller\\Display.scala 30:22]
  reg  showTemp; // @[\\src\\main\\scala\\controller\\Display.scala 37:25]
  reg [25:0] blinkCnt; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
  wire  wrap_wrap_1 = blinkCnt == 26'h2faf07f; // @[src/main/scala/chisel3/util/Counter.scala 73:24]
  wire [25:0] _wrap_value_T_3 = blinkCnt + 26'h1; // @[src/main/scala/chisel3/util/Counter.scala 77:24]
  wire  _showTemp_T = ~showTemp; // @[\\src\\main\\scala\\controller\\Display.scala 40:19]
  wire [6:0] _GEN_11 = _T_8 ? 7'h45 : 7'h20; // @[\\src\\main\\scala\\controller\\Display.scala 48:20 58:19 44:32]
  wire [6:0] _GEN_12 = _T_5 ? 7'h54 : _GEN_11; // @[\\src\\main\\scala\\controller\\Display.scala 48:20 54:19]
  wire [31:0] _GEN_13 = _T_5 ? $signed({{24{targetTemp[7]}},targetTemp}) : $signed(32'sh0); // @[\\src\\main\\scala\\controller\\Display.scala 48:20 55:15 46:28]
  wire [6:0] leadingChar = _T_2 ? 7'h43 : _GEN_12; // @[\\src\\main\\scala\\controller\\Display.scala 48:20 50:19]
  wire [31:0] clampIn = _T_2 ? $signed({{24{currentTemp[7]}},currentTemp}) : $signed(_GEN_13); // @[\\src\\main\\scala\\controller\\Display.scala 48:20 51:15]
  wire  _curMessage_1_T_1 = _showTemp_T & Clamp_io_isClamped; // @[\\src\\main\\scala\\controller\\Display.scala 68:36]
  wire [15:0] _curMessage_1_T_2 = Clamp_io_clampedValue / 4'ha; // @[\\src\\main\\scala\\controller\\Display.scala 68:76]
  wire [15:0] _curMessage_1_T_3 = _showTemp_T & Clamp_io_isClamped ? 16'h20 : _curMessage_1_T_2; // @[\\src\\main\\scala\\controller\\Display.scala 68:25]
  wire [15:0] _GEN_0 = Clamp_io_clampedValue % 16'ha; // @[\\src\\main\\scala\\controller\\Display.scala 69:76]
  wire [5:0] _curMessage_0_T_3 = _curMessage_1_T_1 ? 6'h20 : {{2'd0}, _GEN_0[3:0]}; // @[\\src\\main\\scala\\controller\\Display.scala 69:25]
  wire [6:0] _GEN_16 = io_enable ? 7'h59 : 7'h4e; // @[\\src\\main\\scala\\controller\\Display.scala 71:22 72:21 75:21]
  wire [6:0] _GEN_17 = io_enable ? 7'h45 : 7'h4f; // @[\\src\\main\\scala\\controller\\Display.scala 71:22 73:21 76:21]
  wire [15:0] _GEN_18 = curMode == 2'h0 | curMode == 2'h1 ? _curMessage_1_T_3 : {{9'd0}, _GEN_16}; // @[\\src\\main\\scala\\controller\\Display.scala 67:78 68:19]
  wire [6:0] curMessage_0 = curMode == 2'h0 | curMode == 2'h1 ? {{1'd0}, _curMessage_0_T_3} : _GEN_17; // @[\\src\\main\\scala\\controller\\Display.scala 67:78 69:19]
  reg [16:0] displayCnt; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
  wire  wrap_wrap_2 = displayCnt == 17'h1869f; // @[src/main/scala/chisel3/util/Counter.scala 73:24]
  wire [16:0] _wrap_value_T_5 = displayCnt + 17'h1; // @[src/main/scala/chisel3/util/Counter.scala 77:24]
  reg [1:0] anodeCnt; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
  wire [1:0] _wrap_value_T_7 = anodeCnt + 2'h1; // @[src/main/scala/chisel3/util/Counter.scala 77:24]
  wire [6:0] curMessage_1 = _GEN_18[6:0]; // @[\\src\\main\\scala\\controller\\Display.scala 43:24]
  wire [6:0] _GEN_26 = 2'h1 == anodeCnt ? curMessage_1 : curMessage_0; // @[\\src\\main\\scala\\controller\\Display.scala 83:{14,14}]
  wire [6:0] _GEN_27 = 2'h2 == anodeCnt ? 7'h3d : _GEN_26; // @[\\src\\main\\scala\\controller\\Display.scala 83:{14,14}]
  wire [3:0] _io_an_T = 4'h1 << anodeCnt; // @[\\src\\main\\scala\\controller\\Display.scala 86:18]
  Clamp Clamp ( // @[\\src\\main\\scala\\controller\\Display.scala 45:21]
    .io_in(Clamp_io_in),
    .io_clampedValue(Clamp_io_clampedValue),
    .io_isClamped(Clamp_io_isClamped)
  );
  SSegDecoder sseg ( // @[\\src\\main\\scala\\controller\\Display.scala 82:20]
    .io_in(sseg_io_in),
    .io_out(sseg_io_out)
  );
  assign io_sseg = ~sseg_io_out; // @[\\src\\main\\scala\\controller\\Display.scala 85:14]
  assign io_an = ~_io_an_T; // @[\\src\\main\\scala\\controller\\Display.scala 86:12]
  assign Clamp_io_in = clampIn[15:0]; // @[\\src\\main\\scala\\controller\\Display.scala 62:15]
  assign sseg_io_in = 2'h3 == anodeCnt ? leadingChar : _GEN_27; // @[\\src\\main\\scala\\controller\\Display.scala 83:{14,14}]
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Display.scala 29:22]
      curMode <= 2'h0; // @[\\src\\main\\scala\\controller\\Display.scala 30:{22,22,22} 27:24 31:43 32:42 33:42]
    end else if (wrap_wrap) begin // @[\\src\\main\\scala\\controller\\Display.scala 27:24]
      if (2'h0 == curMode) begin
        curMode <= 2'h1;
      end else if (2'h1 == curMode) begin
        curMode <= 2'h2;
      end else if (2'h2 == curMode) begin
        curMode <= 2'h0;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[src/main/scala/chisel3/util/Counter.scala 87:20]
      modeCnt <= 28'h0; // @[src/main/scala/chisel3/util/Counter.scala 87:28]
    end else if (wrap_wrap) begin // @[src/main/scala/chisel3/util/Counter.scala 77:15]
      modeCnt <= 28'h0;
    end else begin
      modeCnt <= _wrap_value_T_1;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Display.scala 39:23]
      showTemp <= 1'h1; // @[\\src\\main\\scala\\controller\\Display.scala 40:16]
    end else if (wrap_wrap_1) begin // @[\\src\\main\\scala\\controller\\Display.scala 37:25]
      showTemp <= ~showTemp;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[src/main/scala/chisel3/util/Counter.scala 87:20]
      blinkCnt <= 26'h0; // @[src/main/scala/chisel3/util/Counter.scala 87:28]
    end else if (wrap_wrap_1) begin // @[src/main/scala/chisel3/util/Counter.scala 77:15]
      blinkCnt <= 26'h0;
    end else begin
      blinkCnt <= _wrap_value_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[src/main/scala/chisel3/util/Counter.scala 87:20]
      displayCnt <= 17'h0; // @[src/main/scala/chisel3/util/Counter.scala 87:28]
    end else if (wrap_wrap_2) begin // @[src/main/scala/chisel3/util/Counter.scala 77:15]
      displayCnt <= 17'h0;
    end else begin
      displayCnt <= _wrap_value_T_5;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[src/main/scala/chisel3/util/Counter.scala 118:16]
      anodeCnt <= 2'h0; // @[src/main/scala/chisel3/util/Counter.scala 77:15]
    end else if (wrap_wrap_2) begin // @[src/main/scala/chisel3/util/Counter.scala 61:40]
      anodeCnt <= _wrap_value_T_7;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  curMode = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  modeCnt = _RAND_1[27:0];
  _RAND_2 = {1{`RANDOM}};
  showTemp = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  blinkCnt = _RAND_3[25:0];
  _RAND_4 = {1{`RANDOM}};
  displayCnt = _RAND_4[16:0];
  _RAND_5 = {1{`RANDOM}};
  anodeCnt = _RAND_5[1:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    curMode = 2'h0;
  end
  if (reset) begin
    modeCnt = 28'h0;
  end
  if (reset) begin
    showTemp = 1'h1;
  end
  if (reset) begin
    blinkCnt = 26'h0;
  end
  if (reset) begin
    displayCnt = 17'h0;
  end
  if (reset) begin
    anodeCnt = 2'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module SAccumulator(
  input          clock,
  input          reset,
  input  [15:0]  io_in, // @[\\src\\main\\scala\\controller\\SAccumulator.scala 15:14]
  output [111:0] io_out // @[\\src\\main\\scala\\controller\\SAccumulator.scala 15:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [127:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
`endif // RANDOMIZE_REG_INIT
  reg [111:0] tot; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 16:20]
  reg [15:0] regChain_0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_1; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_2; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_3; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_4; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_5; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_6; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_7; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_8; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_9; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_10; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_11; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_12; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_13; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_14; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_15; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_16; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_17; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_18; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_19; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_20; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_21; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_22; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_23; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_24; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_25; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_26; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_27; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_28; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_29; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_30; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_31; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_32; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_33; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_34; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_35; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_36; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_37; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_38; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_39; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_40; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_41; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_42; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_43; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_44; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_45; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_46; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_47; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_48; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_49; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_50; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_51; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_52; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_53; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_54; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_55; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_56; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_57; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_58; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_59; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_60; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_61; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_62; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_63; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  wire [15:0] _diff_T_2 = $signed(io_in) - $signed(regChain_63); // @[\\src\\main\\scala\\controller\\SAccumulator.scala 32:17]
  wire [16:0] diff = {{1{_diff_T_2[15]}},_diff_T_2}; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 31:18 32:8]
  wire [111:0] _GEN_68 = {{95{diff[16]}},diff}; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:14]
  assign io_out = tot; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 35:10]
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:14]
      tot <= 112'sh0;
    end else begin
      tot <= $signed(tot) + $signed(_GEN_68);
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_0 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_0 <= io_in; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 26:15]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_1 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_1 <= regChain_0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_2 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_2 <= regChain_1; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_3 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_3 <= regChain_2; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_4 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_4 <= regChain_3; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_5 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_5 <= regChain_4; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_6 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_6 <= regChain_5; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_7 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_7 <= regChain_6; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_8 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_8 <= regChain_7; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_9 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_9 <= regChain_8; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_10 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_10 <= regChain_9; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_11 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_11 <= regChain_10; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_12 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_12 <= regChain_11; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_13 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_13 <= regChain_12; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_14 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_14 <= regChain_13; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_15 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_15 <= regChain_14; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_16 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_16 <= regChain_15; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_17 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_17 <= regChain_16; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_18 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_18 <= regChain_17; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_19 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_19 <= regChain_18; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_20 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_20 <= regChain_19; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_21 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_21 <= regChain_20; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_22 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_22 <= regChain_21; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_23 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_23 <= regChain_22; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_24 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_24 <= regChain_23; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_25 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_25 <= regChain_24; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_26 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_26 <= regChain_25; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_27 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_27 <= regChain_26; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_28 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_28 <= regChain_27; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_29 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_29 <= regChain_28; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_30 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_30 <= regChain_29; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_31 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_31 <= regChain_30; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_32 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_32 <= regChain_31; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_33 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_33 <= regChain_32; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_34 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_34 <= regChain_33; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_35 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_35 <= regChain_34; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_36 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_36 <= regChain_35; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_37 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_37 <= regChain_36; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_38 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_38 <= regChain_37; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_39 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_39 <= regChain_38; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_40 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_40 <= regChain_39; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_41 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_41 <= regChain_40; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_42 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_42 <= regChain_41; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_43 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_43 <= regChain_42; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_44 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_44 <= regChain_43; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_45 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_45 <= regChain_44; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_46 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_46 <= regChain_45; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_47 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_47 <= regChain_46; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_48 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_48 <= regChain_47; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_49 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_49 <= regChain_48; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_50 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_50 <= regChain_49; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_51 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_51 <= regChain_50; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_52 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_52 <= regChain_51; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_53 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_53 <= regChain_52; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_54 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_54 <= regChain_53; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_55 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_55 <= regChain_54; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_56 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_56 <= regChain_55; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_57 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_57 <= regChain_56; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_58 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_58 <= regChain_57; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_59 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_59 <= regChain_58; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_60 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_60 <= regChain_59; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_61 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_61 <= regChain_60; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_62 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_62 <= regChain_61; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain_63 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
    end else begin
      regChain_63 <= regChain_62; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {4{`RANDOM}};
  tot = _RAND_0[111:0];
  _RAND_1 = {1{`RANDOM}};
  regChain_0 = _RAND_1[15:0];
  _RAND_2 = {1{`RANDOM}};
  regChain_1 = _RAND_2[15:0];
  _RAND_3 = {1{`RANDOM}};
  regChain_2 = _RAND_3[15:0];
  _RAND_4 = {1{`RANDOM}};
  regChain_3 = _RAND_4[15:0];
  _RAND_5 = {1{`RANDOM}};
  regChain_4 = _RAND_5[15:0];
  _RAND_6 = {1{`RANDOM}};
  regChain_5 = _RAND_6[15:0];
  _RAND_7 = {1{`RANDOM}};
  regChain_6 = _RAND_7[15:0];
  _RAND_8 = {1{`RANDOM}};
  regChain_7 = _RAND_8[15:0];
  _RAND_9 = {1{`RANDOM}};
  regChain_8 = _RAND_9[15:0];
  _RAND_10 = {1{`RANDOM}};
  regChain_9 = _RAND_10[15:0];
  _RAND_11 = {1{`RANDOM}};
  regChain_10 = _RAND_11[15:0];
  _RAND_12 = {1{`RANDOM}};
  regChain_11 = _RAND_12[15:0];
  _RAND_13 = {1{`RANDOM}};
  regChain_12 = _RAND_13[15:0];
  _RAND_14 = {1{`RANDOM}};
  regChain_13 = _RAND_14[15:0];
  _RAND_15 = {1{`RANDOM}};
  regChain_14 = _RAND_15[15:0];
  _RAND_16 = {1{`RANDOM}};
  regChain_15 = _RAND_16[15:0];
  _RAND_17 = {1{`RANDOM}};
  regChain_16 = _RAND_17[15:0];
  _RAND_18 = {1{`RANDOM}};
  regChain_17 = _RAND_18[15:0];
  _RAND_19 = {1{`RANDOM}};
  regChain_18 = _RAND_19[15:0];
  _RAND_20 = {1{`RANDOM}};
  regChain_19 = _RAND_20[15:0];
  _RAND_21 = {1{`RANDOM}};
  regChain_20 = _RAND_21[15:0];
  _RAND_22 = {1{`RANDOM}};
  regChain_21 = _RAND_22[15:0];
  _RAND_23 = {1{`RANDOM}};
  regChain_22 = _RAND_23[15:0];
  _RAND_24 = {1{`RANDOM}};
  regChain_23 = _RAND_24[15:0];
  _RAND_25 = {1{`RANDOM}};
  regChain_24 = _RAND_25[15:0];
  _RAND_26 = {1{`RANDOM}};
  regChain_25 = _RAND_26[15:0];
  _RAND_27 = {1{`RANDOM}};
  regChain_26 = _RAND_27[15:0];
  _RAND_28 = {1{`RANDOM}};
  regChain_27 = _RAND_28[15:0];
  _RAND_29 = {1{`RANDOM}};
  regChain_28 = _RAND_29[15:0];
  _RAND_30 = {1{`RANDOM}};
  regChain_29 = _RAND_30[15:0];
  _RAND_31 = {1{`RANDOM}};
  regChain_30 = _RAND_31[15:0];
  _RAND_32 = {1{`RANDOM}};
  regChain_31 = _RAND_32[15:0];
  _RAND_33 = {1{`RANDOM}};
  regChain_32 = _RAND_33[15:0];
  _RAND_34 = {1{`RANDOM}};
  regChain_33 = _RAND_34[15:0];
  _RAND_35 = {1{`RANDOM}};
  regChain_34 = _RAND_35[15:0];
  _RAND_36 = {1{`RANDOM}};
  regChain_35 = _RAND_36[15:0];
  _RAND_37 = {1{`RANDOM}};
  regChain_36 = _RAND_37[15:0];
  _RAND_38 = {1{`RANDOM}};
  regChain_37 = _RAND_38[15:0];
  _RAND_39 = {1{`RANDOM}};
  regChain_38 = _RAND_39[15:0];
  _RAND_40 = {1{`RANDOM}};
  regChain_39 = _RAND_40[15:0];
  _RAND_41 = {1{`RANDOM}};
  regChain_40 = _RAND_41[15:0];
  _RAND_42 = {1{`RANDOM}};
  regChain_41 = _RAND_42[15:0];
  _RAND_43 = {1{`RANDOM}};
  regChain_42 = _RAND_43[15:0];
  _RAND_44 = {1{`RANDOM}};
  regChain_43 = _RAND_44[15:0];
  _RAND_45 = {1{`RANDOM}};
  regChain_44 = _RAND_45[15:0];
  _RAND_46 = {1{`RANDOM}};
  regChain_45 = _RAND_46[15:0];
  _RAND_47 = {1{`RANDOM}};
  regChain_46 = _RAND_47[15:0];
  _RAND_48 = {1{`RANDOM}};
  regChain_47 = _RAND_48[15:0];
  _RAND_49 = {1{`RANDOM}};
  regChain_48 = _RAND_49[15:0];
  _RAND_50 = {1{`RANDOM}};
  regChain_49 = _RAND_50[15:0];
  _RAND_51 = {1{`RANDOM}};
  regChain_50 = _RAND_51[15:0];
  _RAND_52 = {1{`RANDOM}};
  regChain_51 = _RAND_52[15:0];
  _RAND_53 = {1{`RANDOM}};
  regChain_52 = _RAND_53[15:0];
  _RAND_54 = {1{`RANDOM}};
  regChain_53 = _RAND_54[15:0];
  _RAND_55 = {1{`RANDOM}};
  regChain_54 = _RAND_55[15:0];
  _RAND_56 = {1{`RANDOM}};
  regChain_55 = _RAND_56[15:0];
  _RAND_57 = {1{`RANDOM}};
  regChain_56 = _RAND_57[15:0];
  _RAND_58 = {1{`RANDOM}};
  regChain_57 = _RAND_58[15:0];
  _RAND_59 = {1{`RANDOM}};
  regChain_58 = _RAND_59[15:0];
  _RAND_60 = {1{`RANDOM}};
  regChain_59 = _RAND_60[15:0];
  _RAND_61 = {1{`RANDOM}};
  regChain_60 = _RAND_61[15:0];
  _RAND_62 = {1{`RANDOM}};
  regChain_61 = _RAND_62[15:0];
  _RAND_63 = {1{`RANDOM}};
  regChain_62 = _RAND_63[15:0];
  _RAND_64 = {1{`RANDOM}};
  regChain_63 = _RAND_64[15:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    tot = 112'sh0;
  end
  if (reset) begin
    regChain_0 = 16'sh0;
  end
  if (reset) begin
    regChain_1 = 16'sh0;
  end
  if (reset) begin
    regChain_2 = 16'sh0;
  end
  if (reset) begin
    regChain_3 = 16'sh0;
  end
  if (reset) begin
    regChain_4 = 16'sh0;
  end
  if (reset) begin
    regChain_5 = 16'sh0;
  end
  if (reset) begin
    regChain_6 = 16'sh0;
  end
  if (reset) begin
    regChain_7 = 16'sh0;
  end
  if (reset) begin
    regChain_8 = 16'sh0;
  end
  if (reset) begin
    regChain_9 = 16'sh0;
  end
  if (reset) begin
    regChain_10 = 16'sh0;
  end
  if (reset) begin
    regChain_11 = 16'sh0;
  end
  if (reset) begin
    regChain_12 = 16'sh0;
  end
  if (reset) begin
    regChain_13 = 16'sh0;
  end
  if (reset) begin
    regChain_14 = 16'sh0;
  end
  if (reset) begin
    regChain_15 = 16'sh0;
  end
  if (reset) begin
    regChain_16 = 16'sh0;
  end
  if (reset) begin
    regChain_17 = 16'sh0;
  end
  if (reset) begin
    regChain_18 = 16'sh0;
  end
  if (reset) begin
    regChain_19 = 16'sh0;
  end
  if (reset) begin
    regChain_20 = 16'sh0;
  end
  if (reset) begin
    regChain_21 = 16'sh0;
  end
  if (reset) begin
    regChain_22 = 16'sh0;
  end
  if (reset) begin
    regChain_23 = 16'sh0;
  end
  if (reset) begin
    regChain_24 = 16'sh0;
  end
  if (reset) begin
    regChain_25 = 16'sh0;
  end
  if (reset) begin
    regChain_26 = 16'sh0;
  end
  if (reset) begin
    regChain_27 = 16'sh0;
  end
  if (reset) begin
    regChain_28 = 16'sh0;
  end
  if (reset) begin
    regChain_29 = 16'sh0;
  end
  if (reset) begin
    regChain_30 = 16'sh0;
  end
  if (reset) begin
    regChain_31 = 16'sh0;
  end
  if (reset) begin
    regChain_32 = 16'sh0;
  end
  if (reset) begin
    regChain_33 = 16'sh0;
  end
  if (reset) begin
    regChain_34 = 16'sh0;
  end
  if (reset) begin
    regChain_35 = 16'sh0;
  end
  if (reset) begin
    regChain_36 = 16'sh0;
  end
  if (reset) begin
    regChain_37 = 16'sh0;
  end
  if (reset) begin
    regChain_38 = 16'sh0;
  end
  if (reset) begin
    regChain_39 = 16'sh0;
  end
  if (reset) begin
    regChain_40 = 16'sh0;
  end
  if (reset) begin
    regChain_41 = 16'sh0;
  end
  if (reset) begin
    regChain_42 = 16'sh0;
  end
  if (reset) begin
    regChain_43 = 16'sh0;
  end
  if (reset) begin
    regChain_44 = 16'sh0;
  end
  if (reset) begin
    regChain_45 = 16'sh0;
  end
  if (reset) begin
    regChain_46 = 16'sh0;
  end
  if (reset) begin
    regChain_47 = 16'sh0;
  end
  if (reset) begin
    regChain_48 = 16'sh0;
  end
  if (reset) begin
    regChain_49 = 16'sh0;
  end
  if (reset) begin
    regChain_50 = 16'sh0;
  end
  if (reset) begin
    regChain_51 = 16'sh0;
  end
  if (reset) begin
    regChain_52 = 16'sh0;
  end
  if (reset) begin
    regChain_53 = 16'sh0;
  end
  if (reset) begin
    regChain_54 = 16'sh0;
  end
  if (reset) begin
    regChain_55 = 16'sh0;
  end
  if (reset) begin
    regChain_56 = 16'sh0;
  end
  if (reset) begin
    regChain_57 = 16'sh0;
  end
  if (reset) begin
    regChain_58 = 16'sh0;
  end
  if (reset) begin
    regChain_59 = 16'sh0;
  end
  if (reset) begin
    regChain_60 = 16'sh0;
  end
  if (reset) begin
    regChain_61 = 16'sh0;
  end
  if (reset) begin
    regChain_62 = 16'sh0;
  end
  if (reset) begin
    regChain_63 = 16'sh0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PID(
  input         clock,
  input         reset,
  input  [31:0] io_e, // @[\\src\\main\\scala\\controller\\PID.scala 20:14]
  output [31:0] io_response, // @[\\src\\main\\scala\\controller\\PID.scala 20:14]
  output [31:0] io_pResponse, // @[\\src\\main\\scala\\controller\\PID.scala 20:14]
  output [31:0] io_iResponse, // @[\\src\\main\\scala\\controller\\PID.scala 20:14]
  output [31:0] io_dResponse // @[\\src\\main\\scala\\controller\\PID.scala 20:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  wire  accumulator_clock; // @[\\src\\main\\scala\\controller\\PID.scala 27:27]
  wire  accumulator_reset; // @[\\src\\main\\scala\\controller\\PID.scala 27:27]
  wire [15:0] accumulator_io_in; // @[\\src\\main\\scala\\controller\\PID.scala 27:27]
  wire [111:0] accumulator_io_out; // @[\\src\\main\\scala\\controller\\PID.scala 27:27]
  reg [31:0] lastE; // @[\\src\\main\\scala\\controller\\PID.scala 26:22]
  wire [111:0] _intE_T = accumulator_io_out; // @[\\src\\main\\scala\\controller\\PID.scala 32:42]
  wire [31:0] diffE = $signed(io_e) - $signed(lastE); // @[\\src\\main\\scala\\controller\\PID.scala 33:17]
  reg [31:0] pResponse; // @[\\src\\main\\scala\\controller\\PID.scala 35:26]
  reg [31:0] iResponse; // @[\\src\\main\\scala\\controller\\PID.scala 36:26]
  reg [31:0] dResponse; // @[\\src\\main\\scala\\controller\\PID.scala 37:26]
  wire [63:0] _pResponse_T = 32'sh1000000 * $signed(io_e); // @[\\src\\main\\scala\\controller\\PID.scala 38:20]
  wire [31:0] intE = _intE_T[31:0]; // @[\\src\\main\\scala\\controller\\PID.scala 23:18 32:8]
  wire [63:0] _iResponse_T = 32'sh0 * $signed(intE); // @[\\src\\main\\scala\\controller\\PID.scala 39:20]
  wire [63:0] _dResponse_T = 32'sh0 * $signed(diffE); // @[\\src\\main\\scala\\controller\\PID.scala 40:20]
  reg [31:0] res; // @[\\src\\main\\scala\\controller\\PID.scala 45:20]
  wire [31:0] _res_T_2 = $signed(pResponse) + $signed(iResponse); // @[\\src\\main\\scala\\controller\\PID.scala 46:20]
  wire [31:0] _io_response_T_2 = $signed(res) > 32'sh1000000 ? $signed(32'sh1000000) : $signed(res); // @[\\src\\main\\scala\\controller\\PID.scala 51:57]
  wire [39:0] _GEN_2 = _pResponse_T[63:24]; // @[\\src\\main\\scala\\controller\\PID.scala 35:{26,26} 38:13]
  wire [39:0] _GEN_4 = _iResponse_T[63:24]; // @[\\src\\main\\scala\\controller\\PID.scala 36:{26,26} 39:13]
  wire [39:0] _GEN_6 = _dResponse_T[63:24]; // @[\\src\\main\\scala\\controller\\PID.scala 37:{26,26} 40:13]
  SAccumulator accumulator ( // @[\\src\\main\\scala\\controller\\PID.scala 27:27]
    .clock(accumulator_clock),
    .reset(accumulator_reset),
    .io_in(accumulator_io_in),
    .io_out(accumulator_io_out)
  );
  assign io_response = $signed(res) < 32'sh0 ? $signed(32'sh0) : $signed(_io_response_T_2); // @[\\src\\main\\scala\\controller\\PID.scala 51:21]
  assign io_pResponse = pResponse; // @[\\src\\main\\scala\\controller\\PID.scala 41:16]
  assign io_iResponse = iResponse; // @[\\src\\main\\scala\\controller\\PID.scala 42:16]
  assign io_dResponse = dResponse; // @[\\src\\main\\scala\\controller\\PID.scala 43:16]
  assign accumulator_clock = clock;
  assign accumulator_reset = reset;
  assign accumulator_io_in = io_e[15:0]; // @[\\src\\main\\scala\\controller\\PID.scala 29:21]
  always @(posedge clock) begin
    lastE <= io_e; // @[\\src\\main\\scala\\controller\\PID.scala 26:22]
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\PID.scala 35:26]
      pResponse <= 32'sh0; // @[\\src\\main\\scala\\controller\\PID.scala 35:26]
    end else begin
      pResponse <= _GEN_2[31:0]; // @[\\src\\main\\scala\\controller\\PID.scala 38:13]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\PID.scala 36:26]
      iResponse <= 32'sh0; // @[\\src\\main\\scala\\controller\\PID.scala 36:26]
    end else begin
      iResponse <= _GEN_4[31:0]; // @[\\src\\main\\scala\\controller\\PID.scala 39:13]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\PID.scala 37:26]
      dResponse <= 32'sh0; // @[\\src\\main\\scala\\controller\\PID.scala 37:26]
    end else begin
      dResponse <= _GEN_6[31:0]; // @[\\src\\main\\scala\\controller\\PID.scala 40:13]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\PID.scala 46:32]
      res <= 32'sh0;
    end else begin
      res <= $signed(_res_T_2) + $signed(dResponse);
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  lastE = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  pResponse = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  iResponse = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  dResponse = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  res = _RAND_4[31:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    pResponse = 32'sh0;
  end
  if (reset) begin
    iResponse = 32'sh0;
  end
  if (reset) begin
    dResponse = 32'sh0;
  end
  if (reset) begin
    res = 32'sh0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PWM(
  input         clock,
  input         reset,
  input  [31:0] io_in, // @[\\src\\main\\scala\\controller\\PWM.scala 14:14]
  output        io_out // @[\\src\\main\\scala\\controller\\PWM.scala 14:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [24:0] cur; // @[\\src\\main\\scala\\controller\\PWM.scala 16:20]
  wire [24:0] _cur_T_2 = cur + 25'h1; // @[\\src\\main\\scala\\controller\\PWM.scala 17:40]
  wire  ready = cur == 25'h1000000; // @[\\src\\main\\scala\\controller\\PWM.scala 19:19]
  reg [31:0] in; // @[\\src\\main\\scala\\controller\\PWM.scala 21:19]
  wire [31:0] _GEN_0 = {{7'd0}, cur}; // @[\\src\\main\\scala\\controller\\PWM.scala 25:17]
  assign io_out = _GEN_0 < in; // @[\\src\\main\\scala\\controller\\PWM.scala 25:17]
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\PWM.scala 17:13]
      cur <= 25'h0;
    end else if (cur >= 25'h1000000) begin
      cur <= 25'h0;
    end else begin
      cur <= _cur_T_2;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\PWM.scala 22:12]
      in <= 32'h0;
    end else if (ready) begin
      in <= io_in;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  cur = _RAND_0[24:0];
  _RAND_1 = {1{`RANDOM}};
  in = _RAND_1[31:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    cur = 25'h0;
  end
  if (reset) begin
    in = 32'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module SpiSlave(
  input         clock,
  input         reset,
  input         io_sck, // @[\\src\\main\\scala\\controller\\SPI.scala 34:14]
  input         io_mosi, // @[\\src\\main\\scala\\controller\\SPI.scala 34:14]
  output        io_miso, // @[\\src\\main\\scala\\controller\\SPI.scala 34:14]
  input         io_csN, // @[\\src\\main\\scala\\controller\\SPI.scala 34:14]
  output        io_packetUpdate, // @[\\src\\main\\scala\\controller\\SPI.scala 34:14]
  output        io_csNRising, // @[\\src\\main\\scala\\controller\\SPI.scala 34:14]
  output        io_full, // @[\\src\\main\\scala\\controller\\SPI.scala 34:14]
  output [31:0] io_data_setPoint, // @[\\src\\main\\scala\\controller\\SPI.scala 34:14]
  output        io_data_enable, // @[\\src\\main\\scala\\controller\\SPI.scala 34:14]
  input  [31:0] io_data_temperature, // @[\\src\\main\\scala\\controller\\SPI.scala 34:14]
  input  [31:0] io_data_pEffort, // @[\\src\\main\\scala\\controller\\SPI.scala 34:14]
  input  [31:0] io_data_iEffort, // @[\\src\\main\\scala\\controller\\SPI.scala 34:14]
  input  [31:0] io_data_dEffort, // @[\\src\\main\\scala\\controller\\SPI.scala 34:14]
  input  [31:0] io_data_totEffort // @[\\src\\main\\scala\\controller\\SPI.scala 34:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [159:0] _RAND_2;
  reg [159:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  reg  sckPrev; // @[\\src\\main\\scala\\controller\\SPI.scala 40:24]
  reg  csnPrev; // @[\\src\\main\\scala\\controller\\SPI.scala 41:24]
  wire  sckRising = io_sck & ~sckPrev; // @[\\src\\main\\scala\\controller\\SPI.scala 43:25]
  wire  sckFalling = ~io_sck & sckPrev; // @[\\src\\main\\scala\\controller\\SPI.scala 44:27]
  wire  _csnFalling_T = ~io_csN; // @[\\src\\main\\scala\\controller\\SPI.scala 45:20]
  wire  csnFalling = ~io_csN & csnPrev; // @[\\src\\main\\scala\\controller\\SPI.scala 45:25]
  wire  csnRising = io_csN & ~csnPrev; // @[\\src\\main\\scala\\controller\\SPI.scala 46:25]
  reg [159:0] shrMosi; // @[\\src\\main\\scala\\controller\\SPI.scala 48:25]
  reg [159:0] shrMiso; // @[\\src\\main\\scala\\controller\\SPI.scala 49:25]
  reg [7:0] bitCount; // @[\\src\\main\\scala\\controller\\SPI.scala 50:25]
  wire [159:0] _shrMiso_T_5 = {io_data_temperature,io_data_pEffort,io_data_iEffort,io_data_dEffort,io_data_totEffort}; // @[\\src\\main\\scala\\controller\\SPI.scala 53:20]
  wire [160:0] _shrMiso_T_6 = {shrMiso, 1'h0}; // @[\\src\\main\\scala\\controller\\SPI.scala 62:24]
  wire [159:0] _shrMosi_T_1 = {shrMosi[158:0],io_mosi}; // @[\\src\\main\\scala\\controller\\SPI.scala 64:19]
  wire [7:0] _bitCount_T_1 = bitCount + 8'h1; // @[\\src\\main\\scala\\controller\\SPI.scala 65:26]
  wire [160:0] _GEN_2 = _csnFalling_T & sckFalling ? _shrMiso_T_6 : {{1'd0}, shrMiso}; // @[\\src\\main\\scala\\controller\\SPI.scala 61:34 62:13 49:25]
  wire [160:0] _GEN_5 = csnFalling ? {{1'd0}, _shrMiso_T_5} : _GEN_2; // @[\\src\\main\\scala\\controller\\SPI.scala 52:20 53:14]
  reg [31:0] setPointReg; // @[\\src\\main\\scala\\controller\\SPI.scala 70:28]
  reg  enableReg; // @[\\src\\main\\scala\\controller\\SPI.scala 71:28]
  reg  packetUpdateToggle; // @[\\src\\main\\scala\\controller\\SPI.scala 73:35]
  wire [31:0] _setPointReg_T_1 = shrMosi[159:128]; // @[\\src\\main\\scala\\controller\\SPI.scala 75:45]
  assign io_miso = shrMiso[159]; // @[\\src\\main\\scala\\controller\\SPI.scala 68:21]
  assign io_packetUpdate = packetUpdateToggle; // @[\\src\\main\\scala\\controller\\SPI.scala 79:19]
  assign io_csNRising = io_csN & ~csnPrev; // @[\\src\\main\\scala\\controller\\SPI.scala 46:25]
  assign io_full = bitCount == 8'ha0; // @[\\src\\main\\scala\\controller\\SPI.scala 87:17]
  assign io_data_setPoint = setPointReg; // @[\\src\\main\\scala\\controller\\SPI.scala 91:20]
  assign io_data_enable = enableReg; // @[\\src\\main\\scala\\controller\\SPI.scala 92:20]
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SPI.scala 40:24]
      sckPrev <= 1'h0; // @[\\src\\main\\scala\\controller\\SPI.scala 40:24]
    end else begin
      sckPrev <= io_sck; // @[\\src\\main\\scala\\controller\\SPI.scala 40:24]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SPI.scala 41:24]
      csnPrev <= 1'h1; // @[\\src\\main\\scala\\controller\\SPI.scala 41:24]
    end else begin
      csnPrev <= io_csN; // @[\\src\\main\\scala\\controller\\SPI.scala 41:24]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SPI.scala 52:20]
      shrMosi <= 160'h0; // @[\\src\\main\\scala\\controller\\SPI.scala 48:25]
    end else if (!(csnFalling)) begin // @[\\src\\main\\scala\\controller\\SPI.scala 61:34]
      if (!(_csnFalling_T & sckFalling)) begin // @[\\src\\main\\scala\\controller\\SPI.scala 63:33]
        if (_csnFalling_T & sckRising) begin // @[\\src\\main\\scala\\controller\\SPI.scala 48:25]
          shrMosi <= _shrMosi_T_1;
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SPI.scala 49:25]
      shrMiso <= 160'h0; // @[\\src\\main\\scala\\controller\\SPI.scala 49:25]
    end else begin
      shrMiso <= _GEN_5[159:0];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SPI.scala 52:20]
      bitCount <= 8'h0; // @[\\src\\main\\scala\\controller\\SPI.scala 60:14]
    end else if (csnFalling) begin // @[\\src\\main\\scala\\controller\\SPI.scala 61:34]
      bitCount <= 8'h0; // @[\\src\\main\\scala\\controller\\SPI.scala 50:25]
    end else if (!(_csnFalling_T & sckFalling)) begin // @[\\src\\main\\scala\\controller\\SPI.scala 63:33]
      if (_csnFalling_T & sckRising) begin // @[\\src\\main\\scala\\controller\\SPI.scala 50:25]
        bitCount <= _bitCount_T_1;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SPI.scala 74:48]
      setPointReg <= 32'sh12000000; // @[\\src\\main\\scala\\controller\\SPI.scala 75:24]
    end else if (csnRising & bitCount == 8'ha0) begin // @[\\src\\main\\scala\\controller\\SPI.scala 70:28]
      setPointReg <= _setPointReg_T_1;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SPI.scala 74:48]
      enableReg <= 1'h1; // @[\\src\\main\\scala\\controller\\SPI.scala 76:24]
    end else if (csnRising & bitCount == 8'ha0) begin // @[\\src\\main\\scala\\controller\\SPI.scala 71:28]
      enableReg <= shrMosi[96];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SPI.scala 74:48]
      packetUpdateToggle <= 1'h0; // @[\\src\\main\\scala\\controller\\SPI.scala 77:24]
    end else if (csnRising & bitCount == 8'ha0) begin // @[\\src\\main\\scala\\controller\\SPI.scala 73:35]
      packetUpdateToggle <= ~packetUpdateToggle;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  sckPrev = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  csnPrev = _RAND_1[0:0];
  _RAND_2 = {5{`RANDOM}};
  shrMosi = _RAND_2[159:0];
  _RAND_3 = {5{`RANDOM}};
  shrMiso = _RAND_3[159:0];
  _RAND_4 = {1{`RANDOM}};
  bitCount = _RAND_4[7:0];
  _RAND_5 = {1{`RANDOM}};
  setPointReg = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  enableReg = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  packetUpdateToggle = _RAND_7[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    sckPrev = 1'h0;
  end
  if (reset) begin
    csnPrev = 1'h1;
  end
  if (reset) begin
    shrMosi = 160'h0;
  end
  if (reset) begin
    shrMiso = 160'h0;
  end
  if (reset) begin
    bitCount = 8'h0;
  end
  if (reset) begin
    setPointReg = 32'sh12000000;
  end
  if (reset) begin
    enableReg = 1'h1;
  end
  if (reset) begin
    packetUpdateToggle = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Controller(
  input        clock,
  input        reset,
  input        io_ADCIn, // @[\\src\\main\\scala\\controller\\Controller.scala 44:14]
  output [7:0] io_DACOut, // @[\\src\\main\\scala\\controller\\Controller.scala 44:14]
  output [7:0] io_ADCOut, // @[\\src\\main\\scala\\controller\\Controller.scala 44:14]
  output       io_coolingResponse, // @[\\src\\main\\scala\\controller\\Controller.scala 44:14]
  output [6:0] io_sseg, // @[\\src\\main\\scala\\controller\\Controller.scala 44:14]
  output [3:0] io_an, // @[\\src\\main\\scala\\controller\\Controller.scala 44:14]
  output       io_packetUpdate, // @[\\src\\main\\scala\\controller\\Controller.scala 44:14]
  output       io_full, // @[\\src\\main\\scala\\controller\\Controller.scala 44:14]
  output       io_csNRising, // @[\\src\\main\\scala\\controller\\Controller.scala 44:14]
  input        io_sck, // @[\\src\\main\\scala\\controller\\Controller.scala 44:14]
  input        io_csN, // @[\\src\\main\\scala\\controller\\Controller.scala 44:14]
  input        io_mosi, // @[\\src\\main\\scala\\controller\\Controller.scala 44:14]
  output       io_miso, // @[\\src\\main\\scala\\controller\\Controller.scala 44:14]
  output       io_csNOut, // @[\\src\\main\\scala\\controller\\Controller.scala 44:14]
  output       io_sckOut // @[\\src\\main\\scala\\controller\\Controller.scala 44:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
`endif // RANDOMIZE_REG_INIT
  wire  adc_clock; // @[\\src\\main\\scala\\controller\\Controller.scala 53:21]
  wire  adc_reset; // @[\\src\\main\\scala\\controller\\Controller.scala 53:21]
  wire  adc_io_in; // @[\\src\\main\\scala\\controller\\Controller.scala 53:21]
  wire [7:0] adc_io_out; // @[\\src\\main\\scala\\controller\\Controller.scala 53:21]
  wire [7:0] adc_io_DACOut; // @[\\src\\main\\scala\\controller\\Controller.scala 53:21]
  wire  inputSmoothener_clock; // @[\\src\\main\\scala\\controller\\Controller.scala 58:33]
  wire  inputSmoothener_reset; // @[\\src\\main\\scala\\controller\\Controller.scala 58:33]
  wire [15:0] inputSmoothener_io_in; // @[\\src\\main\\scala\\controller\\Controller.scala 58:33]
  wire [24:0] inputSmoothener_io_out; // @[\\src\\main\\scala\\controller\\Controller.scala 58:33]
  wire  inputSmoothener_io_valid; // @[\\src\\main\\scala\\controller\\Controller.scala 58:33]
  wire [7:0] tempLookup_io_in; // @[\\src\\main\\scala\\controller\\Controller.scala 62:28]
  wire [31:0] tempLookup_io_out; // @[\\src\\main\\scala\\controller\\Controller.scala 62:28]
  wire  display_clock; // @[\\src\\main\\scala\\controller\\Controller.scala 73:25]
  wire  display_reset; // @[\\src\\main\\scala\\controller\\Controller.scala 73:25]
  wire [31:0] display_io_currentTemp; // @[\\src\\main\\scala\\controller\\Controller.scala 73:25]
  wire [31:0] display_io_targetTemp; // @[\\src\\main\\scala\\controller\\Controller.scala 73:25]
  wire  display_io_enable; // @[\\src\\main\\scala\\controller\\Controller.scala 73:25]
  wire [6:0] display_io_sseg; // @[\\src\\main\\scala\\controller\\Controller.scala 73:25]
  wire [3:0] display_io_an; // @[\\src\\main\\scala\\controller\\Controller.scala 73:25]
  wire  pid_clock; // @[\\src\\main\\scala\\controller\\Controller.scala 93:21]
  wire  pid_reset; // @[\\src\\main\\scala\\controller\\Controller.scala 93:21]
  wire [31:0] pid_io_e; // @[\\src\\main\\scala\\controller\\Controller.scala 93:21]
  wire [31:0] pid_io_response; // @[\\src\\main\\scala\\controller\\Controller.scala 93:21]
  wire [31:0] pid_io_pResponse; // @[\\src\\main\\scala\\controller\\Controller.scala 93:21]
  wire [31:0] pid_io_iResponse; // @[\\src\\main\\scala\\controller\\Controller.scala 93:21]
  wire [31:0] pid_io_dResponse; // @[\\src\\main\\scala\\controller\\Controller.scala 93:21]
  wire  coolingPWM_clock; // @[\\src\\main\\scala\\controller\\Controller.scala 100:28]
  wire  coolingPWM_reset; // @[\\src\\main\\scala\\controller\\Controller.scala 100:28]
  wire [31:0] coolingPWM_io_in; // @[\\src\\main\\scala\\controller\\Controller.scala 100:28]
  wire  coolingPWM_io_out; // @[\\src\\main\\scala\\controller\\Controller.scala 100:28]
  wire  spi_clock; // @[\\src\\main\\scala\\controller\\Controller.scala 103:21]
  wire  spi_reset; // @[\\src\\main\\scala\\controller\\Controller.scala 103:21]
  wire  spi_io_sck; // @[\\src\\main\\scala\\controller\\Controller.scala 103:21]
  wire  spi_io_mosi; // @[\\src\\main\\scala\\controller\\Controller.scala 103:21]
  wire  spi_io_miso; // @[\\src\\main\\scala\\controller\\Controller.scala 103:21]
  wire  spi_io_csN; // @[\\src\\main\\scala\\controller\\Controller.scala 103:21]
  wire  spi_io_packetUpdate; // @[\\src\\main\\scala\\controller\\Controller.scala 103:21]
  wire  spi_io_csNRising; // @[\\src\\main\\scala\\controller\\Controller.scala 103:21]
  wire  spi_io_full; // @[\\src\\main\\scala\\controller\\Controller.scala 103:21]
  wire [31:0] spi_io_data_setPoint; // @[\\src\\main\\scala\\controller\\Controller.scala 103:21]
  wire  spi_io_data_enable; // @[\\src\\main\\scala\\controller\\Controller.scala 103:21]
  wire [31:0] spi_io_data_temperature; // @[\\src\\main\\scala\\controller\\Controller.scala 103:21]
  wire [31:0] spi_io_data_pEffort; // @[\\src\\main\\scala\\controller\\Controller.scala 103:21]
  wire [31:0] spi_io_data_iEffort; // @[\\src\\main\\scala\\controller\\Controller.scala 103:21]
  wire [31:0] spi_io_data_dEffort; // @[\\src\\main\\scala\\controller\\Controller.scala 103:21]
  wire [31:0] spi_io_data_totEffort; // @[\\src\\main\\scala\\controller\\Controller.scala 103:21]
  reg  synchronizedReset_REG; // @[\\src\\main\\scala\\controller\\Controller.scala 46:42]
  reg  synchronizedReset; // @[\\src\\main\\scala\\controller\\Controller.scala 46:34]
  reg  ADCIn_REG; // @[\\src\\main\\scala\\controller\\Controller.scala 49:32]
  reg  ADCIn; // @[\\src\\main\\scala\\controller\\Controller.scala 49:24]
  reg [31:0] targetTemp; // @[\\src\\main\\scala\\controller\\Controller.scala 50:29]
  reg  enable; // @[\\src\\main\\scala\\controller\\Controller.scala 51:25]
  reg [25:0] adcCnt; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
  wire  wrap_wrap = adcCnt == 26'h2faf07f; // @[src/main/scala/chisel3/util/Counter.scala 73:24]
  wire [25:0] _wrap_value_T_1 = adcCnt + 26'h1; // @[src/main/scala/chisel3/util/Counter.scala 77:24]
  reg [7:0] regADC; // @[\\src\\main\\scala\\controller\\Controller.scala 67:25]
  wire [16:0] _GEN_3 = wrap_wrap ? inputSmoothener_io_out[24:8] : {{9'd0}, regADC}; // @[\\src\\main\\scala\\controller\\Controller.scala 68:20 69:14 67:25]
  reg [25:0] curTempCnt; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
  wire  wrap_wrap_1 = curTempCnt == 26'h2faf07f; // @[src/main/scala/chisel3/util/Counter.scala 73:24]
  wire [25:0] _wrap_value_T_3 = curTempCnt + 26'h1; // @[src/main/scala/chisel3/util/Counter.scala 77:24]
  reg [31:0] regCurTemp; // @[\\src\\main\\scala\\controller\\Controller.scala 75:29]
  wire [31:0] _regCurTemp_T = tempLookup_io_out; // @[\\src\\main\\scala\\controller\\Controller.scala 77:29]
  reg [25:0] targetTempCnt; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
  wire  wrap_wrap_2 = targetTempCnt == 26'h2faf07f; // @[src/main/scala/chisel3/util/Counter.scala 73:24]
  wire [25:0] _wrap_value_T_5 = targetTempCnt + 26'h1; // @[src/main/scala/chisel3/util/Counter.scala 77:24]
  reg [31:0] regTargetTemp; // @[\\src\\main\\scala\\controller\\Controller.scala 81:32]
  reg  csNOut_REG; // @[\\src\\main\\scala\\controller\\Controller.scala 104:33]
  reg  csNOut; // @[\\src\\main\\scala\\controller\\Controller.scala 104:25]
  reg  sckOut_REG; // @[\\src\\main\\scala\\controller\\Controller.scala 105:33]
  reg  sckOut; // @[\\src\\main\\scala\\controller\\Controller.scala 105:25]
  reg  spi_io_mosi_REG; // @[\\src\\main\\scala\\controller\\Controller.scala 110:35]
  reg  spi_io_mosi_REG_1; // @[\\src\\main\\scala\\controller\\Controller.scala 110:27]
  ADC adc ( // @[\\src\\main\\scala\\controller\\Controller.scala 53:21]
    .clock(adc_clock),
    .reset(adc_reset),
    .io_in(adc_io_in),
    .io_out(adc_io_out),
    .io_DACOut(adc_io_DACOut)
  );
  Accumulator inputSmoothener ( // @[\\src\\main\\scala\\controller\\Controller.scala 58:33]
    .clock(inputSmoothener_clock),
    .reset(inputSmoothener_reset),
    .io_in(inputSmoothener_io_in),
    .io_out(inputSmoothener_io_out),
    .io_valid(inputSmoothener_io_valid)
  );
  TemperatureLookup tempLookup ( // @[\\src\\main\\scala\\controller\\Controller.scala 62:28]
    .io_in(tempLookup_io_in),
    .io_out(tempLookup_io_out)
  );
  Display display ( // @[\\src\\main\\scala\\controller\\Controller.scala 73:25]
    .clock(display_clock),
    .reset(display_reset),
    .io_currentTemp(display_io_currentTemp),
    .io_targetTemp(display_io_targetTemp),
    .io_enable(display_io_enable),
    .io_sseg(display_io_sseg),
    .io_an(display_io_an)
  );
  PID pid ( // @[\\src\\main\\scala\\controller\\Controller.scala 93:21]
    .clock(pid_clock),
    .reset(pid_reset),
    .io_e(pid_io_e),
    .io_response(pid_io_response),
    .io_pResponse(pid_io_pResponse),
    .io_iResponse(pid_io_iResponse),
    .io_dResponse(pid_io_dResponse)
  );
  PWM coolingPWM ( // @[\\src\\main\\scala\\controller\\Controller.scala 100:28]
    .clock(coolingPWM_clock),
    .reset(coolingPWM_reset),
    .io_in(coolingPWM_io_in),
    .io_out(coolingPWM_io_out)
  );
  SpiSlave spi ( // @[\\src\\main\\scala\\controller\\Controller.scala 103:21]
    .clock(spi_clock),
    .reset(spi_reset),
    .io_sck(spi_io_sck),
    .io_mosi(spi_io_mosi),
    .io_miso(spi_io_miso),
    .io_csN(spi_io_csN),
    .io_packetUpdate(spi_io_packetUpdate),
    .io_csNRising(spi_io_csNRising),
    .io_full(spi_io_full),
    .io_data_setPoint(spi_io_data_setPoint),
    .io_data_enable(spi_io_data_enable),
    .io_data_temperature(spi_io_data_temperature),
    .io_data_pEffort(spi_io_data_pEffort),
    .io_data_iEffort(spi_io_data_iEffort),
    .io_data_dEffort(spi_io_data_dEffort),
    .io_data_totEffort(spi_io_data_totEffort)
  );
  assign io_DACOut = adc_io_DACOut; // @[\\src\\main\\scala\\controller\\Controller.scala 55:15]
  assign io_ADCOut = regADC; // @[\\src\\main\\scala\\controller\\Controller.scala 71:15]
  assign io_coolingResponse = inputSmoothener_io_valid & enable & ($signed(pid_io_response) > 32'sh0 & coolingPWM_io_out
    ); // @[\\src\\main\\scala\\controller\\Controller.scala 125:47 126:26 128:26]
  assign io_sseg = display_io_sseg; // @[\\src\\main\\scala\\controller\\Controller.scala 87:13]
  assign io_an = display_io_an; // @[\\src\\main\\scala\\controller\\Controller.scala 88:11]
  assign io_packetUpdate = spi_io_packetUpdate; // @[\\src\\main\\scala\\controller\\Controller.scala 113:21]
  assign io_full = spi_io_full; // @[\\src\\main\\scala\\controller\\Controller.scala 115:13]
  assign io_csNRising = spi_io_csNRising; // @[\\src\\main\\scala\\controller\\Controller.scala 114:18]
  assign io_miso = spi_io_miso; // @[\\src\\main\\scala\\controller\\Controller.scala 112:13]
  assign io_csNOut = csNOut; // @[\\src\\main\\scala\\controller\\Controller.scala 106:15]
  assign io_sckOut = sckOut; // @[\\src\\main\\scala\\controller\\Controller.scala 107:15]
  assign adc_clock = clock;
  assign adc_reset = synchronizedReset; // @[\\src\\main\\scala\\controller\\Controller.scala 48:31]
  assign adc_io_in = ADCIn; // @[\\src\\main\\scala\\controller\\Controller.scala 54:15]
  assign inputSmoothener_clock = clock;
  assign inputSmoothener_reset = synchronizedReset; // @[\\src\\main\\scala\\controller\\Controller.scala 48:31]
  assign inputSmoothener_io_in = {{8'd0}, adc_io_out}; // @[\\src\\main\\scala\\controller\\Controller.scala 59:27]
  assign tempLookup_io_in = inputSmoothener_io_out[15:8]; // @[\\src\\main\\scala\\controller\\Controller.scala 63:22]
  assign display_clock = clock;
  assign display_reset = synchronizedReset; // @[\\src\\main\\scala\\controller\\Controller.scala 48:31]
  assign display_io_currentTemp = regCurTemp; // @[\\src\\main\\scala\\controller\\Controller.scala 79:28]
  assign display_io_targetTemp = regTargetTemp; // @[\\src\\main\\scala\\controller\\Controller.scala 85:27]
  assign display_io_enable = enable; // @[\\src\\main\\scala\\controller\\Controller.scala 86:23]
  assign pid_clock = clock;
  assign pid_reset = synchronizedReset; // @[\\src\\main\\scala\\controller\\Controller.scala 48:31]
  assign pid_io_e = $signed(tempLookup_io_out) - $signed(targetTemp); // @[\\src\\main\\scala\\controller\\Controller.scala 91:18]
  assign coolingPWM_clock = clock;
  assign coolingPWM_reset = synchronizedReset; // @[\\src\\main\\scala\\controller\\Controller.scala 48:31]
  assign coolingPWM_io_in = pid_io_response; // @[\\src\\main\\scala\\controller\\Controller.scala 99:36]
  assign spi_clock = clock;
  assign spi_reset = synchronizedReset; // @[\\src\\main\\scala\\controller\\Controller.scala 48:31]
  assign spi_io_sck = sckOut; // @[\\src\\main\\scala\\controller\\Controller.scala 108:16]
  assign spi_io_mosi = spi_io_mosi_REG_1; // @[\\src\\main\\scala\\controller\\Controller.scala 110:17]
  assign spi_io_csN = csNOut; // @[\\src\\main\\scala\\controller\\Controller.scala 109:16]
  assign spi_io_data_temperature = tempLookup_io_out; // @[\\src\\main\\scala\\controller\\Controller.scala 119:40]
  assign spi_io_data_pEffort = pid_io_pResponse; // @[\\src\\main\\scala\\controller\\Controller.scala 120:45]
  assign spi_io_data_iEffort = pid_io_iResponse; // @[\\src\\main\\scala\\controller\\Controller.scala 121:45]
  assign spi_io_data_dEffort = pid_io_dResponse; // @[\\src\\main\\scala\\controller\\Controller.scala 122:45]
  assign spi_io_data_totEffort = pid_io_response; // @[\\src\\main\\scala\\controller\\Controller.scala 123:46]
  always @(posedge clock) begin
    synchronizedReset_REG <= reset; // @[\\src\\main\\scala\\controller\\Controller.scala 46:42]
    synchronizedReset <= synchronizedReset_REG; // @[\\src\\main\\scala\\controller\\Controller.scala 46:34]
  end
  always @(posedge clock or posedge synchronizedReset) begin
    if (synchronizedReset) begin // @[\\src\\main\\scala\\controller\\Controller.scala 49:32]
      ADCIn_REG <= 1'h1; // @[\\src\\main\\scala\\controller\\Controller.scala 49:32]
    end else begin
      ADCIn_REG <= io_ADCIn; // @[\\src\\main\\scala\\controller\\Controller.scala 49:32]
    end
  end
  always @(posedge clock or posedge synchronizedReset) begin
    if (synchronizedReset) begin // @[\\src\\main\\scala\\controller\\Controller.scala 49:24]
      ADCIn <= 1'h0; // @[\\src\\main\\scala\\controller\\Controller.scala 49:24]
    end else begin
      ADCIn <= ADCIn_REG; // @[\\src\\main\\scala\\controller\\Controller.scala 49:24]
    end
  end
  always @(posedge clock or posedge synchronizedReset) begin
    if (synchronizedReset) begin // @[\\src\\main\\scala\\controller\\Controller.scala 117:52]
      targetTemp <= 32'sh12000000;
    end else begin
      targetTemp <= spi_io_data_setPoint;
    end
  end
  always @(posedge clock or posedge synchronizedReset) begin
    if (synchronizedReset) begin // @[\\src\\main\\scala\\controller\\Controller.scala 51:25]
      enable <= 1'h1; // @[\\src\\main\\scala\\controller\\Controller.scala 51:25]
    end else begin
      enable <= spi_io_data_enable; // @[\\src\\main\\scala\\controller\\Controller.scala 118:12]
    end
  end
  always @(posedge clock or posedge synchronizedReset) begin
    if (synchronizedReset) begin // @[src/main/scala/chisel3/util/Counter.scala 87:20]
      adcCnt <= 26'h0; // @[src/main/scala/chisel3/util/Counter.scala 87:28]
    end else if (wrap_wrap) begin // @[src/main/scala/chisel3/util/Counter.scala 77:15]
      adcCnt <= 26'h0;
    end else begin
      adcCnt <= _wrap_value_T_1;
    end
  end
  always @(posedge clock or posedge synchronizedReset) begin
    if (synchronizedReset) begin // @[\\src\\main\\scala\\controller\\Controller.scala 67:25]
      regADC <= 8'h0; // @[\\src\\main\\scala\\controller\\Controller.scala 67:25]
    end else begin
      regADC <= _GEN_3[7:0];
    end
  end
  always @(posedge clock or posedge synchronizedReset) begin
    if (synchronizedReset) begin // @[src/main/scala/chisel3/util/Counter.scala 87:20]
      curTempCnt <= 26'h0; // @[src/main/scala/chisel3/util/Counter.scala 87:28]
    end else if (wrap_wrap_1) begin // @[src/main/scala/chisel3/util/Counter.scala 77:15]
      curTempCnt <= 26'h0;
    end else begin
      curTempCnt <= _wrap_value_T_3;
    end
  end
  always @(posedge clock or posedge synchronizedReset) begin
    if (synchronizedReset) begin // @[\\src\\main\\scala\\controller\\Controller.scala 76:24]
      regCurTemp <= 32'sh0; // @[\\src\\main\\scala\\controller\\Controller.scala 77:18]
    end else if (wrap_wrap_1) begin // @[\\src\\main\\scala\\controller\\Controller.scala 75:29]
      regCurTemp <= _regCurTemp_T;
    end
  end
  always @(posedge clock or posedge synchronizedReset) begin
    if (synchronizedReset) begin // @[src/main/scala/chisel3/util/Counter.scala 87:20]
      targetTempCnt <= 26'h0; // @[src/main/scala/chisel3/util/Counter.scala 87:28]
    end else if (wrap_wrap_2) begin // @[src/main/scala/chisel3/util/Counter.scala 77:15]
      targetTempCnt <= 26'h0;
    end else begin
      targetTempCnt <= _wrap_value_T_5;
    end
  end
  always @(posedge clock or posedge synchronizedReset) begin
    if (synchronizedReset) begin // @[\\src\\main\\scala\\controller\\Controller.scala 82:27]
      regTargetTemp <= 32'sh0; // @[\\src\\main\\scala\\controller\\Controller.scala 83:21]
    end else if (wrap_wrap_2) begin // @[\\src\\main\\scala\\controller\\Controller.scala 81:32]
      regTargetTemp <= targetTemp;
    end
  end
  always @(posedge clock or posedge synchronizedReset) begin
    if (synchronizedReset) begin // @[\\src\\main\\scala\\controller\\Controller.scala 104:33]
      csNOut_REG <= 1'h1; // @[\\src\\main\\scala\\controller\\Controller.scala 104:33]
    end else begin
      csNOut_REG <= io_csN; // @[\\src\\main\\scala\\controller\\Controller.scala 104:33]
    end
  end
  always @(posedge clock or posedge synchronizedReset) begin
    if (synchronizedReset) begin // @[\\src\\main\\scala\\controller\\Controller.scala 104:25]
      csNOut <= 1'h1; // @[\\src\\main\\scala\\controller\\Controller.scala 104:25]
    end else begin
      csNOut <= csNOut_REG; // @[\\src\\main\\scala\\controller\\Controller.scala 104:25]
    end
  end
  always @(posedge clock or posedge synchronizedReset) begin
    if (synchronizedReset) begin // @[\\src\\main\\scala\\controller\\Controller.scala 105:33]
      sckOut_REG <= 1'h0; // @[\\src\\main\\scala\\controller\\Controller.scala 105:33]
    end else begin
      sckOut_REG <= io_sck; // @[\\src\\main\\scala\\controller\\Controller.scala 105:33]
    end
  end
  always @(posedge clock or posedge synchronizedReset) begin
    if (synchronizedReset) begin // @[\\src\\main\\scala\\controller\\Controller.scala 105:25]
      sckOut <= 1'h0; // @[\\src\\main\\scala\\controller\\Controller.scala 105:25]
    end else begin
      sckOut <= sckOut_REG; // @[\\src\\main\\scala\\controller\\Controller.scala 105:25]
    end
  end
  always @(posedge clock or posedge synchronizedReset) begin
    if (synchronizedReset) begin // @[\\src\\main\\scala\\controller\\Controller.scala 110:35]
      spi_io_mosi_REG <= 1'h0; // @[\\src\\main\\scala\\controller\\Controller.scala 110:35]
    end else begin
      spi_io_mosi_REG <= io_mosi; // @[\\src\\main\\scala\\controller\\Controller.scala 110:35]
    end
  end
  always @(posedge clock or posedge synchronizedReset) begin
    if (synchronizedReset) begin // @[\\src\\main\\scala\\controller\\Controller.scala 110:27]
      spi_io_mosi_REG_1 <= 1'h0; // @[\\src\\main\\scala\\controller\\Controller.scala 110:27]
    end else begin
      spi_io_mosi_REG_1 <= spi_io_mosi_REG; // @[\\src\\main\\scala\\controller\\Controller.scala 110:27]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  synchronizedReset_REG = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  synchronizedReset = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  ADCIn_REG = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  ADCIn = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  targetTemp = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  enable = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  adcCnt = _RAND_6[25:0];
  _RAND_7 = {1{`RANDOM}};
  regADC = _RAND_7[7:0];
  _RAND_8 = {1{`RANDOM}};
  curTempCnt = _RAND_8[25:0];
  _RAND_9 = {1{`RANDOM}};
  regCurTemp = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  targetTempCnt = _RAND_10[25:0];
  _RAND_11 = {1{`RANDOM}};
  regTargetTemp = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  csNOut_REG = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  csNOut = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  sckOut_REG = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  sckOut = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  spi_io_mosi_REG = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  spi_io_mosi_REG_1 = _RAND_17[0:0];
`endif // RANDOMIZE_REG_INIT
  if (synchronizedReset) begin
    ADCIn_REG = 1'h1;
  end
  if (synchronizedReset) begin
    ADCIn = 1'h0;
  end
  if (synchronizedReset) begin
    targetTemp = 32'sh12000000;
  end
  if (synchronizedReset) begin
    enable = 1'h1;
  end
  if (synchronizedReset) begin
    adcCnt = 26'h0;
  end
  if (synchronizedReset) begin
    regADC = 8'h0;
  end
  if (synchronizedReset) begin
    curTempCnt = 26'h0;
  end
  if (synchronizedReset) begin
    regCurTemp = 32'sh0;
  end
  if (synchronizedReset) begin
    targetTempCnt = 26'h0;
  end
  if (synchronizedReset) begin
    regTargetTemp = 32'sh0;
  end
  if (synchronizedReset) begin
    csNOut_REG = 1'h1;
  end
  if (synchronizedReset) begin
    csNOut = 1'h1;
  end
  if (synchronizedReset) begin
    sckOut_REG = 1'h0;
  end
  if (synchronizedReset) begin
    sckOut = 1'h0;
  end
  if (synchronizedReset) begin
    spi_io_mosi_REG = 1'h0;
  end
  if (synchronizedReset) begin
    spi_io_mosi_REG_1 = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
