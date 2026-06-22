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
module ADCTest(
  input        clock,
  input        reset,
  input        io_in, // @[\\src\\main\\scala\\controller\\ADCTest.scala 7:14]
  output [7:0] io_out, // @[\\src\\main\\scala\\controller\\ADCTest.scala 7:14]
  output [7:0] io_DACOut, // @[\\src\\main\\scala\\controller\\ADCTest.scala 7:14]
  output       io_valid // @[\\src\\main\\scala\\controller\\ADCTest.scala 7:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  wire  ADC_clock; // @[\\src\\main\\scala\\controller\\ADCTest.scala 13:21]
  wire  ADC_reset; // @[\\src\\main\\scala\\controller\\ADCTest.scala 13:21]
  wire  ADC_io_in; // @[\\src\\main\\scala\\controller\\ADCTest.scala 13:21]
  wire [7:0] ADC_io_out; // @[\\src\\main\\scala\\controller\\ADCTest.scala 13:21]
  wire [7:0] ADC_io_DACOut; // @[\\src\\main\\scala\\controller\\ADCTest.scala 13:21]
  wire  ADC_io_valid; // @[\\src\\main\\scala\\controller\\ADCTest.scala 13:21]
  reg  synchedReset_REG; // @[\\src\\main\\scala\\controller\\ADCTest.scala 9:37]
  reg  synchedReset; // @[\\src\\main\\scala\\controller\\ADCTest.scala 9:29]
  reg  in_REG; // @[\\src\\main\\scala\\controller\\ADCTest.scala 11:29]
  reg  in; // @[\\src\\main\\scala\\controller\\ADCTest.scala 11:21]
  reg [7:0] out; // @[\\src\\main\\scala\\controller\\ADCTest.scala 14:22]
  reg [26:0] updateCNT; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
  wire  wrap_wrap = updateCNT == 27'h5f5e0ff; // @[src/main/scala/chisel3/util/Counter.scala 73:24]
  wire [26:0] _wrap_value_T_1 = updateCNT + 27'h1; // @[src/main/scala/chisel3/util/Counter.scala 77:24]
  ADC ADC ( // @[\\src\\main\\scala\\controller\\ADCTest.scala 13:21]
    .clock(ADC_clock),
    .reset(ADC_reset),
    .io_in(ADC_io_in),
    .io_out(ADC_io_out),
    .io_DACOut(ADC_io_DACOut),
    .io_valid(ADC_io_valid)
  );
  assign io_out = out; // @[\\src\\main\\scala\\controller\\ADCTest.scala 18:12]
  assign io_DACOut = ADC_io_DACOut; // @[\\src\\main\\scala\\controller\\ADCTest.scala 19:15]
  assign io_valid = ADC_io_valid; // @[\\src\\main\\scala\\controller\\ADCTest.scala 20:14]
  assign ADC_clock = clock;
  assign ADC_reset = synchedReset; // @[\\src\\main\\scala\\controller\\ADCTest.scala 10:26]
  assign ADC_io_in = in; // @[\\src\\main\\scala\\controller\\ADCTest.scala 17:15]
  always @(posedge clock) begin
    synchedReset_REG <= reset; // @[\\src\\main\\scala\\controller\\ADCTest.scala 9:37]
    synchedReset <= synchedReset_REG; // @[\\src\\main\\scala\\controller\\ADCTest.scala 9:29]
    in_REG <= io_in; // @[\\src\\main\\scala\\controller\\ADCTest.scala 11:29]
    in <= in_REG; // @[\\src\\main\\scala\\controller\\ADCTest.scala 11:21]
  end
  always @(posedge clock or posedge synchedReset) begin
    if (synchedReset) begin // @[\\src\\main\\scala\\controller\\ADCTest.scala 16:15]
      out <= 8'h0;
    end else if (wrap_wrap) begin
      out <= ADC_io_out;
    end
  end
  always @(posedge clock or posedge synchedReset) begin
    if (synchedReset) begin // @[src/main/scala/chisel3/util/Counter.scala 87:20]
      updateCNT <= 27'h0; // @[src/main/scala/chisel3/util/Counter.scala 87:28]
    end else if (wrap_wrap) begin // @[src/main/scala/chisel3/util/Counter.scala 77:15]
      updateCNT <= 27'h0;
    end else begin
      updateCNT <= _wrap_value_T_1;
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
  synchedReset_REG = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  synchedReset = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  in_REG = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  in = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  out = _RAND_4[7:0];
  _RAND_5 = {1{`RANDOM}};
  updateCNT = _RAND_5[26:0];
`endif // RANDOMIZE_REG_INIT
  if (synchedReset) begin
    out = 8'h0;
  end
  if (synchedReset) begin
    updateCNT = 27'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
