module Test(
  input        clock,
  input        reset,
  input  [7:0] io_in, // @[\\src\\main\\scala\\controller\\Test.scala 12:14]
  output [7:0] io_out // @[\\src\\main\\scala\\controller\\Test.scala 12:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] in_REG; // @[\\src\\main\\scala\\controller\\Test.scala 13:27]
  reg [7:0] in; // @[\\src\\main\\scala\\controller\\Test.scala 13:19]
  assign io_out = in; // @[\\src\\main\\scala\\controller\\Test.scala 14:10]
  always @(posedge clock) begin
    in_REG <= io_in; // @[\\src\\main\\scala\\controller\\Test.scala 13:27]
    in <= in_REG; // @[\\src\\main\\scala\\controller\\Test.scala 13:19]
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
  in_REG = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  in = _RAND_1[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
