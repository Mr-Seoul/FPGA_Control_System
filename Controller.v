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
  wire [5:0] _wrap_value_T_1 = cnt + 6'h1; // @[src/main/scala/chisel3/util/Counter.scala 77:24]
  wire  _GEN_2 = wrap_wrap | full; // @[\\src\\main\\scala\\controller\\Accumulator.scala 21:18 22:10 19:21]
  wire [15:0] _diff_T_2 = $signed(io_in) - $signed(regChain_63); // @[\\src\\main\\scala\\controller\\Accumulator.scala 32:17]
  wire [16:0] diff = {{1{_diff_T_2[15]}},_diff_T_2}; // @[\\src\\main\\scala\\controller\\Accumulator.scala 31:18 32:8]
  wire [111:0] _GEN_68 = {{95{diff[16]}},diff}; // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:14]
  wire [111:0] _tot_T_2 = $signed(tot) + $signed(_GEN_68); // @[\\src\\main\\scala\\controller\\Accumulator.scala 34:14]
  assign io_out = tot; // @[\\src\\main\\scala\\controller\\Accumulator.scala 35:10]
  assign io_valid = full; // @[\\src\\main\\scala\\controller\\Accumulator.scala 24:12]
  always @(posedge clock) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 16:20]
      tot <= 112'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 16:20]
    end else begin
      tot <= _tot_T_2;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_0 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_0 <= io_in;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_1 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_1 <= regChain_0;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_2 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_2 <= regChain_1;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_3 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_3 <= regChain_2;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_4 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_4 <= regChain_3;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_5 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_5 <= regChain_4;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_6 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_6 <= regChain_5;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_7 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_7 <= regChain_6;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_8 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_8 <= regChain_7;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_9 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_9 <= regChain_8;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_10 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_10 <= regChain_9;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_11 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_11 <= regChain_10;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_12 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_12 <= regChain_11;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_13 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_13 <= regChain_12;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_14 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_14 <= regChain_13;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_15 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_15 <= regChain_14;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_16 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_16 <= regChain_15;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_17 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_17 <= regChain_16;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_18 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_18 <= regChain_17;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_19 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_19 <= regChain_18;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_20 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_20 <= regChain_19;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_21 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_21 <= regChain_20;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_22 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_22 <= regChain_21;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_23 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_23 <= regChain_22;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_24 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_24 <= regChain_23;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_25 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_25 <= regChain_24;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_26 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_26 <= regChain_25;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_27 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_27 <= regChain_26;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_28 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_28 <= regChain_27;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_29 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_29 <= regChain_28;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_30 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_30 <= regChain_29;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_31 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_31 <= regChain_30;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_32 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_32 <= regChain_31;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_33 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_33 <= regChain_32;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_34 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_34 <= regChain_33;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_35 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_35 <= regChain_34;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_36 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_36 <= regChain_35;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_37 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_37 <= regChain_36;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_38 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_38 <= regChain_37;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_39 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_39 <= regChain_38;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_40 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_40 <= regChain_39;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_41 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_41 <= regChain_40;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_42 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_42 <= regChain_41;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_43 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_43 <= regChain_42;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_44 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_44 <= regChain_43;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_45 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_45 <= regChain_44;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_46 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_46 <= regChain_45;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_47 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_47 <= regChain_46;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_48 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_48 <= regChain_47;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_49 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_49 <= regChain_48;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_50 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_50 <= regChain_49;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_51 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_51 <= regChain_50;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_52 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_52 <= regChain_51;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_53 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_53 <= regChain_52;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_54 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_54 <= regChain_53;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_55 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_55 <= regChain_54;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_56 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_56 <= regChain_55;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_57 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_57 <= regChain_56;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_58 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_58 <= regChain_57;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_59 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_59 <= regChain_58;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_60 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_60 <= regChain_59;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_61 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_61 <= regChain_60;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_62 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_62 <= regChain_61;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
      regChain_63 <= 16'sh0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 17:25]
    end else begin
      regChain_63 <= regChain_62;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\Accumulator.scala 19:21]
      full <= 1'h0; // @[\\src\\main\\scala\\controller\\Accumulator.scala 19:21]
    end else begin
      full <= _GEN_2;
    end
    if (reset) begin // @[src/main/scala/chisel3/util/Counter.scala 61:40]
      cnt <= 6'h0; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
    end else begin
      cnt <= _wrap_value_T_1;
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
  input  [15:0] io_currentTemp, // @[\\src\\main\\scala\\controller\\Display.scala 19:14]
  input  [15:0] io_targetTemp, // @[\\src\\main\\scala\\controller\\Display.scala 19:14]
  output [6:0]  io_sseg, // @[\\src\\main\\scala\\controller\\Display.scala 19:14]
  output [3:0]  io_an // @[\\src\\main\\scala\\controller\\Display.scala 19:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  wire [15:0] Clamp_io_in; // @[\\src\\main\\scala\\controller\\Display.scala 38:21]
  wire [15:0] Clamp_io_clampedValue; // @[\\src\\main\\scala\\controller\\Display.scala 38:21]
  wire  Clamp_io_isClamped; // @[\\src\\main\\scala\\controller\\Display.scala 38:21]
  wire [6:0] sseg_io_in; // @[\\src\\main\\scala\\controller\\Display.scala 61:20]
  wire [6:0] sseg_io_out; // @[\\src\\main\\scala\\controller\\Display.scala 61:20]
  reg  curMode; // @[\\src\\main\\scala\\controller\\Display.scala 21:24]
  reg [27:0] modeCnt; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
  wire  wrap_wrap = modeCnt == 28'hbebc1ff; // @[src/main/scala/chisel3/util/Counter.scala 73:24]
  wire [27:0] _wrap_value_T_1 = modeCnt + 28'h1; // @[src/main/scala/chisel3/util/Counter.scala 77:24]
  wire  _T_2 = ~curMode; // @[\\src\\main\\scala\\controller\\Display.scala 24:22]
  wire  _GEN_3 = curMode ? 1'h0 : curMode; // @[\\src\\main\\scala\\controller\\Display.scala 24:22 21:24 26:42]
  wire  _GEN_4 = ~curMode | _GEN_3; // @[\\src\\main\\scala\\controller\\Display.scala 24:22 25:43]
  reg  showTemp; // @[\\src\\main\\scala\\controller\\Display.scala 30:25]
  reg [25:0] blinkCnt; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
  wire  wrap_wrap_1 = blinkCnt == 26'h2faf07f; // @[src/main/scala/chisel3/util/Counter.scala 73:24]
  wire [25:0] _wrap_value_T_3 = blinkCnt + 26'h1; // @[src/main/scala/chisel3/util/Counter.scala 77:24]
  wire  _showTemp_T = ~showTemp; // @[\\src\\main\\scala\\controller\\Display.scala 33:19]
  wire  _GEN_9 = wrap_wrap_1 ? ~showTemp : showTemp; // @[\\src\\main\\scala\\controller\\Display.scala 32:23 33:16 30:25]
  wire [6:0] _GEN_10 = curMode ? 7'h54 : 7'h20; // @[\\src\\main\\scala\\controller\\Display.scala 41:20 47:19 37:32]
  wire [15:0] _GEN_11 = curMode ? $signed(io_targetTemp) : $signed(16'sh0); // @[\\src\\main\\scala\\controller\\Display.scala 41:20 48:15 39:28]
  wire [6:0] leadingChar = _T_2 ? 7'h43 : _GEN_10; // @[\\src\\main\\scala\\controller\\Display.scala 41:20 43:19]
  wire  _curMessage_2_T_1 = _showTemp_T & Clamp_io_isClamped; // @[\\src\\main\\scala\\controller\\Display.scala 57:34]
  wire [15:0] _curMessage_2_T_2 = Clamp_io_clampedValue / 4'ha; // @[\\src\\main\\scala\\controller\\Display.scala 57:74]
  wire [15:0] _curMessage_2_T_3 = _showTemp_T & Clamp_io_isClamped ? 16'h20 : _curMessage_2_T_2; // @[\\src\\main\\scala\\controller\\Display.scala 57:23]
  wire [15:0] _GEN_1 = Clamp_io_clampedValue % 16'ha; // @[\\src\\main\\scala\\controller\\Display.scala 58:74]
  wire [5:0] _curMessage_3_T_3 = _curMessage_2_T_1 ? 6'h20 : {{2'd0}, _GEN_1[3:0]}; // @[\\src\\main\\scala\\controller\\Display.scala 58:23]
  reg [1:0] anodeCnt; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
  wire [1:0] _wrap_value_T_5 = anodeCnt + 2'h1; // @[src/main/scala/chisel3/util/Counter.scala 77:24]
  wire [6:0] _GEN_17 = 2'h1 == anodeCnt ? 7'h3d : leadingChar; // @[\\src\\main\\scala\\controller\\Display.scala 62:{14,14}]
  wire [6:0] curMessage_2 = _curMessage_2_T_3[6:0]; // @[\\src\\main\\scala\\controller\\Display.scala 36:24 57:17]
  wire [6:0] _GEN_18 = 2'h2 == anodeCnt ? curMessage_2 : _GEN_17; // @[\\src\\main\\scala\\controller\\Display.scala 62:{14,14}]
  wire [6:0] curMessage_3 = {{1'd0}, _curMessage_3_T_3}; // @[\\src\\main\\scala\\controller\\Display.scala 36:24 58:17]
  wire [3:0] _io_an_T = 4'h1 << anodeCnt; // @[\\src\\main\\scala\\controller\\Display.scala 65:18]
  Clamp Clamp ( // @[\\src\\main\\scala\\controller\\Display.scala 38:21]
    .io_in(Clamp_io_in),
    .io_clampedValue(Clamp_io_clampedValue),
    .io_isClamped(Clamp_io_isClamped)
  );
  SSegDecoder sseg ( // @[\\src\\main\\scala\\controller\\Display.scala 61:20]
    .io_in(sseg_io_in),
    .io_out(sseg_io_out)
  );
  assign io_sseg = ~sseg_io_out; // @[\\src\\main\\scala\\controller\\Display.scala 64:14]
  assign io_an = ~_io_an_T; // @[\\src\\main\\scala\\controller\\Display.scala 65:12]
  assign Clamp_io_in = _T_2 ? $signed(io_currentTemp) : $signed(_GEN_11); // @[\\src\\main\\scala\\controller\\Display.scala 41:20 44:15]
  assign sseg_io_in = 2'h3 == anodeCnt ? curMessage_3 : _GEN_18; // @[\\src\\main\\scala\\controller\\Display.scala 62:{14,14}]
  always @(posedge clock) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\Display.scala 21:24]
      curMode <= 1'h0; // @[\\src\\main\\scala\\controller\\Display.scala 21:24]
    end else if (wrap_wrap) begin // @[\\src\\main\\scala\\controller\\Display.scala 23:22]
      curMode <= _GEN_4;
    end
    if (reset) begin // @[src/main/scala/chisel3/util/Counter.scala 61:40]
      modeCnt <= 28'h0; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
    end else if (wrap_wrap) begin // @[src/main/scala/chisel3/util/Counter.scala 87:20]
      modeCnt <= 28'h0; // @[src/main/scala/chisel3/util/Counter.scala 87:28]
    end else begin
      modeCnt <= _wrap_value_T_1; // @[src/main/scala/chisel3/util/Counter.scala 77:15]
    end
    showTemp <= reset | _GEN_9; // @[\\src\\main\\scala\\controller\\Display.scala 30:{25,25}]
    if (reset) begin // @[src/main/scala/chisel3/util/Counter.scala 61:40]
      blinkCnt <= 26'h0; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
    end else if (wrap_wrap_1) begin // @[src/main/scala/chisel3/util/Counter.scala 87:20]
      blinkCnt <= 26'h0; // @[src/main/scala/chisel3/util/Counter.scala 87:28]
    end else begin
      blinkCnt <= _wrap_value_T_3; // @[src/main/scala/chisel3/util/Counter.scala 77:15]
    end
    if (reset) begin // @[src/main/scala/chisel3/util/Counter.scala 61:40]
      anodeCnt <= 2'h0; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
    end else begin
      anodeCnt <= _wrap_value_T_5;
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
  input  [15:0] io_e, // @[\\src\\main\\scala\\controller\\PID.scala 16:14]
  output [15:0] io_response // @[\\src\\main\\scala\\controller\\PID.scala 16:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  accumulator_clock; // @[\\src\\main\\scala\\controller\\PID.scala 23:27]
  wire  accumulator_reset; // @[\\src\\main\\scala\\controller\\PID.scala 23:27]
  wire [15:0] accumulator_io_in; // @[\\src\\main\\scala\\controller\\PID.scala 23:27]
  wire [111:0] accumulator_io_out; // @[\\src\\main\\scala\\controller\\PID.scala 23:27]
  wire  accumulator_io_valid; // @[\\src\\main\\scala\\controller\\PID.scala 23:27]
  reg [15:0] lastE; // @[\\src\\main\\scala\\controller\\PID.scala 22:22]
  wire [15:0] diffE = $signed(io_e) - $signed(lastE); // @[\\src\\main\\scala\\controller\\PID.scala 29:17]
  wire [31:0] _io_response_T = 16'sh1 * $signed(io_e); // @[\\src\\main\\scala\\controller\\PID.scala 31:22]
  wire [15:0] intE = accumulator_io_out[15:0]; // @[\\src\\main\\scala\\controller\\PID.scala 19:18 28:8]
  wire [31:0] _io_response_T_1 = 16'sh1 * $signed(intE); // @[\\src\\main\\scala\\controller\\PID.scala 31:35]
  wire [31:0] _io_response_T_4 = $signed(_io_response_T) + $signed(_io_response_T_1); // @[\\src\\main\\scala\\controller\\PID.scala 31:29]
  wire [31:0] _io_response_T_5 = 16'sh1 * $signed(diffE); // @[\\src\\main\\scala\\controller\\PID.scala 31:47]
  wire [31:0] _io_response_T_8 = $signed(_io_response_T_4) + $signed(_io_response_T_5); // @[\\src\\main\\scala\\controller\\PID.scala 31:41]
  Accumulator accumulator ( // @[\\src\\main\\scala\\controller\\PID.scala 23:27]
    .clock(accumulator_clock),
    .reset(accumulator_reset),
    .io_in(accumulator_io_in),
    .io_out(accumulator_io_out),
    .io_valid(accumulator_io_valid)
  );
  assign io_response = _io_response_T_8[15:0]; // @[\\src\\main\\scala\\controller\\PID.scala 31:15]
  assign accumulator_clock = clock;
  assign accumulator_reset = reset;
  assign accumulator_io_in = io_e; // @[\\src\\main\\scala\\controller\\PID.scala 25:21]
  always @(posedge clock) begin
    lastE <= io_e; // @[\\src\\main\\scala\\controller\\PID.scala 22:22]
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
  lastE = _RAND_0[15:0];
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
  reg [15:0] cur; // @[\\src\\main\\scala\\controller\\PWM.scala 16:20]
  wire [15:0] _cur_T_2 = cur + 16'h1; // @[\\src\\main\\scala\\controller\\PWM.scala 17:40]
  wire  ready = cur == 16'h7fff; // @[\\src\\main\\scala\\controller\\PWM.scala 19:19]
  reg [15:0] in; // @[\\src\\main\\scala\\controller\\PWM.scala 21:19]
  assign io_out = cur < in; // @[\\src\\main\\scala\\controller\\PWM.scala 25:17]
  always @(posedge clock) begin
    if (reset) begin // @[\\src\\main\\scala\\controller\\PWM.scala 16:20]
      cur <= 16'h0; // @[\\src\\main\\scala\\controller\\PWM.scala 16:20]
    end else if (cur >= 16'h7fff) begin // @[\\src\\main\\scala\\controller\\PWM.scala 17:13]
      cur <= 16'h0;
    end else begin
      cur <= _cur_T_2;
    end
    if (reset) begin // @[\\src\\main\\scala\\controller\\PWM.scala 21:19]
      in <= 16'h0; // @[\\src\\main\\scala\\controller\\PWM.scala 21:19]
    end else if (ready) begin // @[\\src\\main\\scala\\controller\\PWM.scala 22:12]
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
  cur = _RAND_0[15:0];
  _RAND_1 = {1{`RANDOM}};
  in = _RAND_1[15:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Controller(
  input         clock,
  input         reset,
  input  [15:0] io_target, // @[\\src\\main\\scala\\controller\\Controller.scala 28:14]
  input  [15:0] io_cur, // @[\\src\\main\\scala\\controller\\Controller.scala 28:14]
  output        io_heatingResponse, // @[\\src\\main\\scala\\controller\\Controller.scala 28:14]
  output        io_coolingResponse, // @[\\src\\main\\scala\\controller\\Controller.scala 28:14]
  output [6:0]  io_sseg, // @[\\src\\main\\scala\\controller\\Controller.scala 28:14]
  output [3:0]  io_an // @[\\src\\main\\scala\\controller\\Controller.scala 28:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  inputSmoothener_clock; // @[\\src\\main\\scala\\controller\\Controller.scala 36:31]
  wire  inputSmoothener_reset; // @[\\src\\main\\scala\\controller\\Controller.scala 36:31]
  wire [15:0] inputSmoothener_io_in; // @[\\src\\main\\scala\\controller\\Controller.scala 36:31]
  wire [111:0] inputSmoothener_io_out; // @[\\src\\main\\scala\\controller\\Controller.scala 36:31]
  wire  inputSmoothener_io_valid; // @[\\src\\main\\scala\\controller\\Controller.scala 36:31]
  wire  display_clock; // @[\\src\\main\\scala\\controller\\Controller.scala 41:23]
  wire  display_reset; // @[\\src\\main\\scala\\controller\\Controller.scala 41:23]
  wire [15:0] display_io_currentTemp; // @[\\src\\main\\scala\\controller\\Controller.scala 41:23]
  wire [15:0] display_io_targetTemp; // @[\\src\\main\\scala\\controller\\Controller.scala 41:23]
  wire [6:0] display_io_sseg; // @[\\src\\main\\scala\\controller\\Controller.scala 41:23]
  wire [3:0] display_io_an; // @[\\src\\main\\scala\\controller\\Controller.scala 41:23]
  wire  pid_clock; // @[\\src\\main\\scala\\controller\\Controller.scala 50:19]
  wire  pid_reset; // @[\\src\\main\\scala\\controller\\Controller.scala 50:19]
  wire [15:0] pid_io_e; // @[\\src\\main\\scala\\controller\\Controller.scala 50:19]
  wire [15:0] pid_io_response; // @[\\src\\main\\scala\\controller\\Controller.scala 50:19]
  wire  heatingPWM_clock; // @[\\src\\main\\scala\\controller\\Controller.scala 59:26]
  wire  heatingPWM_reset; // @[\\src\\main\\scala\\controller\\Controller.scala 59:26]
  wire [15:0] heatingPWM_io_in; // @[\\src\\main\\scala\\controller\\Controller.scala 59:26]
  wire  heatingPWM_io_out; // @[\\src\\main\\scala\\controller\\Controller.scala 59:26]
  wire  coolingPWM_clock; // @[\\src\\main\\scala\\controller\\Controller.scala 60:26]
  wire  coolingPWM_reset; // @[\\src\\main\\scala\\controller\\Controller.scala 60:26]
  wire [15:0] coolingPWM_io_in; // @[\\src\\main\\scala\\controller\\Controller.scala 60:26]
  wire  coolingPWM_io_out; // @[\\src\\main\\scala\\controller\\Controller.scala 60:26]
  reg [15:0] target; // @[\\src\\main\\scala\\controller\\Controller.scala 30:23]
  reg [15:0] cur; // @[\\src\\main\\scala\\controller\\Controller.scala 31:20]
  wire [9:0] _inputSmoothener_io_in_T = cur[15:6]; // @[\\src\\main\\scala\\controller\\Controller.scala 37:33]
  wire [16:0] _inverseResponse_T = {1'b0,$signed(pid_io_response)}; // @[\\src\\main\\scala\\controller\\Controller.scala 57:46]
  wire [32:0] _inverseResponse_T_1 = -16'sh1 * $signed(_inverseResponse_T); // @[\\src\\main\\scala\\controller\\Controller.scala 57:46]
  wire [31:0] inverseResponse = _inverseResponse_T_1[31:0]; // @[\\src\\main\\scala\\controller\\Controller.scala 57:57]
  Accumulator inputSmoothener ( // @[\\src\\main\\scala\\controller\\Controller.scala 36:31]
    .clock(inputSmoothener_clock),
    .reset(inputSmoothener_reset),
    .io_in(inputSmoothener_io_in),
    .io_out(inputSmoothener_io_out),
    .io_valid(inputSmoothener_io_valid)
  );
  Display display ( // @[\\src\\main\\scala\\controller\\Controller.scala 41:23]
    .clock(display_clock),
    .reset(display_reset),
    .io_currentTemp(display_io_currentTemp),
    .io_targetTemp(display_io_targetTemp),
    .io_sseg(display_io_sseg),
    .io_an(display_io_an)
  );
  PID pid ( // @[\\src\\main\\scala\\controller\\Controller.scala 50:19]
    .clock(pid_clock),
    .reset(pid_reset),
    .io_e(pid_io_e),
    .io_response(pid_io_response)
  );
  PWM heatingPWM ( // @[\\src\\main\\scala\\controller\\Controller.scala 59:26]
    .clock(heatingPWM_clock),
    .reset(heatingPWM_reset),
    .io_in(heatingPWM_io_in),
    .io_out(heatingPWM_io_out)
  );
  PWM coolingPWM ( // @[\\src\\main\\scala\\controller\\Controller.scala 60:26]
    .clock(coolingPWM_clock),
    .reset(coolingPWM_reset),
    .io_in(coolingPWM_io_in),
    .io_out(coolingPWM_io_out)
  );
  assign io_heatingResponse = inputSmoothener_io_valid ? 1'h0 : $signed(pid_io_response) > 16'sh0 & heatingPWM_io_out; // @[\\src\\main\\scala\\controller\\Controller.scala 64:35 65:24 68:24]
  assign io_coolingResponse = inputSmoothener_io_valid ? 1'h0 : $signed(pid_io_response) < 16'sh0 & coolingPWM_io_out; // @[\\src\\main\\scala\\controller\\Controller.scala 64:35 66:24 69:24]
  assign io_sseg = display_io_sseg; // @[\\src\\main\\scala\\controller\\Controller.scala 44:11]
  assign io_an = display_io_an; // @[\\src\\main\\scala\\controller\\Controller.scala 45:9]
  assign inputSmoothener_clock = clock;
  assign inputSmoothener_reset = reset;
  assign inputSmoothener_io_in = {{6{_inputSmoothener_io_in_T[9]}},_inputSmoothener_io_in_T}; // @[\\src\\main\\scala\\controller\\Controller.scala 37:25]
  assign display_clock = clock;
  assign display_reset = reset;
  assign display_io_currentTemp = inputSmoothener_io_out[15:0]; // @[\\src\\main\\scala\\controller\\Controller.scala 42:26]
  assign display_io_targetTemp = target; // @[\\src\\main\\scala\\controller\\Controller.scala 43:25]
  assign pid_clock = clock;
  assign pid_reset = reset;
  assign pid_io_e = $signed(target) - $signed(cur); // @[\\src\\main\\scala\\controller\\Controller.scala 48:15]
  assign heatingPWM_clock = clock;
  assign heatingPWM_reset = reset;
  assign heatingPWM_io_in = pid_io_response; // @[\\src\\main\\scala\\controller\\Controller.scala 56:34]
  assign coolingPWM_clock = clock;
  assign coolingPWM_reset = reset;
  assign coolingPWM_io_in = inverseResponse[15:0]; // @[\\src\\main\\scala\\controller\\Controller.scala 62:20]
  always @(posedge clock) begin
    target <= io_target; // @[\\src\\main\\scala\\controller\\Controller.scala 30:23]
    cur <= io_cur; // @[\\src\\main\\scala\\controller\\Controller.scala 31:20]
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
  target = _RAND_0[15:0];
  _RAND_1 = {1{`RANDOM}};
  cur = _RAND_1[15:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
