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
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Accumulator(
  input          clock,
  input          reset,
  input  [15:0]  io_in, // @[\\src\\main\\scala\\controller\\Accumulator.scala 15:14]
  output [111:0] io_out, // @[\\src\\main\\scala\\controller\\Accumulator.scala 15:14]
  output         io_valid // @[\\src\\main\\scala\\controller\\Accumulator.scala 15:14]
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
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
`endif // RANDOMIZE_REG_INIT
  reg [111:0] tot; // @[\\src\\main\\scala\\controller\\Accumulator.scala 16:20]
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
  reg  full; // @[\\src\\main\\scala\\controller\\Accumulator.scala 19:21]
  reg [5:0] cnt; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
  wire  wrap_wrap = cnt == 6'h3f; // @[src/main/scala/chisel3/util/Counter.scala 73:24]
  wire [15:0] _diff_T_1 = io_in - regChain_63; // @[\\src\\main\\scala\\controller\\Accumulator.scala 32:17]
  wire [16:0] diff = {{1'd0}, _diff_T_1}; // @[\\src\\main\\scala\\controller\\Accumulator.scala 31:18 32:8]
  wire [111:0] _GEN_68 = {{95'd0}, diff}; // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:14]
  assign io_out = tot; // @[\\src\\main\\scala\\controller\\Accumulator.scala 35:10]
  assign io_valid = full; // @[\\src\\main\\scala\\controller\\Accumulator.scala 24:12]
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:14]
      tot <= 112'h0;
    end else begin
      tot <= tot + _GEN_68;
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
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 21:18]
      full <= 1'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 22:10]
    end else begin
      full <= wrap_wrap | full; // @[\\src\\main\\scala\\controller\\Accumulator.scala 19:21]
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[src/main/scala/chisel3/util/Counter.scala 77:24]
      cnt <= 6'h0;
    end else begin
      cnt <= cnt + 6'h1;
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
  _RAND_65 = {1{`RANDOM}};
  full = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  cnt = _RAND_66[5:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    tot = 112'h0;
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
    full = 1'h0;
  end
  if (reset) begin
    cnt = 6'h0;
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
  input  [7:0]  io_in, // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 14:14]
  output [31:0] io_out // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 14:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] mem [0:255]; // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 16:24]
  wire  mem_io_out_MPORT_en; // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 16:24]
  wire [7:0] mem_io_out_MPORT_addr; // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 16:24]
  wire [31:0] mem_io_out_MPORT_data; // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 16:24]
  reg  mem_io_out_MPORT_en_pipe_0;
  reg [7:0] mem_io_out_MPORT_addr_pipe_0;
  assign mem_io_out_MPORT_en = mem_io_out_MPORT_en_pipe_0;
  assign mem_io_out_MPORT_addr = mem_io_out_MPORT_addr_pipe_0;
  assign mem_io_out_MPORT_data = mem[mem_io_out_MPORT_addr]; // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 16:24]
  assign io_out = mem_io_out_MPORT_data; // @[\\src\\main\\scala\\controller\\TemperatureLookup.scala 20:10]
  always @(posedge clock) begin
    mem_io_out_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_io_out_MPORT_addr_pipe_0 <= io_in;
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
  integer initvar;
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
  mem_io_out_MPORT_en_pipe_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  mem_io_out_MPORT_addr_pipe_0 = _RAND_1[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
  $readmemh("lookup.mem", mem);
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
module SSegDecoder(
  input  [6:0] io_in, // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 12:14]
  output [6:0] io_out // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 12:14]
);
  wire [6:0] _GEN_0 = 7'h79 == io_in ? 7'h5b : 7'h0; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 83:24 14:27]
  wire [6:0] _GEN_1 = 7'h78 == io_in ? 7'h6e : _GEN_0; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 82:24]
  wire [6:0] _GEN_2 = 7'h77 == io_in ? 7'h76 : _GEN_1; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 81:24]
  wire [6:0] _GEN_3 = 7'h76 == io_in ? 7'h1c : _GEN_2; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 80:24]
  wire [6:0] _GEN_4 = 7'h75 == io_in ? 7'h1c : _GEN_3; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 79:24]
  wire [6:0] _GEN_5 = 7'h74 == io_in ? 7'h78 : _GEN_4; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 78:24]
  wire [6:0] _GEN_6 = 7'h73 == io_in ? 7'h6d : _GEN_5; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 77:24]
  wire [6:0] _GEN_7 = 7'h72 == io_in ? 7'h50 : _GEN_6; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 76:24]
  wire [6:0] _GEN_8 = 7'h71 == io_in ? 7'h67 : _GEN_7; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 75:24]
  wire [6:0] _GEN_9 = 7'h70 == io_in ? 7'h73 : _GEN_8; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 74:24]
  wire [6:0] _GEN_10 = 7'h6f == io_in ? 7'h5c : _GEN_9; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 73:24]
  wire [6:0] _GEN_11 = 7'h6e == io_in ? 7'h54 : _GEN_10; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 72:24]
  wire [6:0] _GEN_12 = 7'h6d == io_in ? 7'h37 : _GEN_11; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 71:24]
  wire [6:0] _GEN_13 = 7'h6c == io_in ? 7'h18 : _GEN_12; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 70:24]
  wire [6:0] _GEN_14 = 7'h6b == io_in ? 7'h75 : _GEN_13; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 69:24]
  wire [6:0] _GEN_15 = 7'h6a == io_in ? 7'hc : _GEN_14; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 68:24]
  wire [6:0] _GEN_16 = 7'h69 == io_in ? 7'h4 : _GEN_15; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 67:24]
  wire [6:0] _GEN_17 = 7'h68 == io_in ? 7'h74 : _GEN_16; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 66:24]
  wire [6:0] _GEN_18 = 7'h67 == io_in ? 7'h6f : _GEN_17; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 65:24]
  wire [6:0] _GEN_19 = 7'h66 == io_in ? 7'h71 : _GEN_18; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 64:24]
  wire [6:0] _GEN_20 = 7'h65 == io_in ? 7'h7b : _GEN_19; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 63:24]
  wire [6:0] _GEN_21 = 7'h64 == io_in ? 7'h5e : _GEN_20; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 62:24]
  wire [6:0] _GEN_22 = 7'h63 == io_in ? 7'h58 : _GEN_21; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 61:24]
  wire [6:0] _GEN_23 = 7'h62 == io_in ? 7'h7c : _GEN_22; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 60:24]
  wire [6:0] _GEN_24 = 7'h61 == io_in ? 7'h5f : _GEN_23; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 59:24]
  wire [6:0] _GEN_25 = 7'h5a == io_in ? 7'h5b : _GEN_24; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 57:23]
  wire [6:0] _GEN_26 = 7'h59 == io_in ? 7'h6e : _GEN_25; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 56:23]
  wire [6:0] _GEN_27 = 7'h58 == io_in ? 7'h76 : _GEN_26; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 55:23]
  wire [6:0] _GEN_28 = 7'h57 == io_in ? 7'h3e : _GEN_27; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 54:23]
  wire [6:0] _GEN_29 = 7'h56 == io_in ? 7'h1c : _GEN_28; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 53:23]
  wire [6:0] _GEN_30 = 7'h55 == io_in ? 7'h3e : _GEN_29; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 52:23]
  wire [6:0] _GEN_31 = 7'h54 == io_in ? 7'h78 : _GEN_30; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 51:23]
  wire [6:0] _GEN_32 = 7'h53 == io_in ? 7'h6d : _GEN_31; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 50:23]
  wire [6:0] _GEN_33 = 7'h52 == io_in ? 7'h50 : _GEN_32; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 49:23]
  wire [6:0] _GEN_34 = 7'h51 == io_in ? 7'h67 : _GEN_33; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 48:23]
  wire [6:0] _GEN_35 = 7'h50 == io_in ? 7'h73 : _GEN_34; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 47:23]
  wire [6:0] _GEN_36 = 7'h4f == io_in ? 7'h3f : _GEN_35; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 46:23]
  wire [6:0] _GEN_37 = 7'h4e == io_in ? 7'h37 : _GEN_36; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 45:23]
  wire [6:0] _GEN_38 = 7'h4d == io_in ? 7'h37 : _GEN_37; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 44:23]
  wire [6:0] _GEN_39 = 7'h4c == io_in ? 7'h38 : _GEN_38; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 43:23]
  wire [6:0] _GEN_40 = 7'h4b == io_in ? 7'h75 : _GEN_39; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 42:23]
  wire [6:0] _GEN_41 = 7'h4a == io_in ? 7'he : _GEN_40; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 41:23]
  wire [6:0] _GEN_42 = 7'h49 == io_in ? 7'h6 : _GEN_41; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 40:23]
  wire [6:0] _GEN_43 = 7'h48 == io_in ? 7'h76 : _GEN_42; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 39:23]
  wire [6:0] _GEN_44 = 7'h47 == io_in ? 7'h3d : _GEN_43; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 38:23]
  wire [6:0] _GEN_45 = 7'h46 == io_in ? 7'h71 : _GEN_44; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 37:23]
  wire [6:0] _GEN_46 = 7'h45 == io_in ? 7'h79 : _GEN_45; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 36:23]
  wire [6:0] _GEN_47 = 7'h44 == io_in ? 7'h5e : _GEN_46; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 35:23]
  wire [6:0] _GEN_48 = 7'h43 == io_in ? 7'h39 : _GEN_47; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 34:23]
  wire [6:0] _GEN_49 = 7'h42 == io_in ? 7'h7c : _GEN_48; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 33:23]
  wire [6:0] _GEN_50 = 7'h41 == io_in ? 7'h77 : _GEN_49; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 32:23]
  wire [6:0] _GEN_51 = 7'h3d == io_in ? 7'h6f : _GEN_50; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 30:23]
  wire [6:0] _GEN_52 = 7'h39 == io_in ? 7'h6f : _GEN_51; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 28:23]
  wire [6:0] _GEN_53 = 7'h38 == io_in ? 7'h7f : _GEN_52; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 27:23]
  wire [6:0] _GEN_54 = 7'h37 == io_in ? 7'h7 : _GEN_53; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 26:23]
  wire [6:0] _GEN_55 = 7'h36 == io_in ? 7'h7d : _GEN_54; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 25:23]
  wire [6:0] _GEN_56 = 7'h35 == io_in ? 7'h6d : _GEN_55; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 24:23]
  wire [6:0] _GEN_57 = 7'h34 == io_in ? 7'h66 : _GEN_56; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 23:23]
  wire [6:0] _GEN_58 = 7'h33 == io_in ? 7'h4f : _GEN_57; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 22:23]
  wire [6:0] _GEN_59 = 7'h32 == io_in ? 7'h5b : _GEN_58; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 21:23]
  wire [6:0] _GEN_60 = 7'h31 == io_in ? 7'h6 : _GEN_59; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 20:23]
  wire [6:0] _GEN_61 = 7'h30 == io_in ? 7'h3f : _GEN_60; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 19:23]
  assign io_out = 7'h20 == io_in ? 7'h0 : _GEN_61; // @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17 17:23]
endmodule
module Display(
  input         clock,
  input         reset,
  input  [31:0] io_currentTemp, // @[\\src\\main\\scala\\controller\\Display.scala 20:14]
  output [6:0]  io_sseg, // @[\\src\\main\\scala\\controller\\Display.scala 20:14]
  output [3:0]  io_an // @[\\src\\main\\scala\\controller\\Display.scala 20:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  wire [15:0] Clamp_io_in; // @[\\src\\main\\scala\\controller\\Display.scala 42:21]
  wire [15:0] Clamp_io_clampedValue; // @[\\src\\main\\scala\\controller\\Display.scala 42:21]
  wire  Clamp_io_isClamped; // @[\\src\\main\\scala\\controller\\Display.scala 42:21]
  wire [6:0] sseg_io_in; // @[\\src\\main\\scala\\controller\\Display.scala 65:20]
  wire [6:0] sseg_io_out; // @[\\src\\main\\scala\\controller\\Display.scala 65:20]
  wire [7:0] currentTemp = io_currentTemp[31:24]; // @[\\src\\main\\scala\\controller\\Display.scala 22:36]
  reg  curMode; // @[\\src\\main\\scala\\controller\\Display.scala 25:24]
  reg [27:0] modeCnt; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
  wire  wrap_wrap = modeCnt == 28'hbebc1ff; // @[src/main/scala/chisel3/util/Counter.scala 73:24]
  wire [27:0] _wrap_value_T_1 = modeCnt + 28'h1; // @[src/main/scala/chisel3/util/Counter.scala 77:24]
  wire  _T_2 = ~curMode; // @[\\src\\main\\scala\\controller\\Display.scala 28:22]
  wire  _GEN_3 = curMode ? 1'h0 : curMode; // @[\\src\\main\\scala\\controller\\Display.scala 28:22 25:24 30:42]
  wire  _GEN_4 = ~curMode | _GEN_3; // @[\\src\\main\\scala\\controller\\Display.scala 28:22 29:43]
  reg  showTemp; // @[\\src\\main\\scala\\controller\\Display.scala 34:25]
  reg [25:0] blinkCnt; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
  wire  wrap_wrap_1 = blinkCnt == 26'h2faf07f; // @[src/main/scala/chisel3/util/Counter.scala 73:24]
  wire [25:0] _wrap_value_T_3 = blinkCnt + 26'h1; // @[src/main/scala/chisel3/util/Counter.scala 77:24]
  wire  _showTemp_T = ~showTemp; // @[\\src\\main\\scala\\controller\\Display.scala 37:19]
  wire [6:0] _GEN_10 = curMode ? 7'h54 : 7'h20; // @[\\src\\main\\scala\\controller\\Display.scala 45:20 51:19 41:32]
  wire [31:0] _GEN_11 = curMode ? $signed(32'sh12) : $signed(32'sh0); // @[\\src\\main\\scala\\controller\\Display.scala 45:20 52:15 43:28]
  wire [6:0] leadingChar = _T_2 ? 7'h43 : _GEN_10; // @[\\src\\main\\scala\\controller\\Display.scala 45:20 47:19]
  wire [31:0] clampIn = _T_2 ? $signed({{24{currentTemp[7]}},currentTemp}) : $signed(_GEN_11); // @[\\src\\main\\scala\\controller\\Display.scala 45:20 48:15]
  wire [7:0] _Clamp_io_in_T = clampIn[31:24]; // @[\\src\\main\\scala\\controller\\Display.scala 56:27]
  wire  _curMessage_2_T_1 = _showTemp_T & Clamp_io_isClamped; // @[\\src\\main\\scala\\controller\\Display.scala 61:34]
  wire [15:0] _curMessage_2_T_2 = Clamp_io_clampedValue / 4'ha; // @[\\src\\main\\scala\\controller\\Display.scala 61:74]
  wire [15:0] _curMessage_2_T_3 = _showTemp_T & Clamp_io_isClamped ? 16'h20 : _curMessage_2_T_2; // @[\\src\\main\\scala\\controller\\Display.scala 61:23]
  wire [15:0] _GEN_0 = Clamp_io_clampedValue % 16'ha; // @[\\src\\main\\scala\\controller\\Display.scala 62:74]
  wire [5:0] _curMessage_3_T_3 = _curMessage_2_T_1 ? 6'h20 : {{2'd0}, _GEN_0[3:0]}; // @[\\src\\main\\scala\\controller\\Display.scala 62:23]
  reg [1:0] anodeCnt; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
  wire [6:0] _GEN_17 = 2'h1 == anodeCnt ? 7'h3d : leadingChar; // @[\\src\\main\\scala\\controller\\Display.scala 66:{14,14}]
  wire [6:0] curMessage_2 = _curMessage_2_T_3[6:0]; // @[\\src\\main\\scala\\controller\\Display.scala 40:24 61:17]
  wire [6:0] _GEN_18 = 2'h2 == anodeCnt ? curMessage_2 : _GEN_17; // @[\\src\\main\\scala\\controller\\Display.scala 66:{14,14}]
  wire [6:0] curMessage_3 = {{1'd0}, _curMessage_3_T_3}; // @[\\src\\main\\scala\\controller\\Display.scala 40:24 62:17]
  wire [3:0] _io_an_T = 4'h1 << anodeCnt; // @[\\src\\main\\scala\\controller\\Display.scala 69:18]
  Clamp Clamp ( // @[\\src\\main\\scala\\controller\\Display.scala 42:21]
    .io_in(Clamp_io_in),
    .io_clampedValue(Clamp_io_clampedValue),
    .io_isClamped(Clamp_io_isClamped)
  );
  SSegDecoder sseg ( // @[\\src\\main\\scala\\controller\\Display.scala 65:20]
    .io_in(sseg_io_in),
    .io_out(sseg_io_out)
  );
  assign io_sseg = ~sseg_io_out; // @[\\src\\main\\scala\\controller\\Display.scala 68:14]
  assign io_an = ~_io_an_T; // @[\\src\\main\\scala\\controller\\Display.scala 69:12]
  assign Clamp_io_in = {{8{_Clamp_io_in_T[7]}},_Clamp_io_in_T}; // @[\\src\\main\\scala\\controller\\Display.scala 56:15]
  assign sseg_io_in = 2'h3 == anodeCnt ? curMessage_3 : _GEN_18; // @[\\src\\main\\scala\\controller\\Display.scala 66:{14,14}]
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Display.scala 27:22]
      curMode <= 1'h0;
    end else if (wrap_wrap) begin // @[\\src\\main\\scala\\controller\\Display.scala 25:24]
      curMode <= _GEN_4;
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
    if (reset) begin // @[\\src\\main\\scala\\controller\\Display.scala 36:23]
      showTemp <= 1'h1; // @[\\src\\main\\scala\\controller\\Display.scala 37:16]
    end else if (wrap_wrap_1) begin // @[\\src\\main\\scala\\controller\\Display.scala 34:25]
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
    if (reset) begin // @[src/main/scala/chisel3/util/Counter.scala 77:24]
      anodeCnt <= 2'h0;
    end else begin
      anodeCnt <= anodeCnt + 2'h1;
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
  curMode = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  modeCnt = _RAND_1[27:0];
  _RAND_2 = {1{`RANDOM}};
  showTemp = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  blinkCnt = _RAND_3[25:0];
  _RAND_4 = {1{`RANDOM}};
  anodeCnt = _RAND_4[1:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    curMode = 1'h0;
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
  input  [31:0] io_e, // @[\\src\\main\\scala\\controller\\PID.scala 17:14]
  output [31:0] io_response // @[\\src\\main\\scala\\controller\\PID.scala 17:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  accumulator_clock; // @[\\src\\main\\scala\\controller\\PID.scala 24:27]
  wire  accumulator_reset; // @[\\src\\main\\scala\\controller\\PID.scala 24:27]
  wire [15:0] accumulator_io_in; // @[\\src\\main\\scala\\controller\\PID.scala 24:27]
  wire [111:0] accumulator_io_out; // @[\\src\\main\\scala\\controller\\PID.scala 24:27]
  reg [31:0] lastE; // @[\\src\\main\\scala\\controller\\PID.scala 23:22]
  wire [111:0] _intE_T = accumulator_io_out; // @[\\src\\main\\scala\\controller\\PID.scala 29:42]
  wire [31:0] diffE = $signed(io_e) - $signed(lastE); // @[\\src\\main\\scala\\controller\\PID.scala 30:17]
  wire [63:0] _res_T = 32'sh1000000 * $signed(io_e); // @[\\src\\main\\scala\\controller\\PID.scala 32:17]
  wire [31:0] intE = _intE_T[31:0]; // @[\\src\\main\\scala\\controller\\PID.scala 20:18 29:8]
  wire [63:0] _res_T_1 = 32'sh1000000 * $signed(intE); // @[\\src\\main\\scala\\controller\\PID.scala 32:30]
  wire [63:0] _res_T_4 = $signed(_res_T) + $signed(_res_T_1); // @[\\src\\main\\scala\\controller\\PID.scala 32:24]
  wire [63:0] _res_T_5 = 32'sh1000000 * $signed(diffE); // @[\\src\\main\\scala\\controller\\PID.scala 32:42]
  wire [63:0] res = $signed(_res_T_4) + $signed(_res_T_5); // @[\\src\\main\\scala\\controller\\PID.scala 32:36]
  wire [63:0] _io_response_T_2 = $signed(res) > 64'sh1000000000000 ? $signed(64'sh1000000000000) : $signed(res); // @[\\src\\main\\scala\\controller\\PID.scala 34:129]
  wire [63:0] _io_response_T_3 = $signed(res) < 64'sh0 ? $signed(64'sh0) : $signed(_io_response_T_2); // @[\\src\\main\\scala\\controller\\PID.scala 34:21]
  wire [39:0] _GEN_1 = _io_response_T_3[63:24]; // @[\\src\\main\\scala\\controller\\PID.scala 34:15]
  SAccumulator accumulator ( // @[\\src\\main\\scala\\controller\\PID.scala 24:27]
    .clock(accumulator_clock),
    .reset(accumulator_reset),
    .io_in(accumulator_io_in),
    .io_out(accumulator_io_out)
  );
  assign io_response = _GEN_1[31:0]; // @[\\src\\main\\scala\\controller\\PID.scala 34:15]
  assign accumulator_clock = clock;
  assign accumulator_reset = reset;
  assign accumulator_io_in = io_e[15:0]; // @[\\src\\main\\scala\\controller\\PID.scala 26:21]
  always @(posedge clock) begin
    lastE <= io_e; // @[\\src\\main\\scala\\controller\\PID.scala 23:22]
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
`endif // RANDOMIZE_REG_INIT
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
  input  [15:0] io_in, // @[\\src\\main\\scala\\controller\\PWM.scala 14:14]
  output        io_out // @[\\src\\main\\scala\\controller\\PWM.scala 14:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [23:0] cur; // @[\\src\\main\\scala\\controller\\PWM.scala 16:20]
  wire [23:0] _cur_T_2 = cur + 24'h1; // @[\\src\\main\\scala\\controller\\PWM.scala 17:40]
  wire  ready = cur == 24'h7fffff; // @[\\src\\main\\scala\\controller\\PWM.scala 19:19]
  reg [15:0] in; // @[\\src\\main\\scala\\controller\\PWM.scala 21:19]
  wire [23:0] _GEN_0 = {{8'd0}, in}; // @[\\src\\main\\scala\\controller\\PWM.scala 25:17]
  assign io_out = cur < _GEN_0; // @[\\src\\main\\scala\\controller\\PWM.scala 25:17]
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\PWM.scala 17:13]
      cur <= 24'h0;
    end else if (cur >= 24'h7fffff) begin
      cur <= 24'h0;
    end else begin
      cur <= _cur_T_2;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\PWM.scala 22:12]
      in <= 16'h0;
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
  cur = _RAND_0[23:0];
  _RAND_1 = {1{`RANDOM}};
  in = _RAND_1[15:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    cur = 24'h0;
  end
  if (reset) begin
    in = 16'h0;
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
  input        io_ADCIn, // @[\\src\\main\\scala\\controller\\Controller.scala 31:14]
  output [7:0] io_DACOut, // @[\\src\\main\\scala\\controller\\Controller.scala 31:14]
  output       io_coolingResponse, // @[\\src\\main\\scala\\controller\\Controller.scala 31:14]
  output [6:0] io_sseg, // @[\\src\\main\\scala\\controller\\Controller.scala 31:14]
  output [3:0] io_an // @[\\src\\main\\scala\\controller\\Controller.scala 31:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  adc_clock; // @[\\src\\main\\scala\\controller\\Controller.scala 39:21]
  wire  adc_reset; // @[\\src\\main\\scala\\controller\\Controller.scala 39:21]
  wire  adc_io_in; // @[\\src\\main\\scala\\controller\\Controller.scala 39:21]
  wire [7:0] adc_io_out; // @[\\src\\main\\scala\\controller\\Controller.scala 39:21]
  wire [7:0] adc_io_DACOut; // @[\\src\\main\\scala\\controller\\Controller.scala 39:21]
  wire  inputSmoothener_clock; // @[\\src\\main\\scala\\controller\\Controller.scala 43:33]
  wire  inputSmoothener_reset; // @[\\src\\main\\scala\\controller\\Controller.scala 43:33]
  wire [15:0] inputSmoothener_io_in; // @[\\src\\main\\scala\\controller\\Controller.scala 43:33]
  wire [111:0] inputSmoothener_io_out; // @[\\src\\main\\scala\\controller\\Controller.scala 43:33]
  wire  inputSmoothener_io_valid; // @[\\src\\main\\scala\\controller\\Controller.scala 43:33]
  wire  tempLookup_clock; // @[\\src\\main\\scala\\controller\\Controller.scala 47:28]
  wire [7:0] tempLookup_io_in; // @[\\src\\main\\scala\\controller\\Controller.scala 47:28]
  wire [31:0] tempLookup_io_out; // @[\\src\\main\\scala\\controller\\Controller.scala 47:28]
  wire  display_clock; // @[\\src\\main\\scala\\controller\\Controller.scala 51:25]
  wire  display_reset; // @[\\src\\main\\scala\\controller\\Controller.scala 51:25]
  wire [31:0] display_io_currentTemp; // @[\\src\\main\\scala\\controller\\Controller.scala 51:25]
  wire [6:0] display_io_sseg; // @[\\src\\main\\scala\\controller\\Controller.scala 51:25]
  wire [3:0] display_io_an; // @[\\src\\main\\scala\\controller\\Controller.scala 51:25]
  wire  pid_clock; // @[\\src\\main\\scala\\controller\\Controller.scala 60:21]
  wire  pid_reset; // @[\\src\\main\\scala\\controller\\Controller.scala 60:21]
  wire [31:0] pid_io_e; // @[\\src\\main\\scala\\controller\\Controller.scala 60:21]
  wire [31:0] pid_io_response; // @[\\src\\main\\scala\\controller\\Controller.scala 60:21]
  wire  coolingPWM_clock; // @[\\src\\main\\scala\\controller\\Controller.scala 67:28]
  wire  coolingPWM_reset; // @[\\src\\main\\scala\\controller\\Controller.scala 67:28]
  wire [15:0] coolingPWM_io_in; // @[\\src\\main\\scala\\controller\\Controller.scala 67:28]
  wire  coolingPWM_io_out; // @[\\src\\main\\scala\\controller\\Controller.scala 67:28]
  reg  synchronizedReset_REG; // @[\\src\\main\\scala\\controller\\Controller.scala 33:42]
  reg  synchronizedReset; // @[\\src\\main\\scala\\controller\\Controller.scala 33:34]
  reg  ADCIn_REG; // @[\\src\\main\\scala\\controller\\Controller.scala 37:32]
  reg  ADCIn; // @[\\src\\main\\scala\\controller\\Controller.scala 37:24]
  wire [38:0] _response_T = {$signed(pid_io_response), 7'h0}; // @[\\src\\main\\scala\\controller\\Controller.scala 66:38]
  wire [31:0] _response_T_2 = _response_T[31:0]; // @[\\src\\main\\scala\\controller\\Controller.scala 66:111]
  wire [24:0] response = _response_T_2[31:7]; // @[\\src\\main\\scala\\controller\\Controller.scala 66:166]
  ADC adc ( // @[\\src\\main\\scala\\controller\\Controller.scala 39:21]
    .clock(adc_clock),
    .reset(adc_reset),
    .io_in(adc_io_in),
    .io_out(adc_io_out),
    .io_DACOut(adc_io_DACOut)
  );
  Accumulator inputSmoothener ( // @[\\src\\main\\scala\\controller\\Controller.scala 43:33]
    .clock(inputSmoothener_clock),
    .reset(inputSmoothener_reset),
    .io_in(inputSmoothener_io_in),
    .io_out(inputSmoothener_io_out),
    .io_valid(inputSmoothener_io_valid)
  );
  TemperatureLookup tempLookup ( // @[\\src\\main\\scala\\controller\\Controller.scala 47:28]
    .clock(tempLookup_clock),
    .io_in(tempLookup_io_in),
    .io_out(tempLookup_io_out)
  );
  Display display ( // @[\\src\\main\\scala\\controller\\Controller.scala 51:25]
    .clock(display_clock),
    .reset(display_reset),
    .io_currentTemp(display_io_currentTemp),
    .io_sseg(display_io_sseg),
    .io_an(display_io_an)
  );
  PID pid ( // @[\\src\\main\\scala\\controller\\Controller.scala 60:21]
    .clock(pid_clock),
    .reset(pid_reset),
    .io_e(pid_io_e),
    .io_response(pid_io_response)
  );
  PWM coolingPWM ( // @[\\src\\main\\scala\\controller\\Controller.scala 67:28]
    .clock(coolingPWM_clock),
    .reset(coolingPWM_reset),
    .io_in(coolingPWM_io_in),
    .io_out(coolingPWM_io_out)
  );
  assign io_DACOut = adc_io_DACOut; // @[\\src\\main\\scala\\controller\\Controller.scala 41:15]
  assign io_coolingResponse = inputSmoothener_io_valid ? 1'h0 : $signed(pid_io_response) > 32'sh0 & coolingPWM_io_out; // @[\\src\\main\\scala\\controller\\Controller.scala 70:37 71:26 73:26]
  assign io_sseg = display_io_sseg; // @[\\src\\main\\scala\\controller\\Controller.scala 54:13]
  assign io_an = display_io_an; // @[\\src\\main\\scala\\controller\\Controller.scala 55:11]
  assign adc_clock = clock;
  assign adc_reset = synchronizedReset; // @[\\src\\main\\scala\\controller\\Controller.scala 35:31]
  assign adc_io_in = ADCIn; // @[\\src\\main\\scala\\controller\\Controller.scala 40:15]
  assign inputSmoothener_clock = clock;
  assign inputSmoothener_reset = synchronizedReset; // @[\\src\\main\\scala\\controller\\Controller.scala 35:31]
  assign inputSmoothener_io_in = {{8'd0}, adc_io_out}; // @[\\src\\main\\scala\\controller\\Controller.scala 44:27]
  assign tempLookup_clock = clock;
  assign tempLookup_io_in = inputSmoothener_io_out[13:6]; // @[\\src\\main\\scala\\controller\\Controller.scala 48:22]
  assign display_clock = clock;
  assign display_reset = synchronizedReset; // @[\\src\\main\\scala\\controller\\Controller.scala 35:31]
  assign display_io_currentTemp = tempLookup_io_out; // @[\\src\\main\\scala\\controller\\Controller.scala 52:28]
  assign pid_clock = clock;
  assign pid_reset = synchronizedReset; // @[\\src\\main\\scala\\controller\\Controller.scala 35:31]
  assign pid_io_e = 32'sh12000000 - $signed(tempLookup_io_out); // @[\\src\\main\\scala\\controller\\Controller.scala 58:17]
  assign coolingPWM_clock = clock;
  assign coolingPWM_reset = synchronizedReset; // @[\\src\\main\\scala\\controller\\Controller.scala 35:31]
  assign coolingPWM_io_in = response[15:0]; // @[\\src\\main\\scala\\controller\\Controller.scala 68:22]
  always @(posedge clock) begin
    synchronizedReset_REG <= reset; // @[\\src\\main\\scala\\controller\\Controller.scala 33:42]
    synchronizedReset <= synchronizedReset_REG; // @[\\src\\main\\scala\\controller\\Controller.scala 33:34]
    ADCIn_REG <= io_ADCIn; // @[\\src\\main\\scala\\controller\\Controller.scala 37:32]
    ADCIn <= ADCIn_REG; // @[\\src\\main\\scala\\controller\\Controller.scala 37:24]
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
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
