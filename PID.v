module SAccumulator(
  input         clock,
  input         reset,
  input  [15:0] io_in, // @[\\src\\main\\scala\\controller\\SAccumulator.scala 15:14]
  output [63:0] io_out // @[\\src\\main\\scala\\controller\\SAccumulator.scala 15:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] tot; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 16:20]
  reg [15:0] regChain_0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_1; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_2; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_3; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  reg [15:0] regChain_4; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
  wire [15:0] _diff_T_2 = $signed(io_in) - $signed(regChain_4); // @[\\src\\main\\scala\\controller\\SAccumulator.scala 32:17]
  wire [16:0] diff = {{1{_diff_T_2[15]}},_diff_T_2}; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 31:18 32:8]
  wire [63:0] _GEN_10 = {{47{diff[16]}},diff}; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:14]
  wire [63:0] _tot_T_2 = $signed(tot) + $signed(_GEN_10); // @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:14]
  assign io_out = tot; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 35:10]
  always @(posedge clock) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 16:20]
      tot <= 64'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 16:20]
    end else begin
      tot <= _tot_T_2;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
      regChain_0 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
    end else begin
      regChain_0 <= io_in;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
      regChain_1 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
    end else begin
      regChain_1 <= regChain_0;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
      regChain_2 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
    end else begin
      regChain_2 <= regChain_1;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
      regChain_3 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
    end else begin
      regChain_3 <= regChain_2;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
      regChain_4 <= 16'sh0; // @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
    end else begin
      regChain_4 <= regChain_3;
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
  tot = _RAND_0[63:0];
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
`endif // RANDOMIZE_REG_INIT
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
  input  [31:0] io_P, // @[\\src\\main\\scala\\controller\\PID.scala 20:14]
  input  [31:0] io_I, // @[\\src\\main\\scala\\controller\\PID.scala 20:14]
  input  [31:0] io_D, // @[\\src\\main\\scala\\controller\\PID.scala 20:14]
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
  wire [63:0] accumulator_io_out; // @[\\src\\main\\scala\\controller\\PID.scala 27:27]
  reg [31:0] lastE; // @[\\src\\main\\scala\\controller\\PID.scala 26:22]
  wire [63:0] _intE_T = accumulator_io_out; // @[\\src\\main\\scala\\controller\\PID.scala 32:42]
  wire [31:0] diffE = $signed(io_e) - $signed(lastE); // @[\\src\\main\\scala\\controller\\PID.scala 33:17]
  reg [31:0] pResponse; // @[\\src\\main\\scala\\controller\\PID.scala 35:26]
  reg [31:0] iResponse; // @[\\src\\main\\scala\\controller\\PID.scala 36:26]
  reg [31:0] dResponse; // @[\\src\\main\\scala\\controller\\PID.scala 37:26]
  wire [63:0] _pResponse_T = $signed(io_P) * $signed(io_e); // @[\\src\\main\\scala\\controller\\PID.scala 38:20]
  wire [31:0] intE = _intE_T[31:0]; // @[\\src\\main\\scala\\controller\\PID.scala 23:18 32:8]
  wire [63:0] _iResponse_T = $signed(io_I) * $signed(intE); // @[\\src\\main\\scala\\controller\\PID.scala 39:20]
  wire [63:0] _dResponse_T = $signed(io_D) * $signed(diffE); // @[\\src\\main\\scala\\controller\\PID.scala 40:20]
  reg [31:0] res; // @[\\src\\main\\scala\\controller\\PID.scala 45:20]
  wire [31:0] _res_T_2 = $signed(pResponse) + $signed(iResponse); // @[\\src\\main\\scala\\controller\\PID.scala 46:20]
  wire [31:0] _res_T_5 = $signed(_res_T_2) + $signed(dResponse); // @[\\src\\main\\scala\\controller\\PID.scala 46:32]
  wire [31:0] _io_response_T_2 = $signed(res) > 32'shf33333 ? $signed(32'shf33333) : $signed(res); // @[\\src\\main\\scala\\controller\\PID.scala 51:57]
  wire [39:0] _GEN_2 = reset ? $signed(40'sh0) : $signed(_pResponse_T[63:24]); // @[\\src\\main\\scala\\controller\\PID.scala 35:{26,26} 38:13]
  wire [39:0] _GEN_4 = reset ? $signed(40'sh0) : $signed(_iResponse_T[63:24]); // @[\\src\\main\\scala\\controller\\PID.scala 36:{26,26} 39:13]
  wire [39:0] _GEN_6 = reset ? $signed(40'sh0) : $signed(_dResponse_T[63:24]); // @[\\src\\main\\scala\\controller\\PID.scala 37:{26,26} 40:13]
  SAccumulator accumulator ( // @[\\src\\main\\scala\\controller\\PID.scala 27:27]
    .clock(accumulator_clock),
    .reset(accumulator_reset),
    .io_in(accumulator_io_in),
    .io_out(accumulator_io_out)
  );
  assign io_response = $signed(res) < 32'shccccd ? $signed(32'shccccd) : $signed(_io_response_T_2); // @[\\src\\main\\scala\\controller\\PID.scala 51:21]
  assign io_pResponse = pResponse; // @[\\src\\main\\scala\\controller\\PID.scala 41:16]
  assign io_iResponse = iResponse; // @[\\src\\main\\scala\\controller\\PID.scala 42:16]
  assign io_dResponse = dResponse; // @[\\src\\main\\scala\\controller\\PID.scala 43:16]
  assign accumulator_clock = clock;
  assign accumulator_reset = reset;
  assign accumulator_io_in = io_e[15:0]; // @[\\src\\main\\scala\\controller\\PID.scala 29:21]
  always @(posedge clock) begin
    lastE <= io_e; // @[\\src\\main\\scala\\controller\\PID.scala 26:22]
    pResponse <= _GEN_2[31:0]; // @[\\src\\main\\scala\\controller\\PID.scala 35:{26,26} 38:13]
    iResponse <= _GEN_4[31:0]; // @[\\src\\main\\scala\\controller\\PID.scala 36:{26,26} 39:13]
    dResponse <= _GEN_6[31:0]; // @[\\src\\main\\scala\\controller\\PID.scala 37:{26,26} 40:13]
    if (reset) begin // @[\\src\\main\\scala\\controller\\PID.scala 45:20]
      res <= 32'sh0; // @[\\src\\main\\scala\\controller\\PID.scala 45:20]
    end else begin
      res <= _res_T_5; // @[\\src\\main\\scala\\controller\\PID.scala 46:7]
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
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
