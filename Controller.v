module ADC(
  input        clock,
  input        reset,
  input        io_in, // @[\\src\\main\\scala\\controller\\ADC.scala 14:14]
  output [7:0] io_out, // @[\\src\\main\\scala\\controller\\ADC.scala 14:14]
  output [7:0] io_DACOut, // @[\\src\\main\\scala\\controller\\ADC.scala 14:14]
  output       io_valid // @[\\src\\main\\scala\\controller\\ADC.scala 14:14]
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
  reg [7:0] sampleCnt; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
  wire  wrap_wrap = sampleCnt == 8'hf9; // @[src/main/scala/chisel3/util/Counter.scala 73:24]
  wire [7:0] _wrap_value_T_1 = sampleCnt + 8'h1; // @[src/main/scala/chisel3/util/Counter.scala 77:24]
  wire  sampleWrap = _T & wrap_wrap; // @[src/main/scala/chisel3/util/Counter.scala 118:{16,23} 117:24]
  reg [2:0] bitCnt; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
  wire  wrap_wrap_1 = bitCnt == 3'h7; // @[src/main/scala/chisel3/util/Counter.scala 73:24]
  wire [2:0] _wrap_value_T_3 = bitCnt + 3'h1; // @[src/main/scala/chisel3/util/Counter.scala 77:24]
  wire  incBit = 2'h0 == state ? 1'h0 : 2'h1 == state; // @[\\src\\main\\scala\\controller\\ADC.scala 24:10 32:17]
  wire [2:0] _GEN_3 = incBit ? _wrap_value_T_3 : bitCnt; // @[src/main/scala/chisel3/util/Counter.scala 118:16 77:15 61:40]
  reg [7:0] regOutput; // @[\\src\\main\\scala\\controller\\ADC.scala 28:26]
  reg  validOut; // @[\\src\\main\\scala\\controller\\ADC.scala 29:25]
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
  assign io_valid = validOut; // @[\\src\\main\\scala\\controller\\ADC.scala 60:12]
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
      sampleCnt <= 8'h0; // @[src/main/scala/chisel3/util/Counter.scala 77:15 87:{20,28}]
    end else if (_T) begin // @[src/main/scala/chisel3/util/Counter.scala 61:40]
      if (wrap_wrap) begin
        sampleCnt <= 8'h0;
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
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\ADC.scala 32:17]
      validOut <= 1'h0; // @[\\src\\main\\scala\\controller\\ADC.scala 30:12]
    end else if (2'h0 == state) begin // @[\\src\\main\\scala\\controller\\ADC.scala 32:17]
      validOut <= 1'h0; // @[\\src\\main\\scala\\controller\\ADC.scala 30:12]
    end else if (2'h1 == state) begin
      validOut <= 1'h0;
    end else begin
      validOut <= 2'h2 == state;
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
  sampleCnt = _RAND_9[7:0];
  _RAND_10 = {1{`RANDOM}};
  bitCnt = _RAND_10[2:0];
  _RAND_11 = {1{`RANDOM}};
  regOutput = _RAND_11[7:0];
  _RAND_12 = {1{`RANDOM}};
  validOut = _RAND_12[0:0];
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
    sampleCnt = 8'h0;
  end
  if (reset) begin
    bitCnt = 3'h0;
  end
  if (reset) begin
    regOutput = 8'h0;
  end
  if (reset) begin
    validOut = 1'h0;
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
  input  [7:0]  io_in, // @[\\src\\main\\scala\\controller\\Accumulator.scala 16:14]
  input         io_update, // @[\\src\\main\\scala\\controller\\Accumulator.scala 16:14]
  output [14:0] io_out, // @[\\src\\main\\scala\\controller\\Accumulator.scala 16:14]
  output        io_valid // @[\\src\\main\\scala\\controller\\Accumulator.scala 16:14]
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
`endif // RANDOMIZE_REG_INIT
  reg [14:0] tot; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:20]
  reg [7:0] regChain_0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_1; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_2; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_3; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_4; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_5; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_6; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_7; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_8; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_9; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_10; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_11; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_12; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_13; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_14; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_15; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_16; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_17; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_18; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_19; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_20; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_21; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_22; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_23; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_24; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_25; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_26; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_27; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_28; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_29; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_30; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_31; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_32; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_33; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_34; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_35; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_36; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_37; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_38; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_39; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_40; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_41; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_42; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_43; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_44; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_45; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_46; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_47; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_48; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_49; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_50; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_51; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_52; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_53; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_54; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_55; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_56; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_57; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_58; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_59; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_60; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_61; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_62; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [7:0] regChain_63; // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
  reg [6:0] cnt; // @[\\src\\main\\scala\\controller\\Accumulator.scala 21:20]
  wire [6:0] _cnt_T_3 = cnt + 7'h1; // @[\\src\\main\\scala\\controller\\Accumulator.scala 22:41]
  reg  full; // @[\\src\\main\\scala\\controller\\Accumulator.scala 23:21]
  wire [8:0] _diff_T_1 = {1'h0,io_in}; // @[\\src\\main\\scala\\controller\\Accumulator.scala 41:33]
  wire [8:0] _diff_T_3 = {1'h0,regChain_63}; // @[\\src\\main\\scala\\controller\\Accumulator.scala 41:72]
  wire [8:0] _diff_T_6 = $signed(_diff_T_1) - $signed(_diff_T_3); // @[\\src\\main\\scala\\controller\\Accumulator.scala 41:40]
  wire [9:0] diff = {{1{_diff_T_6[8]}},_diff_T_6}; // @[\\src\\main\\scala\\controller\\Accumulator.scala 40:20 41:10]
  wire [14:0] _GEN_131 = {{5{diff[9]}},diff}; // @[\\src\\main\\scala\\controller\\Accumulator.scala 43:24]
  wire [14:0] _tot_T_4 = $signed(tot) + $signed(_GEN_131); // @[\\src\\main\\scala\\controller\\Accumulator.scala 43:32]
  assign io_out = tot; // @[\\src\\main\\scala\\controller\\Accumulator.scala 46:10]
  assign io_valid = full; // @[\\src\\main\\scala\\controller\\Accumulator.scala 25:12]
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      tot <= 15'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 43:9]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:20]
      tot <= _tot_T_4;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_0 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 35:17]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_0 <= io_in;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_1 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_1 <= regChain_0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_2 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_2 <= regChain_1;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_3 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_3 <= regChain_2;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_4 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_4 <= regChain_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_5 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_5 <= regChain_4;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_6 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_6 <= regChain_5;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_7 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_7 <= regChain_6;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_8 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_8 <= regChain_7;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_9 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_9 <= regChain_8;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_10 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_10 <= regChain_9;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_11 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_11 <= regChain_10;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_12 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_12 <= regChain_11;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_13 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_13 <= regChain_12;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_14 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_14 <= regChain_13;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_15 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_15 <= regChain_14;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_16 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_16 <= regChain_15;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_17 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_17 <= regChain_16;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_18 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_18 <= regChain_17;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_19 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_19 <= regChain_18;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_20 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_20 <= regChain_19;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_21 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_21 <= regChain_20;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_22 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_22 <= regChain_21;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_23 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_23 <= regChain_22;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_24 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_24 <= regChain_23;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_25 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_25 <= regChain_24;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_26 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_26 <= regChain_25;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_27 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_27 <= regChain_26;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_28 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_28 <= regChain_27;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_29 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_29 <= regChain_28;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_30 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_30 <= regChain_29;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_31 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_31 <= regChain_30;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_32 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_32 <= regChain_31;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_33 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_33 <= regChain_32;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_34 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_34 <= regChain_33;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_35 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_35 <= regChain_34;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_36 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_36 <= regChain_35;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_37 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_37 <= regChain_36;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_38 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_38 <= regChain_37;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_39 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_39 <= regChain_38;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_40 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_40 <= regChain_39;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_41 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_41 <= regChain_40;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_42 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_42 <= regChain_41;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_43 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_43 <= regChain_42;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_44 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_44 <= regChain_43;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_45 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_45 <= regChain_44;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_46 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_46 <= regChain_45;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_47 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_47 <= regChain_46;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_48 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_48 <= regChain_47;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_49 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_49 <= regChain_48;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_50 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_50 <= regChain_49;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_51 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_51 <= regChain_50;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_52 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_52 <= regChain_51;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_53 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_53 <= regChain_52;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_54 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_54 <= regChain_53;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_55 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_55 <= regChain_54;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_56 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_56 <= regChain_55;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_57 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_57 <= regChain_56;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_58 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_58 <= regChain_57;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_59 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_59 <= regChain_58;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_60 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_60 <= regChain_59;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_61 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_61 <= regChain_60;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_62 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_62 <= regChain_61;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:26]
      regChain_63 <= 8'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 18:25]
      regChain_63 <= regChain_62;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 22:13]
      cnt <= 7'h0;
    end else if (io_update & cnt < 7'h40) begin
      cnt <= _cnt_T_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 24:15]
      full <= 1'h0;
    end else begin
      full <= cnt == 7'h40;
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
  tot = _RAND_0[14:0];
  _RAND_1 = {1{`RANDOM}};
  regChain_0 = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  regChain_1 = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  regChain_2 = _RAND_3[7:0];
  _RAND_4 = {1{`RANDOM}};
  regChain_3 = _RAND_4[7:0];
  _RAND_5 = {1{`RANDOM}};
  regChain_4 = _RAND_5[7:0];
  _RAND_6 = {1{`RANDOM}};
  regChain_5 = _RAND_6[7:0];
  _RAND_7 = {1{`RANDOM}};
  regChain_6 = _RAND_7[7:0];
  _RAND_8 = {1{`RANDOM}};
  regChain_7 = _RAND_8[7:0];
  _RAND_9 = {1{`RANDOM}};
  regChain_8 = _RAND_9[7:0];
  _RAND_10 = {1{`RANDOM}};
  regChain_9 = _RAND_10[7:0];
  _RAND_11 = {1{`RANDOM}};
  regChain_10 = _RAND_11[7:0];
  _RAND_12 = {1{`RANDOM}};
  regChain_11 = _RAND_12[7:0];
  _RAND_13 = {1{`RANDOM}};
  regChain_12 = _RAND_13[7:0];
  _RAND_14 = {1{`RANDOM}};
  regChain_13 = _RAND_14[7:0];
  _RAND_15 = {1{`RANDOM}};
  regChain_14 = _RAND_15[7:0];
  _RAND_16 = {1{`RANDOM}};
  regChain_15 = _RAND_16[7:0];
  _RAND_17 = {1{`RANDOM}};
  regChain_16 = _RAND_17[7:0];
  _RAND_18 = {1{`RANDOM}};
  regChain_17 = _RAND_18[7:0];
  _RAND_19 = {1{`RANDOM}};
  regChain_18 = _RAND_19[7:0];
  _RAND_20 = {1{`RANDOM}};
  regChain_19 = _RAND_20[7:0];
  _RAND_21 = {1{`RANDOM}};
  regChain_20 = _RAND_21[7:0];
  _RAND_22 = {1{`RANDOM}};
  regChain_21 = _RAND_22[7:0];
  _RAND_23 = {1{`RANDOM}};
  regChain_22 = _RAND_23[7:0];
  _RAND_24 = {1{`RANDOM}};
  regChain_23 = _RAND_24[7:0];
  _RAND_25 = {1{`RANDOM}};
  regChain_24 = _RAND_25[7:0];
  _RAND_26 = {1{`RANDOM}};
  regChain_25 = _RAND_26[7:0];
  _RAND_27 = {1{`RANDOM}};
  regChain_26 = _RAND_27[7:0];
  _RAND_28 = {1{`RANDOM}};
  regChain_27 = _RAND_28[7:0];
  _RAND_29 = {1{`RANDOM}};
  regChain_28 = _RAND_29[7:0];
  _RAND_30 = {1{`RANDOM}};
  regChain_29 = _RAND_30[7:0];
  _RAND_31 = {1{`RANDOM}};
  regChain_30 = _RAND_31[7:0];
  _RAND_32 = {1{`RANDOM}};
  regChain_31 = _RAND_32[7:0];
  _RAND_33 = {1{`RANDOM}};
  regChain_32 = _RAND_33[7:0];
  _RAND_34 = {1{`RANDOM}};
  regChain_33 = _RAND_34[7:0];
  _RAND_35 = {1{`RANDOM}};
  regChain_34 = _RAND_35[7:0];
  _RAND_36 = {1{`RANDOM}};
  regChain_35 = _RAND_36[7:0];
  _RAND_37 = {1{`RANDOM}};
  regChain_36 = _RAND_37[7:0];
  _RAND_38 = {1{`RANDOM}};
  regChain_37 = _RAND_38[7:0];
  _RAND_39 = {1{`RANDOM}};
  regChain_38 = _RAND_39[7:0];
  _RAND_40 = {1{`RANDOM}};
  regChain_39 = _RAND_40[7:0];
  _RAND_41 = {1{`RANDOM}};
  regChain_40 = _RAND_41[7:0];
  _RAND_42 = {1{`RANDOM}};
  regChain_41 = _RAND_42[7:0];
  _RAND_43 = {1{`RANDOM}};
  regChain_42 = _RAND_43[7:0];
  _RAND_44 = {1{`RANDOM}};
  regChain_43 = _RAND_44[7:0];
  _RAND_45 = {1{`RANDOM}};
  regChain_44 = _RAND_45[7:0];
  _RAND_46 = {1{`RANDOM}};
  regChain_45 = _RAND_46[7:0];
  _RAND_47 = {1{`RANDOM}};
  regChain_46 = _RAND_47[7:0];
  _RAND_48 = {1{`RANDOM}};
  regChain_47 = _RAND_48[7:0];
  _RAND_49 = {1{`RANDOM}};
  regChain_48 = _RAND_49[7:0];
  _RAND_50 = {1{`RANDOM}};
  regChain_49 = _RAND_50[7:0];
  _RAND_51 = {1{`RANDOM}};
  regChain_50 = _RAND_51[7:0];
  _RAND_52 = {1{`RANDOM}};
  regChain_51 = _RAND_52[7:0];
  _RAND_53 = {1{`RANDOM}};
  regChain_52 = _RAND_53[7:0];
  _RAND_54 = {1{`RANDOM}};
  regChain_53 = _RAND_54[7:0];
  _RAND_55 = {1{`RANDOM}};
  regChain_54 = _RAND_55[7:0];
  _RAND_56 = {1{`RANDOM}};
  regChain_55 = _RAND_56[7:0];
  _RAND_57 = {1{`RANDOM}};
  regChain_56 = _RAND_57[7:0];
  _RAND_58 = {1{`RANDOM}};
  regChain_57 = _RAND_58[7:0];
  _RAND_59 = {1{`RANDOM}};
  regChain_58 = _RAND_59[7:0];
  _RAND_60 = {1{`RANDOM}};
  regChain_59 = _RAND_60[7:0];
  _RAND_61 = {1{`RANDOM}};
  regChain_60 = _RAND_61[7:0];
  _RAND_62 = {1{`RANDOM}};
  regChain_61 = _RAND_62[7:0];
  _RAND_63 = {1{`RANDOM}};
  regChain_62 = _RAND_63[7:0];
  _RAND_64 = {1{`RANDOM}};
  regChain_63 = _RAND_64[7:0];
  _RAND_65 = {1{`RANDOM}};
  cnt = _RAND_65[6:0];
  _RAND_66 = {1{`RANDOM}};
  full = _RAND_66[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    tot = 15'h0;
  end
  if (reset) begin
    regChain_0 = 8'h0;
  end
  if (reset) begin
    regChain_1 = 8'h0;
  end
  if (reset) begin
    regChain_2 = 8'h0;
  end
  if (reset) begin
    regChain_3 = 8'h0;
  end
  if (reset) begin
    regChain_4 = 8'h0;
  end
  if (reset) begin
    regChain_5 = 8'h0;
  end
  if (reset) begin
    regChain_6 = 8'h0;
  end
  if (reset) begin
    regChain_7 = 8'h0;
  end
  if (reset) begin
    regChain_8 = 8'h0;
  end
  if (reset) begin
    regChain_9 = 8'h0;
  end
  if (reset) begin
    regChain_10 = 8'h0;
  end
  if (reset) begin
    regChain_11 = 8'h0;
  end
  if (reset) begin
    regChain_12 = 8'h0;
  end
  if (reset) begin
    regChain_13 = 8'h0;
  end
  if (reset) begin
    regChain_14 = 8'h0;
  end
  if (reset) begin
    regChain_15 = 8'h0;
  end
  if (reset) begin
    regChain_16 = 8'h0;
  end
  if (reset) begin
    regChain_17 = 8'h0;
  end
  if (reset) begin
    regChain_18 = 8'h0;
  end
  if (reset) begin
    regChain_19 = 8'h0;
  end
  if (reset) begin
    regChain_20 = 8'h0;
  end
  if (reset) begin
    regChain_21 = 8'h0;
  end
  if (reset) begin
    regChain_22 = 8'h0;
  end
  if (reset) begin
    regChain_23 = 8'h0;
  end
  if (reset) begin
    regChain_24 = 8'h0;
  end
  if (reset) begin
    regChain_25 = 8'h0;
  end
  if (reset) begin
    regChain_26 = 8'h0;
  end
  if (reset) begin
    regChain_27 = 8'h0;
  end
  if (reset) begin
    regChain_28 = 8'h0;
  end
  if (reset) begin
    regChain_29 = 8'h0;
  end
  if (reset) begin
    regChain_30 = 8'h0;
  end
  if (reset) begin
    regChain_31 = 8'h0;
  end
  if (reset) begin
    regChain_32 = 8'h0;
  end
  if (reset) begin
    regChain_33 = 8'h0;
  end
  if (reset) begin
    regChain_34 = 8'h0;
  end
  if (reset) begin
    regChain_35 = 8'h0;
  end
  if (reset) begin
    regChain_36 = 8'h0;
  end
  if (reset) begin
    regChain_37 = 8'h0;
  end
  if (reset) begin
    regChain_38 = 8'h0;
  end
  if (reset) begin
    regChain_39 = 8'h0;
  end
  if (reset) begin
    regChain_40 = 8'h0;
  end
  if (reset) begin
    regChain_41 = 8'h0;
  end
  if (reset) begin
    regChain_42 = 8'h0;
  end
  if (reset) begin
    regChain_43 = 8'h0;
  end
  if (reset) begin
    regChain_44 = 8'h0;
  end
  if (reset) begin
    regChain_45 = 8'h0;
  end
  if (reset) begin
    regChain_46 = 8'h0;
  end
  if (reset) begin
    regChain_47 = 8'h0;
  end
  if (reset) begin
    regChain_48 = 8'h0;
  end
  if (reset) begin
    regChain_49 = 8'h0;
  end
  if (reset) begin
    regChain_50 = 8'h0;
  end
  if (reset) begin
    regChain_51 = 8'h0;
  end
  if (reset) begin
    regChain_52 = 8'h0;
  end
  if (reset) begin
    regChain_53 = 8'h0;
  end
  if (reset) begin
    regChain_54 = 8'h0;
  end
  if (reset) begin
    regChain_55 = 8'h0;
  end
  if (reset) begin
    regChain_56 = 8'h0;
  end
  if (reset) begin
    regChain_57 = 8'h0;
  end
  if (reset) begin
    regChain_58 = 8'h0;
  end
  if (reset) begin
    regChain_59 = 8'h0;
  end
  if (reset) begin
    regChain_60 = 8'h0;
  end
  if (reset) begin
    regChain_61 = 8'h0;
  end
  if (reset) begin
    regChain_62 = 8'h0;
  end
  if (reset) begin
    regChain_63 = 8'h0;
  end
  if (reset) begin
    cnt = 7'h0;
  end
  if (reset) begin
    full = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module TemperatureLookup(
  input         clock,
  input  [7:0]  io_in, // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 16:14]
  output [31:0] io_out // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 16:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] regOut; // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:23]
  wire [31:0] _GEN_8 = 8'h8 == io_in ? $signed(32'sh7c4ab0b2) : $signed(32'sh7f000000); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_9 = 8'h9 == io_in ? $signed(32'sh77a72db3) : $signed(_GEN_8); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_10 = 8'ha == io_in ? $signed(32'sh735d00b1) : $signed(_GEN_9); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_11 = 8'hb == io_in ? $signed(32'sh6f64a366) : $signed(_GEN_10); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_12 = 8'hc == io_in ? $signed(32'sh6bb71d96) : $signed(_GEN_11); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_13 = 8'hd == io_in ? $signed(32'sh684dfc86) : $signed(_GEN_12); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_14 = 8'he == io_in ? $signed(32'sh65234acf) : $signed(_GEN_13); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_15 = 8'hf == io_in ? $signed(32'sh623188a1) : $signed(_GEN_14); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_16 = 8'h10 == io_in ? $signed(32'sh5f73a45e) : $signed(_GEN_15); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_17 = 8'h11 == io_in ? $signed(32'sh5ce4f394) : $signed(_GEN_16); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_18 = 8'h12 == io_in ? $signed(32'sh5a812c53) : $signed(_GEN_17); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_19 = 8'h13 == io_in ? $signed(32'sh58445ed5) : $signed(_GEN_18); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_20 = 8'h14 == io_in ? $signed(32'sh562aef7f) : $signed(_GEN_19); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_21 = 8'h15 == io_in ? $signed(32'sh5431912a) : $signed(_GEN_20); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_22 = 8'h16 == io_in ? $signed(32'sh52553fbb) : $signed(_GEN_21); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_23 = 8'h17 == io_in ? $signed(32'sh50933b0c) : $signed(_GEN_22); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_24 = 8'h18 == io_in ? $signed(32'sh4ee9020f) : $signed(_GEN_23); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_25 = 8'h19 == io_in ? $signed(32'sh4d544e41) : $signed(_GEN_24); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_26 = 8'h1a == io_in ? $signed(32'sh4bd30f53) : $signed(_GEN_25); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_27 = 8'h1b == io_in ? $signed(32'sh4a63671d) : $signed(_GEN_26); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_28 = 8'h1c == io_in ? $signed(32'sh4903a5bf) : $signed(_GEN_27); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_29 = 8'h1d == io_in ? $signed(32'sh47b2460c) : $signed(_GEN_28); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_30 = 8'h1e == io_in ? $signed(32'sh466dea1b) : $signed(_GEN_29); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_31 = 8'h1f == io_in ? $signed(32'sh45355819) : $signed(_GEN_30); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_32 = 8'h20 == io_in ? $signed(32'sh44077746) : $signed(_GEN_31); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_33 = 8'h21 == io_in ? $signed(32'sh42e34d26) : $signed(_GEN_32); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_34 = 8'h22 == io_in ? $signed(32'sh41c7fadd) : $signed(_GEN_33); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_35 = 8'h23 == io_in ? $signed(32'sh40b4bab7) : $signed(_GEN_34); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_36 = 8'h24 == io_in ? $signed(32'sh3fa8dddd) : $signed(_GEN_35); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_37 = 8'h25 == io_in ? $signed(32'sh3ea3ca2b) : $signed(_GEN_36); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_38 = 8'h26 == io_in ? $signed(32'sh3da4f835) : $signed(_GEN_37); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_39 = 8'h27 == io_in ? $signed(32'sh3cabf165) : $signed(_GEN_38); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_40 = 8'h28 == io_in ? $signed(32'sh3bb84e45) : $signed(_GEN_39); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_41 = 8'h29 == io_in ? $signed(32'sh3ac9b4e2) : $signed(_GEN_40); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_42 = 8'h2a == io_in ? $signed(32'sh39dfd753) : $signed(_GEN_41); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_43 = 8'h2b == io_in ? $signed(32'sh38fa725b) : $signed(_GEN_42); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_44 = 8'h2c == io_in ? $signed(32'sh38194c26) : $signed(_GEN_43); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_45 = 8'h2d == io_in ? $signed(32'sh373c3320) : $signed(_GEN_44); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_46 = 8'h2e == io_in ? $signed(32'sh3662fce6) : $signed(_GEN_45); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_47 = 8'h2f == io_in ? $signed(32'sh358d854e) : $signed(_GEN_46); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_48 = 8'h30 == io_in ? $signed(32'sh34bbad85) : $signed(_GEN_47); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_49 = 8'h31 == io_in ? $signed(32'sh33ed5b3f) : $signed(_GEN_48); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_50 = 8'h32 == io_in ? $signed(32'sh33227800) : $signed(_GEN_49); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_51 = 8'h33 == io_in ? $signed(32'sh325af071) : $signed(_GEN_50); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_52 = 8'h34 == io_in ? $signed(32'sh3196b3c9) : $signed(_GEN_51); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_53 = 8'h35 == io_in ? $signed(32'sh30d5b349) : $signed(_GEN_52); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_54 = 8'h36 == io_in ? $signed(32'sh3017e1c0) : $signed(_GEN_53); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_55 = 8'h37 == io_in ? $signed(32'sh2f5d3323) : $signed(_GEN_54); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_56 = 8'h38 == io_in ? $signed(32'sh2ea59c32) : $signed(_GEN_55); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_57 = 8'h39 == io_in ? $signed(32'sh2df11220) : $signed(_GEN_56); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_58 = 8'h3a == io_in ? $signed(32'sh2d3f8a55) : $signed(_GEN_57); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_59 = 8'h3b == io_in ? $signed(32'sh2c90fa2c) : $signed(_GEN_58); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_60 = 8'h3c == io_in ? $signed(32'sh2be556c6) : $signed(_GEN_59); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_61 = 8'h3d == io_in ? $signed(32'sh2b3c94dd) : $signed(_GEN_60); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_62 = 8'h3e == io_in ? $signed(32'sh2a96a8a5) : $signed(_GEN_61); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_63 = 8'h3f == io_in ? $signed(32'sh29f385ae) : $signed(_GEN_62); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_64 = 8'h40 == io_in ? $signed(32'sh29531ed8) : $signed(_GEN_63); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_65 = 8'h41 == io_in ? $signed(32'sh28b5663f) : $signed(_GEN_64); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_66 = 8'h42 == io_in ? $signed(32'sh281a4d35) : $signed(_GEN_65); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_67 = 8'h43 == io_in ? $signed(32'sh2781c441) : $signed(_GEN_66); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_68 = 8'h44 == io_in ? $signed(32'sh26ebbb1f) : $signed(_GEN_67); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_69 = 8'h45 == io_in ? $signed(32'sh265820c5) : $signed(_GEN_68); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_70 = 8'h46 == io_in ? $signed(32'sh25c6e36c) : $signed(_GEN_69); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_71 = 8'h47 == io_in ? $signed(32'sh2537f09d) : $signed(_GEN_70); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_72 = 8'h48 == io_in ? $signed(32'sh24ab353e) : $signed(_GEN_71); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_73 = 8'h49 == io_in ? $signed(32'sh24209da0) : $signed(_GEN_72); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_74 = 8'h4a == io_in ? $signed(32'sh23981595) : $signed(_GEN_73); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_75 = 8'h4b == io_in ? $signed(32'sh23118882) : $signed(_GEN_74); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_76 = 8'h4c == io_in ? $signed(32'sh228ce173) : $signed(_GEN_75); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_77 = 8'h4d == io_in ? $signed(32'sh220a0b30) : $signed(_GEN_76); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_78 = 8'h4e == io_in ? $signed(32'sh2188f056) : $signed(_GEN_77); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_79 = 8'h4f == io_in ? $signed(32'sh21097b68) : $signed(_GEN_78); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_80 = 8'h50 == io_in ? $signed(32'sh208b96e9) : $signed(_GEN_79); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_81 = 8'h51 == io_in ? $signed(32'sh200f2d73) : $signed(_GEN_80); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_82 = 8'h52 == io_in ? $signed(32'sh1f9429c9) : $signed(_GEN_81); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_83 = 8'h53 == io_in ? $signed(32'sh1f1a76ef) : $signed(_GEN_82); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_84 = 8'h54 == io_in ? $signed(32'sh1ea2003c) : $signed(_GEN_83); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_85 = 8'h55 == io_in ? $signed(32'sh1e2ab173) : $signed(_GEN_84); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_86 = 8'h56 == io_in ? $signed(32'sh1db476ce) : $signed(_GEN_85); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_87 = 8'h57 == io_in ? $signed(32'sh1d3f3d16) : $signed(_GEN_86); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_88 = 8'h58 == io_in ? $signed(32'sh1ccaf1b0) : $signed(_GEN_87); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_89 = 8'h59 == io_in ? $signed(32'sh1c5782af) : $signed(_GEN_88); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_90 = 8'h5a == io_in ? $signed(32'sh1be4dee0) : $signed(_GEN_89); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_91 = 8'h5b == io_in ? $signed(32'sh1b72f5d5) : $signed(_GEN_90); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_92 = 8'h5c == io_in ? $signed(32'sh1b01b7f4) : $signed(_GEN_91); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_93 = 8'h5d == io_in ? $signed(32'sh1a91167f) : $signed(_GEN_92); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_94 = 8'h5e == io_in ? $signed(32'sh1a21039b) : $signed(_GEN_93); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_95 = 8'h5f == io_in ? $signed(32'sh19b17259) : $signed(_GEN_94); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_96 = 8'h60 == io_in ? $signed(32'sh194256b9) : $signed(_GEN_95); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_97 = 8'h61 == io_in ? $signed(32'sh18d3a5b1) : $signed(_GEN_96); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_98 = 8'h62 == io_in ? $signed(32'sh1865552a) : $signed(_GEN_97); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_99 = 8'h63 == io_in ? $signed(32'sh17f75c08) : $signed(_GEN_98); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_100 = 8'h64 == io_in ? $signed(32'sh1789b225) : $signed(_GEN_99); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_101 = 8'h65 == io_in ? $signed(32'sh171c504e) : $signed(_GEN_100); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_102 = 8'h66 == io_in ? $signed(32'sh16af3045) : $signed(_GEN_101); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_103 = 8'h67 == io_in ? $signed(32'sh16424cb9) : $signed(_GEN_102); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_104 = 8'h68 == io_in ? $signed(32'sh15d5a13e) : $signed(_GEN_103); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_105 = 8'h69 == io_in ? $signed(32'sh15692a4d) : $signed(_GEN_104); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_106 = 8'h6a == io_in ? $signed(32'sh14fce538) : $signed(_GEN_105); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_107 = 8'h6b == io_in ? $signed(32'sh1490d01f) : $signed(_GEN_106); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_108 = 8'h6c == io_in ? $signed(32'sh1424e9eb) : $signed(_GEN_107); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_109 = 8'h6d == io_in ? $signed(32'sh13b93241) : $signed(_GEN_108); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_110 = 8'h6e == io_in ? $signed(32'sh134da975) : $signed(_GEN_109); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_111 = 8'h6f == io_in ? $signed(32'sh12e25080) : $signed(_GEN_110); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_112 = 8'h70 == io_in ? $signed(32'sh127728f4) : $signed(_GEN_111); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_113 = 8'h71 == io_in ? $signed(32'sh120c34e9) : $signed(_GEN_112); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_114 = 8'h72 == io_in ? $signed(32'sh11a176f7) : $signed(_GEN_113); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_115 = 8'h73 == io_in ? $signed(32'sh1136f222) : $signed(_GEN_114); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_116 = 8'h74 == io_in ? $signed(32'sh10cca9cd) : $signed(_GEN_115); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_117 = 8'h75 == io_in ? $signed(32'sh1062a1aa) : $signed(_GEN_116); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_118 = 8'h76 == io_in ? $signed(32'shff8ddaf) : $signed(_GEN_117); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_119 = 8'h77 == io_in ? $signed(32'shf8f6200) : $signed(_GEN_118); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_120 = 8'h78 == io_in ? $signed(32'shf2632e8) : $signed(_GEN_119); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_121 = 8'h79 == io_in ? $signed(32'shebd54c4) : $signed(_GEN_120); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_122 = 8'h7a == io_in ? $signed(32'she54cbf4) : $signed(_GEN_121); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_123 = 8'h7b == io_in ? $signed(32'shdec9cd1) : $signed(_GEN_122); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_124 = 8'h7c == io_in ? $signed(32'shd84cb9b) : $signed(_GEN_123); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_125 = 8'h7d == io_in ? $signed(32'shd1d5c6d) : $signed(_GEN_124); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_126 = 8'h7e == io_in ? $signed(32'shcb6532e) : $signed(_GEN_125); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_127 = 8'h7f == io_in ? $signed(32'shc4fb385) : $signed(_GEN_126); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_128 = 8'h80 == io_in ? $signed(32'shbe980cb) : $signed(_GEN_127); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_129 = 8'h81 == io_in ? $signed(32'shb83be03) : $signed(_GEN_128); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_130 = 8'h82 == io_in ? $signed(32'shb1e6dca) : $signed(_GEN_129); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_131 = 8'h83 == io_in ? $signed(32'shab99252) : $signed(_GEN_130); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_132 = 8'h84 == io_in ? $signed(32'sha552d53) : $signed(_GEN_131); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_133 = 8'h85 == io_in ? $signed(32'sh9f14007) : $signed(_GEN_132); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_134 = 8'h86 == io_in ? $signed(32'sh98dcb1f) : $signed(_GEN_133); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_135 = 8'h87 == io_in ? $signed(32'sh92acebe) : $signed(_GEN_134); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_136 = 8'h88 == io_in ? $signed(32'sh8c84a73) : $signed(_GEN_135); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_137 = 8'h89 == io_in ? $signed(32'sh8663d31) : $signed(_GEN_136); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_138 = 8'h8a == io_in ? $signed(32'sh804a550) : $signed(_GEN_137); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_139 = 8'h8b == io_in ? $signed(32'sh7a38086) : $signed(_GEN_138); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_140 = 8'h8c == io_in ? $signed(32'sh742cbe5) : $signed(_GEN_139); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_141 = 8'h8d == io_in ? $signed(32'sh6e283df) : $signed(_GEN_140); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_142 = 8'h8e == io_in ? $signed(32'sh682a43f) : $signed(_GEN_141); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_143 = 8'h8f == io_in ? $signed(32'sh623282e) : $signed(_GEN_142); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_144 = 8'h90 == io_in ? $signed(32'sh5c40a36) : $signed(_GEN_143); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_145 = 8'h91 == io_in ? $signed(32'sh5654443) : $signed(_GEN_144); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_146 = 8'h92 == io_in ? $signed(32'sh506cfa7) : $signed(_GEN_145); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_147 = 8'h93 == io_in ? $signed(32'sh4a8a521) : $signed(_GEN_146); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_148 = 8'h94 == io_in ? $signed(32'sh44abce0) : $signed(_GEN_147); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_149 = 8'h95 == io_in ? $signed(32'sh3ed0e8d) : $signed(_GEN_148); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_150 = 8'h96 == io_in ? $signed(32'sh38f9151) : $signed(_GEN_149); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_151 = 8'h97 == io_in ? $signed(32'sh3323be0) : $signed(_GEN_150); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_152 = 8'h98 == io_in ? $signed(32'sh2d5047d) : $signed(_GEN_151); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_153 = 8'h99 == io_in ? $signed(32'sh277e10a) : $signed(_GEN_152); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_154 = 8'h9a == io_in ? $signed(32'sh21ac70f) : $signed(_GEN_153); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_155 = 8'h9b == io_in ? $signed(32'sh1bdabca) : $signed(_GEN_154); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_156 = 8'h9c == io_in ? $signed(32'sh1608433) : $signed(_GEN_155); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_157 = 8'h9d == io_in ? $signed(32'sh1034513) : $signed(_GEN_156); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_158 = 8'h9e == io_in ? $signed(32'sha5e308) : $signed(_GEN_157); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_159 = 8'h9f == io_in ? $signed(32'sh485296) : $signed(_GEN_158); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_160 = 8'ha0 == io_in ? $signed(-32'sh1577cb) : $signed(_GEN_159); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_161 = 8'ha1 == io_in ? $signed(-32'sh7387a0) : $signed(_GEN_160); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_162 = 8'ha2 == io_in ? $signed(-32'shd1e862) : $signed(_GEN_161); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_163 = 8'ha3 == io_in ? $signed(-32'sh130a56a) : $signed(_GEN_162); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_164 = 8'ha4 == io_in ? $signed(-32'sh18fc9e8) : $signed(_GEN_163); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_165 = 8'ha5 == io_in ? $signed(-32'sh1ef60d2) : $signed(_GEN_164); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_166 = 8'ha6 == io_in ? $signed(-32'sh24f74d8) : $signed(_GEN_165); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_167 = 8'ha7 == io_in ? $signed(-32'sh2b01055) : $signed(_GEN_166); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_168 = 8'ha8 == io_in ? $signed(-32'sh3113d45) : $signed(_GEN_167); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_169 = 8'ha9 == io_in ? $signed(-32'sh3730539) : $signed(_GEN_168); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_170 = 8'haa == io_in ? $signed(-32'sh3d57146) : $signed(_GEN_169); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_171 = 8'hab == io_in ? $signed(-32'sh4388a00) : $signed(_GEN_170); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_172 = 8'hac == io_in ? $signed(-32'sh49c576f) : $signed(_GEN_171); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_173 = 8'had == io_in ? $signed(-32'sh500e103) : $signed(_GEN_172); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_174 = 8'hae == io_in ? $signed(-32'sh5662d8e) : $signed(_GEN_173); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_175 = 8'haf == io_in ? $signed(-32'sh5cc433c) : $signed(_GEN_174); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_176 = 8'hb0 == io_in ? $signed(-32'sh6332790) : $signed(_GEN_175); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_177 = 8'hb1 == io_in ? $signed(-32'sh69adf5c) : $signed(_GEN_176); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_178 = 8'hb2 == io_in ? $signed(-32'sh7036ec0) : $signed(_GEN_177); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_179 = 8'hb3 == io_in ? $signed(-32'sh76cd929) : $signed(_GEN_178); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_180 = 8'hb4 == io_in ? $signed(-32'sh7d7214f) : $signed(_GEN_179); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_181 = 8'hb5 == io_in ? $signed(-32'sh8424939) : $signed(_GEN_180); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_182 = 8'hb6 == io_in ? $signed(-32'sh8ae523f) : $signed(_GEN_181); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_183 = 8'hb7 == io_in ? $signed(-32'sh91b3d14) : $signed(_GEN_182); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_184 = 8'hb8 == io_in ? $signed(-32'sh98909c4) : $signed(_GEN_183); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_185 = 8'hb9 == io_in ? $signed(-32'sh9f7b7c9) : $signed(_GEN_184); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_186 = 8'hba == io_in ? $signed(-32'sha67460c) : $signed(_GEN_185); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_187 = 8'hbb == io_in ? $signed(-32'shad7b2fc) : $signed(_GEN_186); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_188 = 8'hbc == io_in ? $signed(-32'shb48fc98) : $signed(_GEN_187); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_189 = 8'hbd == io_in ? $signed(-32'shbbb2080) : $signed(_GEN_188); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_190 = 8'hbe == io_in ? $signed(-32'shc2e1c11) : $signed(_GEN_189); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_191 = 8'hbf == io_in ? $signed(-32'shca1ec72) : $signed(_GEN_190); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_192 = 8'hc0 == io_in ? $signed(-32'shd168eb7) : $signed(_GEN_191); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_193 = 8'hc1 == io_in ? $signed(-32'shd8bfff4) : $signed(_GEN_192); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_194 = 8'hc2 == io_in ? $signed(-32'she023d5f) : $signed(_GEN_193); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_195 = 8'hc3 == io_in ? $signed(-32'she794470) : $signed(_GEN_194); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_196 = 8'hc4 == io_in ? $signed(-32'shef11304) : $signed(_GEN_195); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_197 = 8'hc5 == io_in ? $signed(-32'shf69a780) : $signed(_GEN_196); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_198 = 8'hc6 == io_in ? $signed(-32'shfe300f9) : $signed(_GEN_197); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_199 = 8'hc7 == io_in ? $signed(-32'sh105d1f60) : $signed(_GEN_198); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_200 = 8'hc8 == io_in ? $signed(-32'sh10d803a8) : $signed(_GEN_199); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_201 = 8'hc9 == io_in ? $signed(-32'sh1153aff9) : $signed(_GEN_200); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_202 = 8'hca == io_in ? $signed(-32'sh11d027de) : $signed(_GEN_201); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_203 = 8'hcb == io_in ? $signed(-32'sh124d7075) : $signed(_GEN_202); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_204 = 8'hcc == io_in ? $signed(-32'sh12cb90a4) : $signed(_GEN_203); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_205 = 8'hcd == io_in ? $signed(-32'sh134a914f) : $signed(_GEN_204); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_206 = 8'hce == io_in ? $signed(-32'sh13ca7d8b) : $signed(_GEN_205); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_207 = 8'hcf == io_in ? $signed(-32'sh144b62da) : $signed(_GEN_206); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_208 = 8'hd0 == io_in ? $signed(-32'sh14cd5160) : $signed(_GEN_207); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_209 = 8'hd1 == io_in ? $signed(-32'sh15505c20) : $signed(_GEN_208); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_210 = 8'hd2 == io_in ? $signed(-32'sh15d49933) : $signed(_GEN_209); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_211 = 8'hd3 == io_in ? $signed(-32'sh165a2208) : $signed(_GEN_210); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_212 = 8'hd4 == io_in ? $signed(-32'sh16e11397) : $signed(_GEN_211); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_213 = 8'hd5 == io_in ? $signed(-32'sh17698ea6) : $signed(_GEN_212); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_214 = 8'hd6 == io_in ? $signed(-32'sh17f3b7f8) : $signed(_GEN_213); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_215 = 8'hd7 == io_in ? $signed(-32'sh187fb891) : $signed(_GEN_214); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_216 = 8'hd8 == io_in ? $signed(-32'sh190dbde6) : $signed(_GEN_215); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_217 = 8'hd9 == io_in ? $signed(-32'sh199dfa17) : $signed(_GEN_216); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_218 = 8'hda == io_in ? $signed(-32'sh1a30a424) : $signed(_GEN_217); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_219 = 8'hdb == io_in ? $signed(-32'sh1ac5f81e) : $signed(_GEN_218); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_220 = 8'hdc == io_in ? $signed(-32'sh1b5e3755) : $signed(_GEN_219); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_221 = 8'hdd == io_in ? $signed(-32'sh1bf9a885) : $signed(_GEN_220); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_222 = 8'hde == io_in ? $signed(-32'sh1c9897fd) : $signed(_GEN_221); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_223 = 8'hdf == io_in ? $signed(-32'sh1d3b57bf) : $signed(_GEN_222); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_224 = 8'he0 == io_in ? $signed(-32'sh1de23fa2) : $signed(_GEN_223); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_225 = 8'he1 == io_in ? $signed(-32'sh1e8dad66) : $signed(_GEN_224); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_226 = 8'he2 == io_in ? $signed(-32'sh1f3e04c8) : $signed(_GEN_225); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_227 = 8'he3 == io_in ? $signed(-32'sh1ff3af86) : $signed(_GEN_226); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_228 = 8'he4 == io_in ? $signed(-32'sh20af1d69) : $signed(_GEN_227); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_229 = 8'he5 == io_in ? $signed(-32'sh2170c436) : $signed(_GEN_228); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_230 = 8'he6 == io_in ? $signed(-32'sh22391fa0) : $signed(_GEN_229); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_231 = 8'he7 == io_in ? $signed(-32'sh2308b12f) : $signed(_GEN_230); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_232 = 8'he8 == io_in ? $signed(-32'sh23e00015) : $signed(_GEN_231); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_233 = 8'he9 == io_in ? $signed(-32'sh24bf9900) : $signed(_GEN_232); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_234 = 8'hea == io_in ? $signed(-32'sh25a80dd2) : $signed(_GEN_233); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_235 = 8'heb == io_in ? $signed(-32'sh2699f559) : $signed(_GEN_234); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_236 = 8'hec == io_in ? $signed(-32'sh2795eaef) : $signed(_GEN_235); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_237 = 8'hed == io_in ? $signed(-32'sh289c8e06) : $signed(_GEN_236); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_238 = 8'hee == io_in ? $signed(-32'sh29ae81b0) : $signed(_GEN_237); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_239 = 8'hef == io_in ? $signed(-32'sh2acc6c03) : $signed(_GEN_238); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_240 = 8'hf0 == io_in ? $signed(-32'sh2bf6f575) : $signed(_GEN_239); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_241 = 8'hf1 == io_in ? $signed(-32'sh2d2ec81e) : $signed(_GEN_240); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_242 = 8'hf2 == io_in ? $signed(-32'sh2e748ee3) : $signed(_GEN_241); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_243 = 8'hf3 == io_in ? $signed(-32'sh2fc8f489) : $signed(_GEN_242); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_244 = 8'hf4 == io_in ? $signed(-32'sh312ca2b0) : $signed(_GEN_243); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_245 = 8'hf5 == io_in ? $signed(-32'sh32a040ac) : $signed(_GEN_244); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_246 = 8'hf6 == io_in ? $signed(-32'sh3424724c) : $signed(_GEN_245); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_247 = 8'hf7 == io_in ? $signed(-32'sh35b9d679) : $signed(_GEN_246); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_248 = 8'hf8 == io_in ? $signed(-32'sh376105b7) : $signed(_GEN_247); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_249 = 8'hf9 == io_in ? $signed(-32'sh391a9086) : $signed(_GEN_248); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_250 = 8'hfa == io_in ? $signed(-32'sh3ae6fd9f) : $signed(_GEN_249); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  wire [31:0] _GEN_251 = 8'hfb == io_in ? $signed(-32'sh3cc6c80a) : $signed(_GEN_250); // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:{23,23}]
  assign io_out = regOut; // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 30:10]
  always @(posedge clock) begin
    if (8'hff == io_in) begin // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:23]
      regOut <= -32'sh450f2197; // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:23]
    end else if (8'hfe == io_in) begin // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:23]
      regOut <= -32'sh42de496f; // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:23]
    end else if (8'hfd == io_in) begin // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:23]
      regOut <= -32'sh40c219e0; // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:23]
    end else if (8'hfc == io_in) begin // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:23]
      regOut <= -32'sh3eba5d09; // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 28:23]
    end else begin
      regOut <= _GEN_251;
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
  regOut = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
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
module Display(
  input         clock,
  input         reset,
  input  [31:0] io_currentTemp, // @[\\src\\main\\scala\\controller\\Display.scala 22:14]
  input  [31:0] io_targetTemp, // @[\\src\\main\\scala\\controller\\Display.scala 22:14]
  input         io_enable, // @[\\src\\main\\scala\\controller\\Display.scala 22:14]
  output [1:0]  io_anode, // @[\\src\\main\\scala\\controller\\Display.scala 22:14]
  output [6:0]  io_asciiOut // @[\\src\\main\\scala\\controller\\Display.scala 22:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  wire [15:0] Clamp_io_in; // @[\\src\\main\\scala\\controller\\Display.scala 42:21]
  wire [15:0] Clamp_io_clampedValue; // @[\\src\\main\\scala\\controller\\Display.scala 42:21]
  wire  Clamp_io_isClamped; // @[\\src\\main\\scala\\controller\\Display.scala 42:21]
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
  wire [6:0] _GEN_7 = _T_8 ? 7'h45 : 7'h20; // @[\\src\\main\\scala\\controller\\Display.scala 45:20 55:19 41:32]
  wire [6:0] _GEN_8 = _T_5 ? 7'h54 : _GEN_7; // @[\\src\\main\\scala\\controller\\Display.scala 45:20 51:19]
  wire [31:0] _GEN_9 = _T_5 ? $signed({{24{targetTemp[7]}},targetTemp}) : $signed(32'sh0); // @[\\src\\main\\scala\\controller\\Display.scala 45:20 52:15 43:28]
  wire [6:0] leadingChar = _T_2 ? 7'h43 : _GEN_8; // @[\\src\\main\\scala\\controller\\Display.scala 45:20 47:19]
  wire [31:0] clampIn = _T_2 ? $signed({{24{currentTemp[7]}},currentTemp}) : $signed(_GEN_9); // @[\\src\\main\\scala\\controller\\Display.scala 45:20 48:15]
  wire  _curMessage_1_T = ~showTemp; // @[\\src\\main\\scala\\controller\\Display.scala 65:26]
  wire  _curMessage_1_T_1 = ~showTemp & Clamp_io_isClamped; // @[\\src\\main\\scala\\controller\\Display.scala 65:36]
  wire [15:0] _curMessage_1_T_2 = Clamp_io_clampedValue / 4'ha; // @[\\src\\main\\scala\\controller\\Display.scala 65:76]
  wire [15:0] _curMessage_1_T_3 = ~showTemp & Clamp_io_isClamped ? 16'h20 : _curMessage_1_T_2; // @[\\src\\main\\scala\\controller\\Display.scala 65:25]
  wire [15:0] _GEN_0 = Clamp_io_clampedValue % 16'ha; // @[\\src\\main\\scala\\controller\\Display.scala 66:76]
  wire [5:0] _curMessage_0_T_3 = _curMessage_1_T_1 ? 6'h20 : {{2'd0}, _GEN_0[3:0]}; // @[\\src\\main\\scala\\controller\\Display.scala 66:25]
  wire [6:0] _GEN_12 = io_enable ? 7'h59 : 7'h4e; // @[\\src\\main\\scala\\controller\\Display.scala 68:22 69:21 72:21]
  wire [6:0] _GEN_13 = io_enable ? 7'h45 : 7'h4f; // @[\\src\\main\\scala\\controller\\Display.scala 68:22 70:21 73:21]
  wire [15:0] _GEN_14 = curMode == 2'h0 | curMode == 2'h1 ? _curMessage_1_T_3 : {{9'd0}, _GEN_12}; // @[\\src\\main\\scala\\controller\\Display.scala 64:78 65:19]
  wire [6:0] curMessage_0 = curMode == 2'h0 | curMode == 2'h1 ? {{1'd0}, _curMessage_0_T_3} : _GEN_13; // @[\\src\\main\\scala\\controller\\Display.scala 64:78 66:19]
  reg [1:0] anodeCnt; // @[\\src\\main\\scala\\controller\\Display.scala 77:25]
  reg [17:0] multiplexCnt; // @[\\src\\main\\scala\\controller\\Display.scala 78:29]
  reg [26:0] blinkCnt; // @[\\src\\main\\scala\\controller\\Display.scala 79:25]
  wire [1:0] _anodeCnt_T_1 = anodeCnt + 2'h1; // @[\\src\\main\\scala\\controller\\Display.scala 92:30]
  wire [17:0] _multiplexCnt_T_1 = multiplexCnt + 18'h1; // @[\\src\\main\\scala\\controller\\Display.scala 95:36]
  wire [26:0] _blinkCnt_T_1 = blinkCnt + 27'h1; // @[\\src\\main\\scala\\controller\\Display.scala 102:28]
  wire  _GEN_20 = blinkCnt == 27'h2faf07f ? _curMessage_1_T : showTemp; // @[\\src\\main\\scala\\controller\\Display.scala 100:16 37:25 98:43]
  wire [6:0] curMessage_1 = _GEN_14[6:0]; // @[\\src\\main\\scala\\controller\\Display.scala 40:24]
  wire [6:0] _GEN_26 = 2'h1 == anodeCnt ? curMessage_1 : curMessage_0; // @[\\src\\main\\scala\\controller\\Display.scala 107:{15,15}]
  wire [6:0] _GEN_27 = 2'h2 == anodeCnt ? 7'h3d : _GEN_26; // @[\\src\\main\\scala\\controller\\Display.scala 107:{15,15}]
  Clamp Clamp ( // @[\\src\\main\\scala\\controller\\Display.scala 42:21]
    .io_in(Clamp_io_in),
    .io_clampedValue(Clamp_io_clampedValue),
    .io_isClamped(Clamp_io_isClamped)
  );
  assign io_anode = anodeCnt; // @[\\src\\main\\scala\\controller\\Display.scala 106:12]
  assign io_asciiOut = 2'h3 == anodeCnt ? leadingChar : _GEN_27; // @[\\src\\main\\scala\\controller\\Display.scala 107:{15,15}]
  assign Clamp_io_in = clampIn[15:0]; // @[\\src\\main\\scala\\controller\\Display.scala 59:15]
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
    if (reset) begin // @[\\src\\main\\scala\\controller\\Display.scala 81:22]
      showTemp <= 1'h1; // @[\\src\\main\\scala\\controller\\Display.scala 85:14]
    end else begin
      showTemp <= wrap_wrap | _GEN_20;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Display.scala 81:22]
      anodeCnt <= 2'h0; // @[\\src\\main\\scala\\controller\\Display.scala 83:14]
    end else if (wrap_wrap) begin // @[\\src\\main\\scala\\controller\\Display.scala 87:51]
      anodeCnt <= 2'h0; // @[\\src\\main\\scala\\controller\\Display.scala 89:31 90:18 92:18]
    end else if (multiplexCnt == 18'h1869f) begin // @[\\src\\main\\scala\\controller\\Display.scala 77:25]
      if (anodeCnt == 2'h3) begin
        anodeCnt <= 2'h0;
      end else begin
        anodeCnt <= _anodeCnt_T_1;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Display.scala 81:22]
      multiplexCnt <= 18'h0; // @[\\src\\main\\scala\\controller\\Display.scala 82:18]
    end else if (wrap_wrap) begin // @[\\src\\main\\scala\\controller\\Display.scala 87:51]
      multiplexCnt <= 18'h0; // @[\\src\\main\\scala\\controller\\Display.scala 88:20]
    end else if (multiplexCnt == 18'h1869f) begin // @[\\src\\main\\scala\\controller\\Display.scala 95:20]
      multiplexCnt <= 18'h0;
    end else begin
      multiplexCnt <= _multiplexCnt_T_1;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Display.scala 81:22]
      blinkCnt <= 27'h0; // @[\\src\\main\\scala\\controller\\Display.scala 84:14]
    end else if (wrap_wrap) begin // @[\\src\\main\\scala\\controller\\Display.scala 98:43]
      blinkCnt <= 27'h0; // @[\\src\\main\\scala\\controller\\Display.scala 99:16]
    end else if (blinkCnt == 27'h2faf07f) begin // @[\\src\\main\\scala\\controller\\Display.scala 102:16]
      blinkCnt <= 27'h0;
    end else begin
      blinkCnt <= _blinkCnt_T_1;
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
  anodeCnt = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  multiplexCnt = _RAND_4[17:0];
  _RAND_5 = {1{`RANDOM}};
  blinkCnt = _RAND_5[26:0];
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
    anodeCnt = 2'h0;
  end
  if (reset) begin
    multiplexCnt = 18'h0;
  end
  if (reset) begin
    blinkCnt = 27'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module SSegDecoder(
  input  [6:0] io_in, // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:14]
  output [6:0] io_out // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:14]
);
  wire [6:0] _GEN_1 = 7'h1 == io_in ? 7'h6 : 7'h3f; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_2 = 7'h2 == io_in ? 7'h5b : _GEN_1; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_3 = 7'h3 == io_in ? 7'h4f : _GEN_2; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_4 = 7'h4 == io_in ? 7'h66 : _GEN_3; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_5 = 7'h5 == io_in ? 7'h6d : _GEN_4; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_6 = 7'h6 == io_in ? 7'h7d : _GEN_5; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_7 = 7'h7 == io_in ? 7'h7 : _GEN_6; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_8 = 7'h8 == io_in ? 7'h7f : _GEN_7; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_9 = 7'h9 == io_in ? 7'h6f : _GEN_8; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_10 = 7'ha == io_in ? 7'h0 : _GEN_9; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_11 = 7'hb == io_in ? 7'h0 : _GEN_10; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_12 = 7'hc == io_in ? 7'h0 : _GEN_11; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_13 = 7'hd == io_in ? 7'h0 : _GEN_12; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_14 = 7'he == io_in ? 7'h0 : _GEN_13; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_15 = 7'hf == io_in ? 7'h0 : _GEN_14; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_16 = 7'h10 == io_in ? 7'h0 : _GEN_15; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_17 = 7'h11 == io_in ? 7'h0 : _GEN_16; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_18 = 7'h12 == io_in ? 7'h0 : _GEN_17; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_19 = 7'h13 == io_in ? 7'h0 : _GEN_18; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_20 = 7'h14 == io_in ? 7'h0 : _GEN_19; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_21 = 7'h15 == io_in ? 7'h0 : _GEN_20; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_22 = 7'h16 == io_in ? 7'h0 : _GEN_21; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_23 = 7'h17 == io_in ? 7'h0 : _GEN_22; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_24 = 7'h18 == io_in ? 7'h0 : _GEN_23; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_25 = 7'h19 == io_in ? 7'h0 : _GEN_24; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_26 = 7'h1a == io_in ? 7'h0 : _GEN_25; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_27 = 7'h1b == io_in ? 7'h0 : _GEN_26; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_28 = 7'h1c == io_in ? 7'h0 : _GEN_27; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_29 = 7'h1d == io_in ? 7'h0 : _GEN_28; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_30 = 7'h1e == io_in ? 7'h0 : _GEN_29; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_31 = 7'h1f == io_in ? 7'h0 : _GEN_30; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_32 = 7'h20 == io_in ? 7'h0 : _GEN_31; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_33 = 7'h21 == io_in ? 7'h0 : _GEN_32; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_34 = 7'h22 == io_in ? 7'h0 : _GEN_33; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_35 = 7'h23 == io_in ? 7'h0 : _GEN_34; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_36 = 7'h24 == io_in ? 7'h0 : _GEN_35; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_37 = 7'h25 == io_in ? 7'h0 : _GEN_36; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_38 = 7'h26 == io_in ? 7'h0 : _GEN_37; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_39 = 7'h27 == io_in ? 7'h0 : _GEN_38; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_40 = 7'h28 == io_in ? 7'h0 : _GEN_39; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_41 = 7'h29 == io_in ? 7'h0 : _GEN_40; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_42 = 7'h2a == io_in ? 7'h0 : _GEN_41; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_43 = 7'h2b == io_in ? 7'h0 : _GEN_42; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_44 = 7'h2c == io_in ? 7'h0 : _GEN_43; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_45 = 7'h2d == io_in ? 7'h0 : _GEN_44; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_46 = 7'h2e == io_in ? 7'h0 : _GEN_45; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_47 = 7'h2f == io_in ? 7'h0 : _GEN_46; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_48 = 7'h30 == io_in ? 7'h3f : _GEN_47; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_49 = 7'h31 == io_in ? 7'h6 : _GEN_48; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_50 = 7'h32 == io_in ? 7'h5b : _GEN_49; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_51 = 7'h33 == io_in ? 7'h4f : _GEN_50; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_52 = 7'h34 == io_in ? 7'h66 : _GEN_51; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_53 = 7'h35 == io_in ? 7'h6d : _GEN_52; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_54 = 7'h36 == io_in ? 7'h7d : _GEN_53; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_55 = 7'h37 == io_in ? 7'h7 : _GEN_54; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_56 = 7'h38 == io_in ? 7'h7f : _GEN_55; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_57 = 7'h39 == io_in ? 7'h6f : _GEN_56; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_58 = 7'h3a == io_in ? 7'h0 : _GEN_57; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_59 = 7'h3b == io_in ? 7'h0 : _GEN_58; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_60 = 7'h3c == io_in ? 7'h0 : _GEN_59; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_61 = 7'h3d == io_in ? 7'h48 : _GEN_60; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_62 = 7'h3e == io_in ? 7'h0 : _GEN_61; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_63 = 7'h3f == io_in ? 7'h0 : _GEN_62; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_64 = 7'h40 == io_in ? 7'h77 : _GEN_63; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_65 = 7'h41 == io_in ? 7'h7c : _GEN_64; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_66 = 7'h42 == io_in ? 7'h39 : _GEN_65; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_67 = 7'h43 == io_in ? 7'h5e : _GEN_66; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_68 = 7'h44 == io_in ? 7'h79 : _GEN_67; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_69 = 7'h45 == io_in ? 7'h71 : _GEN_68; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_70 = 7'h46 == io_in ? 7'h3d : _GEN_69; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_71 = 7'h47 == io_in ? 7'h76 : _GEN_70; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_72 = 7'h48 == io_in ? 7'h6 : _GEN_71; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_73 = 7'h49 == io_in ? 7'he : _GEN_72; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_74 = 7'h4a == io_in ? 7'h75 : _GEN_73; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_75 = 7'h4b == io_in ? 7'h38 : _GEN_74; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_76 = 7'h4c == io_in ? 7'h0 : _GEN_75; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_77 = 7'h4d == io_in ? 7'h57 : _GEN_76; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_78 = 7'h4e == io_in ? 7'h3f : _GEN_77; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_79 = 7'h4f == io_in ? 7'h73 : _GEN_78; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_80 = 7'h50 == io_in ? 7'h67 : _GEN_79; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_81 = 7'h51 == io_in ? 7'h50 : _GEN_80; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_82 = 7'h52 == io_in ? 7'h6d : _GEN_81; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_83 = 7'h53 == io_in ? 7'h70 : _GEN_82; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_84 = 7'h54 == io_in ? 7'h3e : _GEN_83; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_85 = 7'h55 == io_in ? 7'h1c : _GEN_84; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_86 = 7'h56 == io_in ? 7'h3e : _GEN_85; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_87 = 7'h57 == io_in ? 7'h76 : _GEN_86; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_88 = 7'h58 == io_in ? 7'h6e : _GEN_87; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_89 = 7'h59 == io_in ? 7'h5b : _GEN_88; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_90 = 7'h5a == io_in ? 7'h0 : _GEN_89; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_91 = 7'h5b == io_in ? 7'h0 : _GEN_90; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_92 = 7'h5c == io_in ? 7'h0 : _GEN_91; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_93 = 7'h5d == io_in ? 7'h0 : _GEN_92; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_94 = 7'h5e == io_in ? 7'h0 : _GEN_93; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_95 = 7'h5f == io_in ? 7'h0 : _GEN_94; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_96 = 7'h60 == io_in ? 7'h5f : _GEN_95; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_97 = 7'h61 == io_in ? 7'h7c : _GEN_96; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_98 = 7'h62 == io_in ? 7'h58 : _GEN_97; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_99 = 7'h63 == io_in ? 7'h5e : _GEN_98; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_100 = 7'h64 == io_in ? 7'h7b : _GEN_99; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_101 = 7'h65 == io_in ? 7'h71 : _GEN_100; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_102 = 7'h66 == io_in ? 7'h6f : _GEN_101; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_103 = 7'h67 == io_in ? 7'h74 : _GEN_102; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_104 = 7'h68 == io_in ? 7'h4 : _GEN_103; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_105 = 7'h69 == io_in ? 7'hc : _GEN_104; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_106 = 7'h6a == io_in ? 7'h75 : _GEN_105; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_107 = 7'h6b == io_in ? 7'h18 : _GEN_106; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_108 = 7'h6c == io_in ? 7'h57 : _GEN_107; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_109 = 7'h6d == io_in ? 7'h54 : _GEN_108; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_110 = 7'h6e == io_in ? 7'h5c : _GEN_109; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_111 = 7'h6f == io_in ? 7'h73 : _GEN_110; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_112 = 7'h70 == io_in ? 7'h67 : _GEN_111; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_113 = 7'h71 == io_in ? 7'h50 : _GEN_112; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_114 = 7'h72 == io_in ? 7'h6d : _GEN_113; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_115 = 7'h73 == io_in ? 7'h70 : _GEN_114; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_116 = 7'h74 == io_in ? 7'h1c : _GEN_115; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_117 = 7'h75 == io_in ? 7'h1c : _GEN_116; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_118 = 7'h76 == io_in ? 7'h76 : _GEN_117; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_119 = 7'h77 == io_in ? 7'h6e : _GEN_118; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  wire [6:0] _GEN_120 = 7'h78 == io_in ? 7'h5b : _GEN_119; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
  assign io_out = 7'h79 == io_in ? 7'h6 : _GEN_120; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:{10,10}]
endmodule
module SAccumulator(
  input         clock,
  input         reset,
  input  [31:0] io_in, // @[\\src\\main\\scala\\controller\\SAccumulator.scala 16:14]
  input         io_update, // @[\\src\\main\\scala\\controller\\SAccumulator.scala 16:14]
  output [38:0] io_out // @[\\src\\main\\scala\\controller\\SAccumulator.scala 16:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
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
  reg [38:0] tot; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:20]
  reg [31:0] regChain_0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_1; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_2; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_3; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_4; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_5; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_6; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_7; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_8; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_9; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_10; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_11; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_12; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_13; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_14; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_15; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_16; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_17; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_18; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_19; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_20; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_21; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_22; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_23; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_24; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_25; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_26; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_27; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_28; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_29; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_30; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_31; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_32; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_33; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_34; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_35; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_36; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_37; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_38; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_39; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_40; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_41; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_42; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_43; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_44; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_45; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_46; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_47; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_48; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_49; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_50; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_51; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_52; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_53; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_54; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_55; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_56; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_57; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_58; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_59; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_60; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_61; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_62; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  reg [31:0] regChain_63; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
  wire [31:0] _diff_T_2 = $signed(io_in) - $signed(regChain_63); // @[\\src\\main\\scala\\controller\\SAccumulator.scala 41:19]
  wire [32:0] diff = {{1{_diff_T_2[31]}},_diff_T_2}; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 40:20 41:10]
  wire [38:0] _GEN_131 = {{6{diff[32]}},diff}; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 43:16]
  wire [38:0] _tot_T_2 = $signed(tot) + $signed(_GEN_131); // @[\\src\\main\\scala\\controller\\SAccumulator.scala 43:16]
  assign io_out = tot; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 46:10]
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      tot <= 39'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 43:9]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:20]
      tot <= _tot_T_2;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_0 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 35:17]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_0 <= io_in;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_1 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_1 <= regChain_0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_2 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_2 <= regChain_1;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_3 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_3 <= regChain_2;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_4 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_4 <= regChain_3;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_5 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_5 <= regChain_4;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_6 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_6 <= regChain_5;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_7 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_7 <= regChain_6;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_8 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_8 <= regChain_7;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_9 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_9 <= regChain_8;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_10 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_10 <= regChain_9;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_11 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_11 <= regChain_10;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_12 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_12 <= regChain_11;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_13 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_13 <= regChain_12;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_14 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_14 <= regChain_13;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_15 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_15 <= regChain_14;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_16 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_16 <= regChain_15;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_17 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_17 <= regChain_16;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_18 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_18 <= regChain_17;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_19 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_19 <= regChain_18;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_20 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_20 <= regChain_19;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_21 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_21 <= regChain_20;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_22 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_22 <= regChain_21;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_23 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_23 <= regChain_22;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_24 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_24 <= regChain_23;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_25 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_25 <= regChain_24;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_26 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_26 <= regChain_25;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_27 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_27 <= regChain_26;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_28 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_28 <= regChain_27;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_29 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_29 <= regChain_28;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_30 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_30 <= regChain_29;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_31 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_31 <= regChain_30;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_32 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_32 <= regChain_31;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_33 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_33 <= regChain_32;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_34 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_34 <= regChain_33;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_35 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_35 <= regChain_34;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_36 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_36 <= regChain_35;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_37 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_37 <= regChain_36;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_38 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_38 <= regChain_37;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_39 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_39 <= regChain_38;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_40 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_40 <= regChain_39;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_41 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_41 <= regChain_40;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_42 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_42 <= regChain_41;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_43 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_43 <= regChain_42;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_44 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_44 <= regChain_43;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_45 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_45 <= regChain_44;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_46 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_46 <= regChain_45;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_47 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_47 <= regChain_46;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_48 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_48 <= regChain_47;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_49 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_49 <= regChain_48;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_50 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_50 <= regChain_49;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_51 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_51 <= regChain_50;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_52 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_52 <= regChain_51;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_53 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_53 <= regChain_52;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_54 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_54 <= regChain_53;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_55 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_55 <= regChain_54;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_56 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_56 <= regChain_55;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_57 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_57 <= regChain_56;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_58 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_58 <= regChain_57;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_59 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_59 <= regChain_58;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_60 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_60 <= regChain_59;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_61 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_61 <= regChain_60;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_62 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_62 <= regChain_61;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:26]
      regChain_63 <= 32'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
    end else if (io_update) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 18:25]
      regChain_63 <= regChain_62;
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
  _RAND_0 = {2{`RANDOM}};
  tot = _RAND_0[38:0];
  _RAND_1 = {1{`RANDOM}};
  regChain_0 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  regChain_1 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  regChain_2 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  regChain_3 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  regChain_4 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  regChain_5 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  regChain_6 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  regChain_7 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  regChain_8 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  regChain_9 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  regChain_10 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  regChain_11 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  regChain_12 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  regChain_13 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  regChain_14 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  regChain_15 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  regChain_16 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  regChain_17 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  regChain_18 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  regChain_19 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  regChain_20 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  regChain_21 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  regChain_22 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  regChain_23 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  regChain_24 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  regChain_25 = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  regChain_26 = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  regChain_27 = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  regChain_28 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  regChain_29 = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  regChain_30 = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  regChain_31 = _RAND_32[31:0];
  _RAND_33 = {1{`RANDOM}};
  regChain_32 = _RAND_33[31:0];
  _RAND_34 = {1{`RANDOM}};
  regChain_33 = _RAND_34[31:0];
  _RAND_35 = {1{`RANDOM}};
  regChain_34 = _RAND_35[31:0];
  _RAND_36 = {1{`RANDOM}};
  regChain_35 = _RAND_36[31:0];
  _RAND_37 = {1{`RANDOM}};
  regChain_36 = _RAND_37[31:0];
  _RAND_38 = {1{`RANDOM}};
  regChain_37 = _RAND_38[31:0];
  _RAND_39 = {1{`RANDOM}};
  regChain_38 = _RAND_39[31:0];
  _RAND_40 = {1{`RANDOM}};
  regChain_39 = _RAND_40[31:0];
  _RAND_41 = {1{`RANDOM}};
  regChain_40 = _RAND_41[31:0];
  _RAND_42 = {1{`RANDOM}};
  regChain_41 = _RAND_42[31:0];
  _RAND_43 = {1{`RANDOM}};
  regChain_42 = _RAND_43[31:0];
  _RAND_44 = {1{`RANDOM}};
  regChain_43 = _RAND_44[31:0];
  _RAND_45 = {1{`RANDOM}};
  regChain_44 = _RAND_45[31:0];
  _RAND_46 = {1{`RANDOM}};
  regChain_45 = _RAND_46[31:0];
  _RAND_47 = {1{`RANDOM}};
  regChain_46 = _RAND_47[31:0];
  _RAND_48 = {1{`RANDOM}};
  regChain_47 = _RAND_48[31:0];
  _RAND_49 = {1{`RANDOM}};
  regChain_48 = _RAND_49[31:0];
  _RAND_50 = {1{`RANDOM}};
  regChain_49 = _RAND_50[31:0];
  _RAND_51 = {1{`RANDOM}};
  regChain_50 = _RAND_51[31:0];
  _RAND_52 = {1{`RANDOM}};
  regChain_51 = _RAND_52[31:0];
  _RAND_53 = {1{`RANDOM}};
  regChain_52 = _RAND_53[31:0];
  _RAND_54 = {1{`RANDOM}};
  regChain_53 = _RAND_54[31:0];
  _RAND_55 = {1{`RANDOM}};
  regChain_54 = _RAND_55[31:0];
  _RAND_56 = {1{`RANDOM}};
  regChain_55 = _RAND_56[31:0];
  _RAND_57 = {1{`RANDOM}};
  regChain_56 = _RAND_57[31:0];
  _RAND_58 = {1{`RANDOM}};
  regChain_57 = _RAND_58[31:0];
  _RAND_59 = {1{`RANDOM}};
  regChain_58 = _RAND_59[31:0];
  _RAND_60 = {1{`RANDOM}};
  regChain_59 = _RAND_60[31:0];
  _RAND_61 = {1{`RANDOM}};
  regChain_60 = _RAND_61[31:0];
  _RAND_62 = {1{`RANDOM}};
  regChain_61 = _RAND_62[31:0];
  _RAND_63 = {1{`RANDOM}};
  regChain_62 = _RAND_63[31:0];
  _RAND_64 = {1{`RANDOM}};
  regChain_63 = _RAND_64[31:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    tot = 39'sh0;
  end
  if (reset) begin
    regChain_0 = 32'sh0;
  end
  if (reset) begin
    regChain_1 = 32'sh0;
  end
  if (reset) begin
    regChain_2 = 32'sh0;
  end
  if (reset) begin
    regChain_3 = 32'sh0;
  end
  if (reset) begin
    regChain_4 = 32'sh0;
  end
  if (reset) begin
    regChain_5 = 32'sh0;
  end
  if (reset) begin
    regChain_6 = 32'sh0;
  end
  if (reset) begin
    regChain_7 = 32'sh0;
  end
  if (reset) begin
    regChain_8 = 32'sh0;
  end
  if (reset) begin
    regChain_9 = 32'sh0;
  end
  if (reset) begin
    regChain_10 = 32'sh0;
  end
  if (reset) begin
    regChain_11 = 32'sh0;
  end
  if (reset) begin
    regChain_12 = 32'sh0;
  end
  if (reset) begin
    regChain_13 = 32'sh0;
  end
  if (reset) begin
    regChain_14 = 32'sh0;
  end
  if (reset) begin
    regChain_15 = 32'sh0;
  end
  if (reset) begin
    regChain_16 = 32'sh0;
  end
  if (reset) begin
    regChain_17 = 32'sh0;
  end
  if (reset) begin
    regChain_18 = 32'sh0;
  end
  if (reset) begin
    regChain_19 = 32'sh0;
  end
  if (reset) begin
    regChain_20 = 32'sh0;
  end
  if (reset) begin
    regChain_21 = 32'sh0;
  end
  if (reset) begin
    regChain_22 = 32'sh0;
  end
  if (reset) begin
    regChain_23 = 32'sh0;
  end
  if (reset) begin
    regChain_24 = 32'sh0;
  end
  if (reset) begin
    regChain_25 = 32'sh0;
  end
  if (reset) begin
    regChain_26 = 32'sh0;
  end
  if (reset) begin
    regChain_27 = 32'sh0;
  end
  if (reset) begin
    regChain_28 = 32'sh0;
  end
  if (reset) begin
    regChain_29 = 32'sh0;
  end
  if (reset) begin
    regChain_30 = 32'sh0;
  end
  if (reset) begin
    regChain_31 = 32'sh0;
  end
  if (reset) begin
    regChain_32 = 32'sh0;
  end
  if (reset) begin
    regChain_33 = 32'sh0;
  end
  if (reset) begin
    regChain_34 = 32'sh0;
  end
  if (reset) begin
    regChain_35 = 32'sh0;
  end
  if (reset) begin
    regChain_36 = 32'sh0;
  end
  if (reset) begin
    regChain_37 = 32'sh0;
  end
  if (reset) begin
    regChain_38 = 32'sh0;
  end
  if (reset) begin
    regChain_39 = 32'sh0;
  end
  if (reset) begin
    regChain_40 = 32'sh0;
  end
  if (reset) begin
    regChain_41 = 32'sh0;
  end
  if (reset) begin
    regChain_42 = 32'sh0;
  end
  if (reset) begin
    regChain_43 = 32'sh0;
  end
  if (reset) begin
    regChain_44 = 32'sh0;
  end
  if (reset) begin
    regChain_45 = 32'sh0;
  end
  if (reset) begin
    regChain_46 = 32'sh0;
  end
  if (reset) begin
    regChain_47 = 32'sh0;
  end
  if (reset) begin
    regChain_48 = 32'sh0;
  end
  if (reset) begin
    regChain_49 = 32'sh0;
  end
  if (reset) begin
    regChain_50 = 32'sh0;
  end
  if (reset) begin
    regChain_51 = 32'sh0;
  end
  if (reset) begin
    regChain_52 = 32'sh0;
  end
  if (reset) begin
    regChain_53 = 32'sh0;
  end
  if (reset) begin
    regChain_54 = 32'sh0;
  end
  if (reset) begin
    regChain_55 = 32'sh0;
  end
  if (reset) begin
    regChain_56 = 32'sh0;
  end
  if (reset) begin
    regChain_57 = 32'sh0;
  end
  if (reset) begin
    regChain_58 = 32'sh0;
  end
  if (reset) begin
    regChain_59 = 32'sh0;
  end
  if (reset) begin
    regChain_60 = 32'sh0;
  end
  if (reset) begin
    regChain_61 = 32'sh0;
  end
  if (reset) begin
    regChain_62 = 32'sh0;
  end
  if (reset) begin
    regChain_63 = 32'sh0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Clamp_1(
  input  [38:0] io_in, // @[\\src\\main\\scala\\controller\\Clamp.scala 14:14]
  output [38:0] io_clampedValue // @[\\src\\main\\scala\\controller\\Clamp.scala 14:14]
);
  wire [38:0] _io_clampedValue_T_2 = $signed(io_in) > 39'sh7fffffff ? $signed(39'sh7fffffff) : $signed(io_in); // @[\\src\\main\\scala\\controller\\Clamp.scala 16:51]
  assign io_clampedValue = $signed(io_in) < -39'sh80000000 ? $signed(-39'sh80000000) : $signed(_io_clampedValue_T_2); // @[\\src\\main\\scala\\controller\\Clamp.scala 16:25]
endmodule
module Clamp_2(
  input  [63:0] io_in, // @[\\src\\main\\scala\\controller\\Clamp.scala 14:14]
  output [63:0] io_clampedValue // @[\\src\\main\\scala\\controller\\Clamp.scala 14:14]
);
  wire [63:0] _io_clampedValue_T_2 = $signed(io_in) > 64'sh7fffffff ? $signed(64'sh7fffffff) : $signed(io_in); // @[\\src\\main\\scala\\controller\\Clamp.scala 16:51]
  assign io_clampedValue = $signed(io_in) < -64'sh80000000 ? $signed(-64'sh80000000) : $signed(_io_clampedValue_T_2); // @[\\src\\main\\scala\\controller\\Clamp.scala 16:25]
endmodule
module PID(
  input         clock,
  input         reset,
  input  [31:0] io_e, // @[\\src\\main\\scala\\controller\\PID.scala 22:14]
  output [31:0] io_response, // @[\\src\\main\\scala\\controller\\PID.scala 22:14]
  output [31:0] io_pResponse, // @[\\src\\main\\scala\\controller\\PID.scala 22:14]
  output [31:0] io_iResponse, // @[\\src\\main\\scala\\controller\\PID.scala 22:14]
  output [31:0] io_dResponse // @[\\src\\main\\scala\\controller\\PID.scala 22:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [63:0] _RAND_8;
`endif // RANDOMIZE_REG_INIT
  wire  accumulator_clock; // @[\\src\\main\\scala\\controller\\PID.scala 39:27]
  wire  accumulator_reset; // @[\\src\\main\\scala\\controller\\PID.scala 39:27]
  wire [31:0] accumulator_io_in; // @[\\src\\main\\scala\\controller\\PID.scala 39:27]
  wire  accumulator_io_update; // @[\\src\\main\\scala\\controller\\PID.scala 39:27]
  wire [38:0] accumulator_io_out; // @[\\src\\main\\scala\\controller\\PID.scala 39:27]
  wire [38:0] intEClamp_io_in; // @[\\src\\main\\scala\\controller\\PID.scala 45:25]
  wire [38:0] intEClamp_io_clampedValue; // @[\\src\\main\\scala\\controller\\PID.scala 45:25]
  wire [63:0] pClamp_io_in; // @[\\src\\main\\scala\\controller\\PID.scala 59:22]
  wire [63:0] pClamp_io_clampedValue; // @[\\src\\main\\scala\\controller\\PID.scala 59:22]
  wire [63:0] iClamp_io_in; // @[\\src\\main\\scala\\controller\\PID.scala 60:22]
  wire [63:0] iClamp_io_clampedValue; // @[\\src\\main\\scala\\controller\\PID.scala 60:22]
  wire [63:0] dClamp_io_in; // @[\\src\\main\\scala\\controller\\PID.scala 61:22]
  wire [63:0] dClamp_io_clampedValue; // @[\\src\\main\\scala\\controller\\PID.scala 61:22]
  reg [31:0] lastE; // @[\\src\\main\\scala\\controller\\PID.scala 36:22]
  reg [26:0] updateCnt; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
  wire  wrap_wrap = updateCnt == 27'h5f5e0ff; // @[src/main/scala/chisel3/util/Counter.scala 73:24]
  wire [26:0] _wrap_value_T_1 = updateCnt + 27'h1; // @[src/main/scala/chisel3/util/Counter.scala 77:24]
  wire [38:0] _intE_T = intEClamp_io_clampedValue; // @[\\src\\main\\scala\\controller\\PID.scala 47:49]
  wire [31:0] diffE = $signed(io_e) - $signed(lastE); // @[\\src\\main\\scala\\controller\\PID.scala 49:17]
  reg [63:0] pMult; // @[\\src\\main\\scala\\controller\\PID.scala 52:22]
  reg [63:0] iMult; // @[\\src\\main\\scala\\controller\\PID.scala 53:22]
  reg [63:0] dMult; // @[\\src\\main\\scala\\controller\\PID.scala 54:22]
  wire [63:0] _pMult_T = 32'sh800000 * $signed(io_e); // @[\\src\\main\\scala\\controller\\PID.scala 55:17]
  wire [39:0] _pMult_T_1 = _pMult_T[63:24]; // @[\\src\\main\\scala\\controller\\PID.scala 55:39]
  wire [31:0] intE = _intE_T[31:0]; // @[\\src\\main\\scala\\controller\\PID.scala 32:18 47:8]
  wire [63:0] _iMult_T = 32'sh4189 * $signed(intE); // @[\\src\\main\\scala\\controller\\PID.scala 56:17]
  wire [39:0] _iMult_T_1 = _iMult_T[63:24]; // @[\\src\\main\\scala\\controller\\PID.scala 56:38]
  wire [63:0] _dMult_T = -32'sh5000000 * $signed(diffE); // @[\\src\\main\\scala\\controller\\PID.scala 57:17]
  wire [39:0] _dMult_T_1 = _dMult_T[63:24]; // @[\\src\\main\\scala\\controller\\PID.scala 57:39]
  reg [63:0] pResponse; // @[\\src\\main\\scala\\controller\\PID.scala 66:26]
  reg [63:0] iResponse; // @[\\src\\main\\scala\\controller\\PID.scala 67:26]
  reg [63:0] dResponse; // @[\\src\\main\\scala\\controller\\PID.scala 68:26]
  reg [63:0] res; // @[\\src\\main\\scala\\controller\\PID.scala 77:20]
  wire [63:0] _res_T_2 = $signed(pResponse) + $signed(iResponse); // @[\\src\\main\\scala\\controller\\PID.scala 78:20]
  wire [63:0] _res_T_5 = $signed(_res_T_2) + $signed(dResponse); // @[\\src\\main\\scala\\controller\\PID.scala 78:32]
  wire [63:0] _io_response_T_2 = $signed(res) > 64'shf33333000000 ? $signed(64'shf33333000000) : $signed(res); // @[\\src\\main\\scala\\controller\\PID.scala 84:57]
  wire [63:0] _io_response_T_3 = $signed(res) < 64'shccccd000000 ? $signed(64'shccccd000000) : $signed(_io_response_T_2)
    ; // @[\\src\\main\\scala\\controller\\PID.scala 84:21]
  wire [39:0] _GEN_4 = _io_response_T_3[63:24]; // @[\\src\\main\\scala\\controller\\PID.scala 84:15]
  wire [87:0] _GEN_10 = {$signed(_res_T_5), 24'h0}; // @[\\src\\main\\scala\\controller\\PID.scala 77:{20,20} 78:7]
  SAccumulator accumulator ( // @[\\src\\main\\scala\\controller\\PID.scala 39:27]
    .clock(accumulator_clock),
    .reset(accumulator_reset),
    .io_in(accumulator_io_in),
    .io_update(accumulator_io_update),
    .io_out(accumulator_io_out)
  );
  Clamp_1 intEClamp ( // @[\\src\\main\\scala\\controller\\PID.scala 45:25]
    .io_in(intEClamp_io_in),
    .io_clampedValue(intEClamp_io_clampedValue)
  );
  Clamp_2 pClamp ( // @[\\src\\main\\scala\\controller\\PID.scala 59:22]
    .io_in(pClamp_io_in),
    .io_clampedValue(pClamp_io_clampedValue)
  );
  Clamp_2 iClamp ( // @[\\src\\main\\scala\\controller\\PID.scala 60:22]
    .io_in(iClamp_io_in),
    .io_clampedValue(iClamp_io_clampedValue)
  );
  Clamp_2 dClamp ( // @[\\src\\main\\scala\\controller\\PID.scala 61:22]
    .io_in(dClamp_io_in),
    .io_clampedValue(dClamp_io_clampedValue)
  );
  assign io_response = _GEN_4[31:0]; // @[\\src\\main\\scala\\controller\\PID.scala 84:15]
  assign io_pResponse = pResponse[31:0]; // @[\\src\\main\\scala\\controller\\PID.scala 72:16]
  assign io_iResponse = iResponse[31:0]; // @[\\src\\main\\scala\\controller\\PID.scala 73:16]
  assign io_dResponse = dResponse[31:0]; // @[\\src\\main\\scala\\controller\\PID.scala 74:16]
  assign accumulator_clock = clock;
  assign accumulator_reset = reset;
  assign accumulator_io_in = io_e; // @[\\src\\main\\scala\\controller\\PID.scala 42:29]
  assign accumulator_io_update = updateCnt == 27'h5f5e0ff; // @[src/main/scala/chisel3/util/Counter.scala 73:24]
  assign intEClamp_io_in = accumulator_io_out; // @[\\src\\main\\scala\\controller\\PID.scala 46:19]
  assign pClamp_io_in = pMult; // @[\\src\\main\\scala\\controller\\PID.scala 62:25]
  assign iClamp_io_in = iMult; // @[\\src\\main\\scala\\controller\\PID.scala 63:25]
  assign dClamp_io_in = dMult; // @[\\src\\main\\scala\\controller\\PID.scala 64:25]
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\PID.scala 38:15]
      lastE <= 32'sh0;
    end else if (wrap_wrap) begin
      lastE <= io_e;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[src/main/scala/chisel3/util/Counter.scala 87:20]
      updateCnt <= 27'h0; // @[src/main/scala/chisel3/util/Counter.scala 87:28]
    end else if (wrap_wrap) begin // @[src/main/scala/chisel3/util/Counter.scala 77:15]
      updateCnt <= 27'h0;
    end else begin
      updateCnt <= _wrap_value_T_1;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\PID.scala 52:22]
      pMult <= 64'sh0; // @[\\src\\main\\scala\\controller\\PID.scala 52:22]
    end else begin
      pMult <= {{24{_pMult_T_1[39]}},_pMult_T_1}; // @[\\src\\main\\scala\\controller\\PID.scala 55:9]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\PID.scala 53:22]
      iMult <= 64'sh0; // @[\\src\\main\\scala\\controller\\PID.scala 53:22]
    end else begin
      iMult <= {{24{_iMult_T_1[39]}},_iMult_T_1}; // @[\\src\\main\\scala\\controller\\PID.scala 56:9]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\PID.scala 54:22]
      dMult <= 64'sh0; // @[\\src\\main\\scala\\controller\\PID.scala 54:22]
    end else begin
      dMult <= {{24{_dMult_T_1[39]}},_dMult_T_1}; // @[\\src\\main\\scala\\controller\\PID.scala 57:9]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\PID.scala 69:51]
      pResponse <= 64'sh0;
    end else begin
      pResponse <= pClamp_io_clampedValue;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\PID.scala 70:51]
      iResponse <= 64'sh0;
    end else begin
      iResponse <= iClamp_io_clampedValue;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\PID.scala 71:51]
      dResponse <= 64'sh0;
    end else begin
      dResponse <= dClamp_io_clampedValue;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\PID.scala 77:20]
      res <= 64'sh0; // @[\\src\\main\\scala\\controller\\PID.scala 77:20]
    end else begin
      res <= _GEN_10[63:0]; // @[\\src\\main\\scala\\controller\\PID.scala 78:7]
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
  updateCnt = _RAND_1[26:0];
  _RAND_2 = {2{`RANDOM}};
  pMult = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  iMult = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  dMult = _RAND_4[63:0];
  _RAND_5 = {2{`RANDOM}};
  pResponse = _RAND_5[63:0];
  _RAND_6 = {2{`RANDOM}};
  iResponse = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  dResponse = _RAND_7[63:0];
  _RAND_8 = {2{`RANDOM}};
  res = _RAND_8[63:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    lastE = 32'sh0;
  end
  if (reset) begin
    updateCnt = 27'h0;
  end
  if (reset) begin
    pMult = 64'sh0;
  end
  if (reset) begin
    iMult = 64'sh0;
  end
  if (reset) begin
    dMult = 64'sh0;
  end
  if (reset) begin
    pResponse = 64'sh0;
  end
  if (reset) begin
    iResponse = 64'sh0;
  end
  if (reset) begin
    dResponse = 64'sh0;
  end
  if (reset) begin
    res = 64'sh0;
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
module SPI(
  input         clock,
  input         reset,
  input         io_sck, // @[\\src\\main\\scala\\controller\\SPI.scala 32:14]
  input         io_mosi, // @[\\src\\main\\scala\\controller\\SPI.scala 32:14]
  output        io_miso, // @[\\src\\main\\scala\\controller\\SPI.scala 32:14]
  input         io_csN, // @[\\src\\main\\scala\\controller\\SPI.scala 32:14]
  output        io_packetUpdate, // @[\\src\\main\\scala\\controller\\SPI.scala 32:14]
  output [31:0] io_data_setPoint, // @[\\src\\main\\scala\\controller\\SPI.scala 32:14]
  output        io_data_enable, // @[\\src\\main\\scala\\controller\\SPI.scala 32:14]
  input  [31:0] io_data_temperature, // @[\\src\\main\\scala\\controller\\SPI.scala 32:14]
  input  [31:0] io_data_pEffort, // @[\\src\\main\\scala\\controller\\SPI.scala 32:14]
  input  [31:0] io_data_iEffort, // @[\\src\\main\\scala\\controller\\SPI.scala 32:14]
  input  [31:0] io_data_dEffort, // @[\\src\\main\\scala\\controller\\SPI.scala 32:14]
  input  [31:0] io_data_totEffort // @[\\src\\main\\scala\\controller\\SPI.scala 32:14]
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
  reg  sckPrev; // @[\\src\\main\\scala\\controller\\SPI.scala 38:24]
  reg  csnPrev; // @[\\src\\main\\scala\\controller\\SPI.scala 39:24]
  wire  sckRising = io_sck & ~sckPrev; // @[\\src\\main\\scala\\controller\\SPI.scala 41:25]
  wire  sckFalling = ~io_sck & sckPrev; // @[\\src\\main\\scala\\controller\\SPI.scala 42:27]
  wire  _csnFalling_T = ~io_csN; // @[\\src\\main\\scala\\controller\\SPI.scala 43:20]
  wire  csnFalling = ~io_csN & csnPrev; // @[\\src\\main\\scala\\controller\\SPI.scala 43:25]
  wire  csnRising = io_csN & ~csnPrev; // @[\\src\\main\\scala\\controller\\SPI.scala 44:25]
  reg [159:0] shrMosi; // @[\\src\\main\\scala\\controller\\SPI.scala 46:25]
  reg [159:0] shrMiso; // @[\\src\\main\\scala\\controller\\SPI.scala 47:25]
  reg [7:0] bitCount; // @[\\src\\main\\scala\\controller\\SPI.scala 48:25]
  wire [159:0] _shrMiso_T_5 = {io_data_temperature,io_data_pEffort,io_data_iEffort,io_data_dEffort,io_data_totEffort}; // @[\\src\\main\\scala\\controller\\SPI.scala 51:20]
  wire [160:0] _shrMiso_T_6 = {shrMiso, 1'h0}; // @[\\src\\main\\scala\\controller\\SPI.scala 60:24]
  wire [159:0] _shrMosi_T_1 = {shrMosi[158:0],io_mosi}; // @[\\src\\main\\scala\\controller\\SPI.scala 62:19]
  wire [7:0] _bitCount_T_1 = bitCount + 8'h1; // @[\\src\\main\\scala\\controller\\SPI.scala 63:26]
  wire [160:0] _GEN_2 = _csnFalling_T & sckFalling ? _shrMiso_T_6 : {{1'd0}, shrMiso}; // @[\\src\\main\\scala\\controller\\SPI.scala 59:34 60:13 47:25]
  wire [160:0] _GEN_5 = csnFalling ? {{1'd0}, _shrMiso_T_5} : _GEN_2; // @[\\src\\main\\scala\\controller\\SPI.scala 50:20 51:14]
  reg [31:0] setPointReg; // @[\\src\\main\\scala\\controller\\SPI.scala 68:28]
  reg  enableReg; // @[\\src\\main\\scala\\controller\\SPI.scala 69:28]
  reg  packetUpdateToggle; // @[\\src\\main\\scala\\controller\\SPI.scala 71:35]
  wire [31:0] _setPointReg_T_1 = shrMosi[159:128]; // @[\\src\\main\\scala\\controller\\SPI.scala 73:45]
  assign io_miso = shrMiso[159]; // @[\\src\\main\\scala\\controller\\SPI.scala 66:21]
  assign io_packetUpdate = packetUpdateToggle; // @[\\src\\main\\scala\\controller\\SPI.scala 77:19]
  assign io_data_setPoint = setPointReg; // @[\\src\\main\\scala\\controller\\SPI.scala 79:20]
  assign io_data_enable = enableReg; // @[\\src\\main\\scala\\controller\\SPI.scala 80:20]
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SPI.scala 38:24]
      sckPrev <= 1'h0; // @[\\src\\main\\scala\\controller\\SPI.scala 38:24]
    end else begin
      sckPrev <= io_sck; // @[\\src\\main\\scala\\controller\\SPI.scala 38:24]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SPI.scala 39:24]
      csnPrev <= 1'h1; // @[\\src\\main\\scala\\controller\\SPI.scala 39:24]
    end else begin
      csnPrev <= io_csN; // @[\\src\\main\\scala\\controller\\SPI.scala 39:24]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SPI.scala 50:20]
      shrMosi <= 160'h0; // @[\\src\\main\\scala\\controller\\SPI.scala 46:25]
    end else if (!(csnFalling)) begin // @[\\src\\main\\scala\\controller\\SPI.scala 59:34]
      if (!(_csnFalling_T & sckFalling)) begin // @[\\src\\main\\scala\\controller\\SPI.scala 61:33]
        if (_csnFalling_T & sckRising) begin // @[\\src\\main\\scala\\controller\\SPI.scala 46:25]
          shrMosi <= _shrMosi_T_1;
        end
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SPI.scala 47:25]
      shrMiso <= 160'h0; // @[\\src\\main\\scala\\controller\\SPI.scala 47:25]
    end else begin
      shrMiso <= _GEN_5[159:0];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SPI.scala 50:20]
      bitCount <= 8'h0; // @[\\src\\main\\scala\\controller\\SPI.scala 58:14]
    end else if (csnFalling) begin // @[\\src\\main\\scala\\controller\\SPI.scala 59:34]
      bitCount <= 8'h0; // @[\\src\\main\\scala\\controller\\SPI.scala 48:25]
    end else if (!(_csnFalling_T & sckFalling)) begin // @[\\src\\main\\scala\\controller\\SPI.scala 61:33]
      if (_csnFalling_T & sckRising) begin // @[\\src\\main\\scala\\controller\\SPI.scala 48:25]
        bitCount <= _bitCount_T_1;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SPI.scala 72:47]
      setPointReg <= 32'sh12000000; // @[\\src\\main\\scala\\controller\\SPI.scala 73:24]
    end else if (csnRising & bitCount >= 8'ha0) begin // @[\\src\\main\\scala\\controller\\SPI.scala 68:28]
      setPointReg <= _setPointReg_T_1;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SPI.scala 72:47]
      enableReg <= 1'h1; // @[\\src\\main\\scala\\controller\\SPI.scala 74:24]
    end else if (csnRising & bitCount >= 8'ha0) begin // @[\\src\\main\\scala\\controller\\SPI.scala 69:28]
      enableReg <= shrMosi[96];
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SPI.scala 72:47]
      packetUpdateToggle <= 1'h0; // @[\\src\\main\\scala\\controller\\SPI.scala 75:24]
    end else if (csnRising & bitCount >= 8'ha0) begin // @[\\src\\main\\scala\\controller\\SPI.scala 71:35]
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
  input        io_ADCIn, // @[\\src\\main\\scala\\controller\\Controller.scala 42:14]
  output [7:0] io_DACOut, // @[\\src\\main\\scala\\controller\\Controller.scala 42:14]
  output [7:0] io_ADCOut, // @[\\src\\main\\scala\\controller\\Controller.scala 42:14]
  output       io_coolingResponse, // @[\\src\\main\\scala\\controller\\Controller.scala 42:14]
  output [6:0] io_sseg, // @[\\src\\main\\scala\\controller\\Controller.scala 42:14]
  output [3:0] io_an, // @[\\src\\main\\scala\\controller\\Controller.scala 42:14]
  output       io_packetUpdate, // @[\\src\\main\\scala\\controller\\Controller.scala 42:14]
  input        io_sck, // @[\\src\\main\\scala\\controller\\Controller.scala 42:14]
  input        io_csN, // @[\\src\\main\\scala\\controller\\Controller.scala 42:14]
  input        io_mosi, // @[\\src\\main\\scala\\controller\\Controller.scala 42:14]
  output       io_miso // @[\\src\\main\\scala\\controller\\Controller.scala 42:14]
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
  wire  adc_clock; // @[\\src\\main\\scala\\controller\\Controller.scala 52:21]
  wire  adc_reset; // @[\\src\\main\\scala\\controller\\Controller.scala 52:21]
  wire  adc_io_in; // @[\\src\\main\\scala\\controller\\Controller.scala 52:21]
  wire [7:0] adc_io_out; // @[\\src\\main\\scala\\controller\\Controller.scala 52:21]
  wire [7:0] adc_io_DACOut; // @[\\src\\main\\scala\\controller\\Controller.scala 52:21]
  wire  adc_io_valid; // @[\\src\\main\\scala\\controller\\Controller.scala 52:21]
  wire  inputSmoothener_clock; // @[\\src\\main\\scala\\controller\\Controller.scala 56:33]
  wire  inputSmoothener_reset; // @[\\src\\main\\scala\\controller\\Controller.scala 56:33]
  wire [7:0] inputSmoothener_io_in; // @[\\src\\main\\scala\\controller\\Controller.scala 56:33]
  wire  inputSmoothener_io_update; // @[\\src\\main\\scala\\controller\\Controller.scala 56:33]
  wire [14:0] inputSmoothener_io_out; // @[\\src\\main\\scala\\controller\\Controller.scala 56:33]
  wire  inputSmoothener_io_valid; // @[\\src\\main\\scala\\controller\\Controller.scala 56:33]
  wire  tempLookup_clock; // @[\\src\\main\\scala\\controller\\Controller.scala 61:28]
  wire [7:0] tempLookup_io_in; // @[\\src\\main\\scala\\controller\\Controller.scala 61:28]
  wire [31:0] tempLookup_io_out; // @[\\src\\main\\scala\\controller\\Controller.scala 61:28]
  wire  display_clock; // @[\\src\\main\\scala\\controller\\Controller.scala 73:25]
  wire  display_reset; // @[\\src\\main\\scala\\controller\\Controller.scala 73:25]
  wire [31:0] display_io_currentTemp; // @[\\src\\main\\scala\\controller\\Controller.scala 73:25]
  wire [31:0] display_io_targetTemp; // @[\\src\\main\\scala\\controller\\Controller.scala 73:25]
  wire  display_io_enable; // @[\\src\\main\\scala\\controller\\Controller.scala 73:25]
  wire [1:0] display_io_anode; // @[\\src\\main\\scala\\controller\\Controller.scala 73:25]
  wire [6:0] display_io_asciiOut; // @[\\src\\main\\scala\\controller\\Controller.scala 73:25]
  wire [6:0] sseg_io_in; // @[\\src\\main\\scala\\controller\\Controller.scala 88:22]
  wire [6:0] sseg_io_out; // @[\\src\\main\\scala\\controller\\Controller.scala 88:22]
  wire  pid_clock; // @[\\src\\main\\scala\\controller\\Controller.scala 98:21]
  wire  pid_reset; // @[\\src\\main\\scala\\controller\\Controller.scala 98:21]
  wire [31:0] pid_io_e; // @[\\src\\main\\scala\\controller\\Controller.scala 98:21]
  wire [31:0] pid_io_response; // @[\\src\\main\\scala\\controller\\Controller.scala 98:21]
  wire [31:0] pid_io_pResponse; // @[\\src\\main\\scala\\controller\\Controller.scala 98:21]
  wire [31:0] pid_io_iResponse; // @[\\src\\main\\scala\\controller\\Controller.scala 98:21]
  wire [31:0] pid_io_dResponse; // @[\\src\\main\\scala\\controller\\Controller.scala 98:21]
  wire  coolingPWM_clock; // @[\\src\\main\\scala\\controller\\Controller.scala 105:28]
  wire  coolingPWM_reset; // @[\\src\\main\\scala\\controller\\Controller.scala 105:28]
  wire [31:0] coolingPWM_io_in; // @[\\src\\main\\scala\\controller\\Controller.scala 105:28]
  wire  coolingPWM_io_out; // @[\\src\\main\\scala\\controller\\Controller.scala 105:28]
  wire  spi_clock; // @[\\src\\main\\scala\\controller\\Controller.scala 115:21]
  wire  spi_reset; // @[\\src\\main\\scala\\controller\\Controller.scala 115:21]
  wire  spi_io_sck; // @[\\src\\main\\scala\\controller\\Controller.scala 115:21]
  wire  spi_io_mosi; // @[\\src\\main\\scala\\controller\\Controller.scala 115:21]
  wire  spi_io_miso; // @[\\src\\main\\scala\\controller\\Controller.scala 115:21]
  wire  spi_io_csN; // @[\\src\\main\\scala\\controller\\Controller.scala 115:21]
  wire  spi_io_packetUpdate; // @[\\src\\main\\scala\\controller\\Controller.scala 115:21]
  wire [31:0] spi_io_data_setPoint; // @[\\src\\main\\scala\\controller\\Controller.scala 115:21]
  wire  spi_io_data_enable; // @[\\src\\main\\scala\\controller\\Controller.scala 115:21]
  wire [31:0] spi_io_data_temperature; // @[\\src\\main\\scala\\controller\\Controller.scala 115:21]
  wire [31:0] spi_io_data_pEffort; // @[\\src\\main\\scala\\controller\\Controller.scala 115:21]
  wire [31:0] spi_io_data_iEffort; // @[\\src\\main\\scala\\controller\\Controller.scala 115:21]
  wire [31:0] spi_io_data_dEffort; // @[\\src\\main\\scala\\controller\\Controller.scala 115:21]
  wire [31:0] spi_io_data_totEffort; // @[\\src\\main\\scala\\controller\\Controller.scala 115:21]
  reg  synchronizedReset_REG; // @[\\src\\main\\scala\\controller\\Controller.scala 44:42]
  reg  synchronizedReset; // @[\\src\\main\\scala\\controller\\Controller.scala 44:34]
  reg  ADCIn_REG; // @[\\src\\main\\scala\\controller\\Controller.scala 47:32]
  reg  ADCIn; // @[\\src\\main\\scala\\controller\\Controller.scala 47:24]
  reg [31:0] targetTemp; // @[\\src\\main\\scala\\controller\\Controller.scala 48:29]
  reg  enable; // @[\\src\\main\\scala\\controller\\Controller.scala 49:25]
  reg [25:0] adcCnt; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
  wire  wrap_wrap = adcCnt == 26'h2faf07f; // @[src/main/scala/chisel3/util/Counter.scala 73:24]
  wire [25:0] _wrap_value_T_1 = adcCnt + 26'h1; // @[src/main/scala/chisel3/util/Counter.scala 77:24]
  reg [7:0] regADC; // @[\\src\\main\\scala\\controller\\Controller.scala 66:25]
  wire [8:0] _GEN_3 = wrap_wrap ? inputSmoothener_io_out[14:6] : {{1'd0}, regADC}; // @[\\src\\main\\scala\\controller\\Controller.scala 67:20 68:14 66:25]
  reg [25:0] curTempCnt; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
  wire  wrap_wrap_1 = curTempCnt == 26'h2faf07f; // @[src/main/scala/chisel3/util/Counter.scala 73:24]
  wire [25:0] _wrap_value_T_3 = curTempCnt + 26'h1; // @[src/main/scala/chisel3/util/Counter.scala 77:24]
  reg [31:0] regCurTemp; // @[\\src\\main\\scala\\controller\\Controller.scala 75:29]
  wire [31:0] _regCurTemp_T = tempLookup_io_out; // @[\\src\\main\\scala\\controller\\Controller.scala 77:29]
  reg [25:0] targetTempCnt; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
  wire  wrap_wrap_2 = targetTempCnt == 26'h2faf07f; // @[src/main/scala/chisel3/util/Counter.scala 73:24]
  wire [25:0] _wrap_value_T_5 = targetTempCnt + 26'h1; // @[src/main/scala/chisel3/util/Counter.scala 77:24]
  reg [31:0] regTargetTemp; // @[\\src\\main\\scala\\controller\\Controller.scala 81:32]
  wire [3:0] _io_an_T = 4'h1 << display_io_anode; // @[\\src\\main\\scala\\controller\\Controller.scala 92:20]
  reg  spi_io_sck_REG; // @[\\src\\main\\scala\\controller\\Controller.scala 116:34]
  reg  spi_io_sck_REG_1; // @[\\src\\main\\scala\\controller\\Controller.scala 116:26]
  reg  spi_io_csN_REG; // @[\\src\\main\\scala\\controller\\Controller.scala 117:34]
  reg  spi_io_csN_REG_1; // @[\\src\\main\\scala\\controller\\Controller.scala 117:26]
  reg  spi_io_mosi_REG; // @[\\src\\main\\scala\\controller\\Controller.scala 118:35]
  reg  spi_io_mosi_REG_1; // @[\\src\\main\\scala\\controller\\Controller.scala 118:27]
  ADC adc ( // @[\\src\\main\\scala\\controller\\Controller.scala 52:21]
    .clock(adc_clock),
    .reset(adc_reset),
    .io_in(adc_io_in),
    .io_out(adc_io_out),
    .io_DACOut(adc_io_DACOut),
    .io_valid(adc_io_valid)
  );
  Accumulator inputSmoothener ( // @[\\src\\main\\scala\\controller\\Controller.scala 56:33]
    .clock(inputSmoothener_clock),
    .reset(inputSmoothener_reset),
    .io_in(inputSmoothener_io_in),
    .io_update(inputSmoothener_io_update),
    .io_out(inputSmoothener_io_out),
    .io_valid(inputSmoothener_io_valid)
  );
  TemperatureLookup tempLookup ( // @[\\src\\main\\scala\\controller\\Controller.scala 61:28]
    .clock(tempLookup_clock),
    .io_in(tempLookup_io_in),
    .io_out(tempLookup_io_out)
  );
  Display display ( // @[\\src\\main\\scala\\controller\\Controller.scala 73:25]
    .clock(display_clock),
    .reset(display_reset),
    .io_currentTemp(display_io_currentTemp),
    .io_targetTemp(display_io_targetTemp),
    .io_enable(display_io_enable),
    .io_anode(display_io_anode),
    .io_asciiOut(display_io_asciiOut)
  );
  SSegDecoder sseg ( // @[\\src\\main\\scala\\controller\\Controller.scala 88:22]
    .io_in(sseg_io_in),
    .io_out(sseg_io_out)
  );
  PID pid ( // @[\\src\\main\\scala\\controller\\Controller.scala 98:21]
    .clock(pid_clock),
    .reset(pid_reset),
    .io_e(pid_io_e),
    .io_response(pid_io_response),
    .io_pResponse(pid_io_pResponse),
    .io_iResponse(pid_io_iResponse),
    .io_dResponse(pid_io_dResponse)
  );
  PWM coolingPWM ( // @[\\src\\main\\scala\\controller\\Controller.scala 105:28]
    .clock(coolingPWM_clock),
    .reset(coolingPWM_reset),
    .io_in(coolingPWM_io_in),
    .io_out(coolingPWM_io_out)
  );
  SPI spi ( // @[\\src\\main\\scala\\controller\\Controller.scala 115:21]
    .clock(spi_clock),
    .reset(spi_reset),
    .io_sck(spi_io_sck),
    .io_mosi(spi_io_mosi),
    .io_miso(spi_io_miso),
    .io_csN(spi_io_csN),
    .io_packetUpdate(spi_io_packetUpdate),
    .io_data_setPoint(spi_io_data_setPoint),
    .io_data_enable(spi_io_data_enable),
    .io_data_temperature(spi_io_data_temperature),
    .io_data_pEffort(spi_io_data_pEffort),
    .io_data_iEffort(spi_io_data_iEffort),
    .io_data_dEffort(spi_io_data_dEffort),
    .io_data_totEffort(spi_io_data_totEffort)
  );
  assign io_DACOut = adc_io_DACOut; // @[\\src\\main\\scala\\controller\\Controller.scala 54:15]
  assign io_ADCOut = regADC; // @[\\src\\main\\scala\\controller\\Controller.scala 70:15]
  assign io_coolingResponse = inputSmoothener_io_valid & enable & ($signed(pid_io_response) > 32'sh0 & coolingPWM_io_out
    ); // @[\\src\\main\\scala\\controller\\Controller.scala 108:47 109:26 111:26]
  assign io_sseg = ~sseg_io_out; // @[\\src\\main\\scala\\controller\\Controller.scala 91:16]
  assign io_an = ~_io_an_T; // @[\\src\\main\\scala\\controller\\Controller.scala 92:14]
  assign io_packetUpdate = spi_io_packetUpdate; // @[\\src\\main\\scala\\controller\\Controller.scala 121:21]
  assign io_miso = spi_io_miso; // @[\\src\\main\\scala\\controller\\Controller.scala 120:13]
  assign adc_clock = clock;
  assign adc_reset = synchronizedReset; // @[\\src\\main\\scala\\controller\\Controller.scala 46:31]
  assign adc_io_in = ADCIn; // @[\\src\\main\\scala\\controller\\Controller.scala 53:15]
  assign inputSmoothener_clock = clock;
  assign inputSmoothener_reset = synchronizedReset; // @[\\src\\main\\scala\\controller\\Controller.scala 46:31]
  assign inputSmoothener_io_in = adc_io_out; // @[\\src\\main\\scala\\controller\\Controller.scala 58:27]
  assign inputSmoothener_io_update = adc_io_valid; // @[\\src\\main\\scala\\controller\\Controller.scala 57:31]
  assign tempLookup_clock = clock;
  assign tempLookup_io_in = inputSmoothener_io_out[13:6]; // @[\\src\\main\\scala\\controller\\Controller.scala 62:22]
  assign display_clock = clock;
  assign display_reset = synchronizedReset; // @[\\src\\main\\scala\\controller\\Controller.scala 46:31]
  assign display_io_currentTemp = regCurTemp; // @[\\src\\main\\scala\\controller\\Controller.scala 79:28]
  assign display_io_targetTemp = regTargetTemp; // @[\\src\\main\\scala\\controller\\Controller.scala 85:27]
  assign display_io_enable = enable; // @[\\src\\main\\scala\\controller\\Controller.scala 86:23]
  assign sseg_io_in = display_io_asciiOut; // @[\\src\\main\\scala\\controller\\Controller.scala 89:16]
  assign pid_clock = clock;
  assign pid_reset = synchronizedReset; // @[\\src\\main\\scala\\controller\\Controller.scala 46:31]
  assign pid_io_e = $signed(tempLookup_io_out) - $signed(targetTemp); // @[\\src\\main\\scala\\controller\\Controller.scala 96:18]
  assign coolingPWM_clock = clock;
  assign coolingPWM_reset = synchronizedReset; // @[\\src\\main\\scala\\controller\\Controller.scala 46:31]
  assign coolingPWM_io_in = pid_io_response; // @[\\src\\main\\scala\\controller\\Controller.scala 104:36]
  assign spi_clock = clock;
  assign spi_reset = synchronizedReset; // @[\\src\\main\\scala\\controller\\Controller.scala 46:31]
  assign spi_io_sck = spi_io_sck_REG_1; // @[\\src\\main\\scala\\controller\\Controller.scala 116:16]
  assign spi_io_mosi = spi_io_mosi_REG_1; // @[\\src\\main\\scala\\controller\\Controller.scala 118:17]
  assign spi_io_csN = spi_io_csN_REG_1; // @[\\src\\main\\scala\\controller\\Controller.scala 117:16]
  assign spi_io_data_temperature = tempLookup_io_out; // @[\\src\\main\\scala\\controller\\Controller.scala 125:40]
  assign spi_io_data_pEffort = pid_io_pResponse; // @[\\src\\main\\scala\\controller\\Controller.scala 126:45]
  assign spi_io_data_iEffort = pid_io_iResponse; // @[\\src\\main\\scala\\controller\\Controller.scala 127:45]
  assign spi_io_data_dEffort = pid_io_dResponse; // @[\\src\\main\\scala\\controller\\Controller.scala 128:45]
  assign spi_io_data_totEffort = pid_io_response; // @[\\src\\main\\scala\\controller\\Controller.scala 129:46]
  always @(posedge clock) begin
    synchronizedReset_REG <= reset; // @[\\src\\main\\scala\\controller\\Controller.scala 44:42]
    synchronizedReset <= synchronizedReset_REG; // @[\\src\\main\\scala\\controller\\Controller.scala 44:34]
  end
  always @(posedge clock or posedge synchronizedReset) begin
    if (synchronizedReset) begin // @[\\src\\main\\scala\\controller\\Controller.scala 47:32]
      ADCIn_REG <= 1'h1; // @[\\src\\main\\scala\\controller\\Controller.scala 47:32]
    end else begin
      ADCIn_REG <= io_ADCIn; // @[\\src\\main\\scala\\controller\\Controller.scala 47:32]
    end
  end
  always @(posedge clock or posedge synchronizedReset) begin
    if (synchronizedReset) begin // @[\\src\\main\\scala\\controller\\Controller.scala 47:24]
      ADCIn <= 1'h0; // @[\\src\\main\\scala\\controller\\Controller.scala 47:24]
    end else begin
      ADCIn <= ADCIn_REG; // @[\\src\\main\\scala\\controller\\Controller.scala 47:24]
    end
  end
  always @(posedge clock or posedge synchronizedReset) begin
    if (synchronizedReset) begin // @[\\src\\main\\scala\\controller\\Controller.scala 123:52]
      targetTemp <= 32'sh12000000;
    end else begin
      targetTemp <= spi_io_data_setPoint;
    end
  end
  always @(posedge clock or posedge synchronizedReset) begin
    if (synchronizedReset) begin // @[\\src\\main\\scala\\controller\\Controller.scala 49:25]
      enable <= 1'h1; // @[\\src\\main\\scala\\controller\\Controller.scala 49:25]
    end else begin
      enable <= spi_io_data_enable; // @[\\src\\main\\scala\\controller\\Controller.scala 124:12]
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
    if (synchronizedReset) begin // @[\\src\\main\\scala\\controller\\Controller.scala 66:25]
      regADC <= 8'h0; // @[\\src\\main\\scala\\controller\\Controller.scala 66:25]
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
    if (synchronizedReset) begin // @[\\src\\main\\scala\\controller\\Controller.scala 116:34]
      spi_io_sck_REG <= 1'h0; // @[\\src\\main\\scala\\controller\\Controller.scala 116:34]
    end else begin
      spi_io_sck_REG <= io_sck; // @[\\src\\main\\scala\\controller\\Controller.scala 116:34]
    end
  end
  always @(posedge clock or posedge synchronizedReset) begin
    if (synchronizedReset) begin // @[\\src\\main\\scala\\controller\\Controller.scala 116:26]
      spi_io_sck_REG_1 <= 1'h0; // @[\\src\\main\\scala\\controller\\Controller.scala 116:26]
    end else begin
      spi_io_sck_REG_1 <= spi_io_sck_REG; // @[\\src\\main\\scala\\controller\\Controller.scala 116:26]
    end
  end
  always @(posedge clock or posedge synchronizedReset) begin
    if (synchronizedReset) begin // @[\\src\\main\\scala\\controller\\Controller.scala 117:34]
      spi_io_csN_REG <= 1'h1; // @[\\src\\main\\scala\\controller\\Controller.scala 117:34]
    end else begin
      spi_io_csN_REG <= io_csN; // @[\\src\\main\\scala\\controller\\Controller.scala 117:34]
    end
  end
  always @(posedge clock or posedge synchronizedReset) begin
    if (synchronizedReset) begin // @[\\src\\main\\scala\\controller\\Controller.scala 117:26]
      spi_io_csN_REG_1 <= 1'h1; // @[\\src\\main\\scala\\controller\\Controller.scala 117:26]
    end else begin
      spi_io_csN_REG_1 <= spi_io_csN_REG; // @[\\src\\main\\scala\\controller\\Controller.scala 117:26]
    end
  end
  always @(posedge clock or posedge synchronizedReset) begin
    if (synchronizedReset) begin // @[\\src\\main\\scala\\controller\\Controller.scala 118:35]
      spi_io_mosi_REG <= 1'h0; // @[\\src\\main\\scala\\controller\\Controller.scala 118:35]
    end else begin
      spi_io_mosi_REG <= io_mosi; // @[\\src\\main\\scala\\controller\\Controller.scala 118:35]
    end
  end
  always @(posedge clock or posedge synchronizedReset) begin
    if (synchronizedReset) begin // @[\\src\\main\\scala\\controller\\Controller.scala 118:27]
      spi_io_mosi_REG_1 <= 1'h0; // @[\\src\\main\\scala\\controller\\Controller.scala 118:27]
    end else begin
      spi_io_mosi_REG_1 <= spi_io_mosi_REG; // @[\\src\\main\\scala\\controller\\Controller.scala 118:27]
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
  spi_io_sck_REG = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  spi_io_sck_REG_1 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  spi_io_csN_REG = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  spi_io_csN_REG_1 = _RAND_15[0:0];
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
    spi_io_sck_REG = 1'h0;
  end
  if (synchronizedReset) begin
    spi_io_sck_REG_1 = 1'h0;
  end
  if (synchronizedReset) begin
    spi_io_csN_REG = 1'h1;
  end
  if (synchronizedReset) begin
    spi_io_csN_REG_1 = 1'h1;
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
