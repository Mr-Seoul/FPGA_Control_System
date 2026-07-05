FIRRTL version 1.2.0
circuit PID :
  module SAccumulator :
    input clock : Clock
    input reset : Reset
    output io : { flip in : SInt<16>, flip clear : UInt<1>, out : SInt<64>, valid : UInt<1>} @[\\src\\main\\scala\\controller\\SAccumulator.scala 15:14]

    reg tot : SInt<64>, clock with :
      reset => (reset, asSInt(UInt<64>("h0"))) @[\\src\\main\\scala\\controller\\SAccumulator.scala 16:20]
    wire _regChain_WIRE : SInt<16>[5] @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:33]
    _regChain_WIRE[0] <= asSInt(UInt<16>("h0")) @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:33]
    _regChain_WIRE[1] <= asSInt(UInt<16>("h0")) @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:33]
    _regChain_WIRE[2] <= asSInt(UInt<16>("h0")) @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:33]
    _regChain_WIRE[3] <= asSInt(UInt<16>("h0")) @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:33]
    _regChain_WIRE[4] <= asSInt(UInt<16>("h0")) @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:33]
    reg regChain : SInt<16>[5], clock with :
      reset => (reset, _regChain_WIRE) @[\\src\\main\\scala\\controller\\SAccumulator.scala 17:25]
    reg full : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[\\src\\main\\scala\\controller\\SAccumulator.scala 19:21]
    reg cnt : UInt<3>, clock with :
      reset => (reset, UInt<3>("h0")) @[src/main/scala/chisel3/util/Counter.scala 61:40]
    wire cntWrap : UInt<1> @[src/main/scala/chisel3/util/Counter.scala 117:24]
    cntWrap <= UInt<1>("h0") @[src/main/scala/chisel3/util/Counter.scala 117:24]
    when UInt<1>("h1") : @[src/main/scala/chisel3/util/Counter.scala 118:16]
      node wrap_wrap = eq(cnt, UInt<3>("h4")) @[src/main/scala/chisel3/util/Counter.scala 73:24]
      node _wrap_value_T = add(cnt, UInt<1>("h1")) @[src/main/scala/chisel3/util/Counter.scala 77:24]
      node _wrap_value_T_1 = tail(_wrap_value_T, 1) @[src/main/scala/chisel3/util/Counter.scala 77:24]
      cnt <= _wrap_value_T_1 @[src/main/scala/chisel3/util/Counter.scala 77:15]
      when wrap_wrap : @[src/main/scala/chisel3/util/Counter.scala 87:20]
        cnt <= UInt<1>("h0") @[src/main/scala/chisel3/util/Counter.scala 87:28]
      cntWrap <= wrap_wrap @[src/main/scala/chisel3/util/Counter.scala 118:23]
    when cntWrap : @[\\src\\main\\scala\\controller\\SAccumulator.scala 21:18]
      full <= UInt<1>("h1") @[\\src\\main\\scala\\controller\\SAccumulator.scala 22:10]
    io.valid <= full @[\\src\\main\\scala\\controller\\SAccumulator.scala 24:12]
    regChain[0] <= io.in @[\\src\\main\\scala\\controller\\SAccumulator.scala 26:15]
    regChain[1] <= regChain[0] @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    regChain[2] <= regChain[1] @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    regChain[3] <= regChain[2] @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    regChain[4] <= regChain[3] @[\\src\\main\\scala\\controller\\SAccumulator.scala 28:17]
    wire diff : SInt<17> @[\\src\\main\\scala\\controller\\SAccumulator.scala 31:18]
    node _diff_T = sub(io.in, regChain[4]) @[\\src\\main\\scala\\controller\\SAccumulator.scala 32:17]
    node _diff_T_1 = tail(_diff_T, 1) @[\\src\\main\\scala\\controller\\SAccumulator.scala 32:17]
    node _diff_T_2 = asSInt(_diff_T_1) @[\\src\\main\\scala\\controller\\SAccumulator.scala 32:17]
    diff <= _diff_T_2 @[\\src\\main\\scala\\controller\\SAccumulator.scala 32:8]
    node _tot_T = add(tot, diff) @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:14]
    node _tot_T_1 = tail(_tot_T, 1) @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:14]
    node _tot_T_2 = asSInt(_tot_T_1) @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:14]
    tot <= _tot_T_2 @[\\src\\main\\scala\\controller\\SAccumulator.scala 34:7]
    io.out <= tot @[\\src\\main\\scala\\controller\\SAccumulator.scala 35:10]
    when io.clear : @[\\src\\main\\scala\\controller\\SAccumulator.scala 37:19]
      regChain[0] <= asSInt(UInt<1>("h0")) @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
      regChain[1] <= asSInt(UInt<1>("h0")) @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
      regChain[2] <= asSInt(UInt<1>("h0")) @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
      regChain[3] <= asSInt(UInt<1>("h0")) @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
      regChain[4] <= asSInt(UInt<1>("h0")) @[\\src\\main\\scala\\controller\\SAccumulator.scala 39:19]
      tot <= asSInt(UInt<1>("h0")) @[\\src\\main\\scala\\controller\\SAccumulator.scala 41:9]


  module PID :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip P : Fixed<32><<24>>, flip I : Fixed<32><<24>>, flip D : Fixed<32><<24>>, flip e : Fixed<32><<24>>, response : Fixed<32><<24>>, pResponse : Fixed<32><<24>>, iResponse : Fixed<32><<24>>, dResponse : Fixed<32><<24>>} @[\\src\\main\\scala\\controller\\PID.scala 20:14]

    wire propE : Fixed<32><<24>> @[\\src\\main\\scala\\controller\\PID.scala 22:19]
    wire intE : Fixed<32><<24>> @[\\src\\main\\scala\\controller\\PID.scala 23:18]
    wire diffE : Fixed<32><<24>> @[\\src\\main\\scala\\controller\\PID.scala 24:19]
    reg lastE : Fixed<<24>>, clock with :
      reset => (UInt<1>("h0"), lastE) @[\\src\\main\\scala\\controller\\PID.scala 26:22]
    lastE <= io.e @[\\src\\main\\scala\\controller\\PID.scala 26:22]
    inst accumulator of SAccumulator @[\\src\\main\\scala\\controller\\PID.scala 27:27]
    accumulator.clock <= clock
    accumulator.reset <= reset
    accumulator.io.clear <= UInt<1>("h0") @[\\src\\main\\scala\\controller\\PID.scala 28:24]
    node _accumulator_io_in_T = asSInt(io.e) @[\\src\\main\\scala\\controller\\PID.scala 29:29]
    accumulator.io.in <= _accumulator_io_in_T @[\\src\\main\\scala\\controller\\PID.scala 29:21]
    propE <= io.e @[\\src\\main\\scala\\controller\\PID.scala 31:9]
    node _intE_T = asFixedPoint(accumulator.io.out, 24) @[\\src\\main\\scala\\controller\\PID.scala 32:42]
    intE <= _intE_T @[\\src\\main\\scala\\controller\\PID.scala 32:8]
    node _diffE_T = sub(io.e, lastE) @[\\src\\main\\scala\\controller\\PID.scala 33:17]
    node _diffE_T_1 = tail(_diffE_T, 1) @[\\src\\main\\scala\\controller\\PID.scala 33:17]
    node _diffE_T_2 = asFixedPoint(_diffE_T_1, 24) @[\\src\\main\\scala\\controller\\PID.scala 33:17]
    diffE <= _diffE_T_2 @[\\src\\main\\scala\\controller\\PID.scala 33:9]
    reg pResponse : Fixed<32><<24>>, clock with :
      reset => (reset, asFixedPoint(UInt<32>("h0"), 24)) @[\\src\\main\\scala\\controller\\PID.scala 35:26]
    reg iResponse : Fixed<32><<24>>, clock with :
      reset => (reset, asFixedPoint(UInt<32>("h0"), 24)) @[\\src\\main\\scala\\controller\\PID.scala 36:26]
    reg dResponse : Fixed<32><<24>>, clock with :
      reset => (reset, asFixedPoint(UInt<32>("h0"), 24)) @[\\src\\main\\scala\\controller\\PID.scala 37:26]
    node _pResponse_T = mul(io.P, propE) @[\\src\\main\\scala\\controller\\PID.scala 38:20]
    pResponse <= _pResponse_T @[\\src\\main\\scala\\controller\\PID.scala 38:13]
    node _iResponse_T = mul(io.I, intE) @[\\src\\main\\scala\\controller\\PID.scala 39:20]
    iResponse <= _iResponse_T @[\\src\\main\\scala\\controller\\PID.scala 39:13]
    node _dResponse_T = mul(io.D, diffE) @[\\src\\main\\scala\\controller\\PID.scala 40:20]
    dResponse <= _dResponse_T @[\\src\\main\\scala\\controller\\PID.scala 40:13]
    io.pResponse <= pResponse @[\\src\\main\\scala\\controller\\PID.scala 41:16]
    io.iResponse <= iResponse @[\\src\\main\\scala\\controller\\PID.scala 42:16]
    io.dResponse <= dResponse @[\\src\\main\\scala\\controller\\PID.scala 43:16]
    reg res : Fixed<32><<24>>, clock with :
      reset => (reset, asFixedPoint(UInt<32>("h0"), 24)) @[\\src\\main\\scala\\controller\\PID.scala 45:20]
    node _res_T = add(pResponse, iResponse) @[\\src\\main\\scala\\controller\\PID.scala 46:20]
    node _res_T_1 = tail(_res_T, 1) @[\\src\\main\\scala\\controller\\PID.scala 46:20]
    node _res_T_2 = asFixedPoint(_res_T_1, 24) @[\\src\\main\\scala\\controller\\PID.scala 46:20]
    node _res_T_3 = add(_res_T_2, dResponse) @[\\src\\main\\scala\\controller\\PID.scala 46:32]
    node _res_T_4 = tail(_res_T_3, 1) @[\\src\\main\\scala\\controller\\PID.scala 46:32]
    node _res_T_5 = asFixedPoint(_res_T_4, 24) @[\\src\\main\\scala\\controller\\PID.scala 46:32]
    res <= _res_T_5 @[\\src\\main\\scala\\controller\\PID.scala 46:7]
    node _io_response_T = lt(res, asFixedPoint(UInt<32>("hccccd"), 24)) @[\\src\\main\\scala\\controller\\PID.scala 51:26]
    node _io_response_T_1 = gt(res, asFixedPoint(UInt<32>("hf33333"), 24)) @[\\src\\main\\scala\\controller\\PID.scala 51:62]
    node _io_response_T_2 = mux(_io_response_T_1, asFixedPoint(UInt<32>("hf33333"), 24), res) @[\\src\\main\\scala\\controller\\PID.scala 51:57]
    node _io_response_T_3 = mux(_io_response_T, asFixedPoint(UInt<32>("hccccd"), 24), _io_response_T_2) @[\\src\\main\\scala\\controller\\PID.scala 51:21]
    io.response <= _io_response_T_3 @[\\src\\main\\scala\\controller\\PID.scala 51:15]

