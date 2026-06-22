FIRRTL version 1.2.0
circuit ADCTest :
  module ADC :
    input clock : Clock
    input reset : Reset
    output io : { flip in : UInt<1>, out : UInt<8>, DACOut : UInt<8>, valid : UInt<1>} @[\\src\\main\\scala\\controller\\ADC.scala 14:14]

    reg state : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[\\src\\main\\scala\\controller\\ADC.scala 19:22]
    wire _curTest_WIRE : UInt<1>[8] @[\\src\\main\\scala\\controller\\ADC.scala 21:32]
    _curTest_WIRE[0] <= UInt<1>("h0") @[\\src\\main\\scala\\controller\\ADC.scala 21:32]
    _curTest_WIRE[1] <= UInt<1>("h0") @[\\src\\main\\scala\\controller\\ADC.scala 21:32]
    _curTest_WIRE[2] <= UInt<1>("h0") @[\\src\\main\\scala\\controller\\ADC.scala 21:32]
    _curTest_WIRE[3] <= UInt<1>("h0") @[\\src\\main\\scala\\controller\\ADC.scala 21:32]
    _curTest_WIRE[4] <= UInt<1>("h0") @[\\src\\main\\scala\\controller\\ADC.scala 21:32]
    _curTest_WIRE[5] <= UInt<1>("h0") @[\\src\\main\\scala\\controller\\ADC.scala 21:32]
    _curTest_WIRE[6] <= UInt<1>("h0") @[\\src\\main\\scala\\controller\\ADC.scala 21:32]
    _curTest_WIRE[7] <= UInt<1>("h0") @[\\src\\main\\scala\\controller\\ADC.scala 21:32]
    reg curTest : UInt<1>[8], clock with :
      reset => (reset, _curTest_WIRE) @[\\src\\main\\scala\\controller\\ADC.scala 21:24]
    node io_DACOut_lo_lo = cat(curTest[1], curTest[0]) @[\\src\\main\\scala\\controller\\ADC.scala 22:24]
    node io_DACOut_lo_hi = cat(curTest[3], curTest[2]) @[\\src\\main\\scala\\controller\\ADC.scala 22:24]
    node io_DACOut_lo = cat(io_DACOut_lo_hi, io_DACOut_lo_lo) @[\\src\\main\\scala\\controller\\ADC.scala 22:24]
    node io_DACOut_hi_lo = cat(curTest[5], curTest[4]) @[\\src\\main\\scala\\controller\\ADC.scala 22:24]
    node io_DACOut_hi_hi = cat(curTest[7], curTest[6]) @[\\src\\main\\scala\\controller\\ADC.scala 22:24]
    node io_DACOut_hi = cat(io_DACOut_hi_hi, io_DACOut_hi_lo) @[\\src\\main\\scala\\controller\\ADC.scala 22:24]
    node _io_DACOut_T = cat(io_DACOut_hi, io_DACOut_lo) @[\\src\\main\\scala\\controller\\ADC.scala 22:24]
    node _io_DACOut_T_1 = sub(_io_DACOut_T, UInt<1>("h1")) @[\\src\\main\\scala\\controller\\ADC.scala 22:31]
    node _io_DACOut_T_2 = tail(_io_DACOut_T_1, 1) @[\\src\\main\\scala\\controller\\ADC.scala 22:31]
    io.DACOut <= _io_DACOut_T_2 @[\\src\\main\\scala\\controller\\ADC.scala 22:13]
    wire incBit : UInt<1> @[\\src\\main\\scala\\controller\\ADC.scala 23:20]
    incBit <= UInt<1>("h0") @[\\src\\main\\scala\\controller\\ADC.scala 24:10]
    node _T = eq(state, UInt<2>("h0")) @[\\src\\main\\scala\\controller\\ADC.scala 26:46]
    reg sampleCnt : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[src/main/scala/chisel3/util/Counter.scala 61:40]
    wire sampleWrap : UInt<1> @[src/main/scala/chisel3/util/Counter.scala 117:24]
    sampleWrap <= UInt<1>("h0") @[src/main/scala/chisel3/util/Counter.scala 117:24]
    when _T : @[src/main/scala/chisel3/util/Counter.scala 118:16]
      node wrap_wrap = eq(sampleCnt, UInt<8>("hf9")) @[src/main/scala/chisel3/util/Counter.scala 73:24]
      node _wrap_value_T = add(sampleCnt, UInt<1>("h1")) @[src/main/scala/chisel3/util/Counter.scala 77:24]
      node _wrap_value_T_1 = tail(_wrap_value_T, 1) @[src/main/scala/chisel3/util/Counter.scala 77:24]
      sampleCnt <= _wrap_value_T_1 @[src/main/scala/chisel3/util/Counter.scala 77:15]
      when wrap_wrap : @[src/main/scala/chisel3/util/Counter.scala 87:20]
        sampleCnt <= UInt<1>("h0") @[src/main/scala/chisel3/util/Counter.scala 87:28]
      sampleWrap <= wrap_wrap @[src/main/scala/chisel3/util/Counter.scala 118:23]
    reg bitCnt : UInt<3>, clock with :
      reset => (reset, UInt<3>("h0")) @[src/main/scala/chisel3/util/Counter.scala 61:40]
    wire bitWrap : UInt<1> @[src/main/scala/chisel3/util/Counter.scala 117:24]
    bitWrap <= UInt<1>("h0") @[src/main/scala/chisel3/util/Counter.scala 117:24]
    when incBit : @[src/main/scala/chisel3/util/Counter.scala 118:16]
      node wrap_wrap_1 = eq(bitCnt, UInt<3>("h7")) @[src/main/scala/chisel3/util/Counter.scala 73:24]
      node _wrap_value_T_2 = add(bitCnt, UInt<1>("h1")) @[src/main/scala/chisel3/util/Counter.scala 77:24]
      node _wrap_value_T_3 = tail(_wrap_value_T_2, 1) @[src/main/scala/chisel3/util/Counter.scala 77:24]
      bitCnt <= _wrap_value_T_3 @[src/main/scala/chisel3/util/Counter.scala 77:15]
      bitWrap <= wrap_wrap_1 @[src/main/scala/chisel3/util/Counter.scala 118:23]
    reg regOutput : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[\\src\\main\\scala\\controller\\ADC.scala 28:26]
    reg validOut : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[\\src\\main\\scala\\controller\\ADC.scala 29:25]
    validOut <= UInt<1>("h0") @[\\src\\main\\scala\\controller\\ADC.scala 30:12]
    node _T_1 = eq(UInt<2>("h0"), state) @[\\src\\main\\scala\\controller\\ADC.scala 32:17]
    when _T_1 : @[\\src\\main\\scala\\controller\\ADC.scala 32:17]
      when sampleWrap : @[\\src\\main\\scala\\controller\\ADC.scala 34:24]
        state <= UInt<2>("h1") @[\\src\\main\\scala\\controller\\ADC.scala 35:15]
        node _T_2 = sub(UInt<3>("h7"), bitCnt) @[\\src\\main\\scala\\controller\\ADC.scala 36:25]
        node _T_3 = tail(_T_2, 1) @[\\src\\main\\scala\\controller\\ADC.scala 36:25]
        curTest[_T_3] <= io.in @[\\src\\main\\scala\\controller\\ADC.scala 36:35]
      else :
        node _T_4 = sub(UInt<3>("h7"), bitCnt) @[\\src\\main\\scala\\controller\\ADC.scala 38:25]
        node _T_5 = tail(_T_4, 1) @[\\src\\main\\scala\\controller\\ADC.scala 38:25]
        curTest[_T_5] <= UInt<1>("h1") @[\\src\\main\\scala\\controller\\ADC.scala 38:35]
    else :
      node _T_6 = eq(UInt<2>("h1"), state) @[\\src\\main\\scala\\controller\\ADC.scala 32:17]
      when _T_6 : @[\\src\\main\\scala\\controller\\ADC.scala 32:17]
        incBit <= UInt<1>("h1") @[\\src\\main\\scala\\controller\\ADC.scala 43:14]
        node _T_7 = eq(bitCnt, UInt<3>("h7")) @[\\src\\main\\scala\\controller\\ADC.scala 44:20]
        when _T_7 : @[\\src\\main\\scala\\controller\\ADC.scala 44:33]
          state <= UInt<2>("h2") @[\\src\\main\\scala\\controller\\ADC.scala 45:15]
        else :
          state <= UInt<2>("h0") @[\\src\\main\\scala\\controller\\ADC.scala 47:15]
      else :
        node _T_8 = eq(UInt<2>("h2"), state) @[\\src\\main\\scala\\controller\\ADC.scala 32:17]
        when _T_8 : @[\\src\\main\\scala\\controller\\ADC.scala 32:17]
          state <= UInt<2>("h0") @[\\src\\main\\scala\\controller\\ADC.scala 52:13]
          bitCnt <= UInt<1>("h0") @[\\src\\main\\scala\\controller\\ADC.scala 53:14]
          node regOutput_lo_lo = cat(curTest[1], curTest[0]) @[\\src\\main\\scala\\controller\\ADC.scala 54:28]
          node regOutput_lo_hi = cat(curTest[3], curTest[2]) @[\\src\\main\\scala\\controller\\ADC.scala 54:28]
          node regOutput_lo = cat(regOutput_lo_hi, regOutput_lo_lo) @[\\src\\main\\scala\\controller\\ADC.scala 54:28]
          node regOutput_hi_lo = cat(curTest[5], curTest[4]) @[\\src\\main\\scala\\controller\\ADC.scala 54:28]
          node regOutput_hi_hi = cat(curTest[7], curTest[6]) @[\\src\\main\\scala\\controller\\ADC.scala 54:28]
          node regOutput_hi = cat(regOutput_hi_hi, regOutput_hi_lo) @[\\src\\main\\scala\\controller\\ADC.scala 54:28]
          node _regOutput_T = cat(regOutput_hi, regOutput_lo) @[\\src\\main\\scala\\controller\\ADC.scala 54:28]
          regOutput <= _regOutput_T @[\\src\\main\\scala\\controller\\ADC.scala 54:17]
          curTest[0] <= UInt<1>("h0") @[\\src\\main\\scala\\controller\\ADC.scala 55:15]
          curTest[1] <= UInt<1>("h0") @[\\src\\main\\scala\\controller\\ADC.scala 55:15]
          curTest[2] <= UInt<1>("h0") @[\\src\\main\\scala\\controller\\ADC.scala 55:15]
          curTest[3] <= UInt<1>("h0") @[\\src\\main\\scala\\controller\\ADC.scala 55:15]
          curTest[4] <= UInt<1>("h0") @[\\src\\main\\scala\\controller\\ADC.scala 55:15]
          curTest[5] <= UInt<1>("h0") @[\\src\\main\\scala\\controller\\ADC.scala 55:15]
          curTest[6] <= UInt<1>("h0") @[\\src\\main\\scala\\controller\\ADC.scala 55:15]
          curTest[7] <= UInt<1>("h0") @[\\src\\main\\scala\\controller\\ADC.scala 55:15]
          validOut <= UInt<1>("h1") @[\\src\\main\\scala\\controller\\ADC.scala 56:16]
    io.valid <= validOut @[\\src\\main\\scala\\controller\\ADC.scala 60:12]
    io.out <= regOutput @[\\src\\main\\scala\\controller\\ADC.scala 61:10]

  module ADCTest :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip in : UInt<1>, out : UInt<8>, DACOut : UInt<8>, valid : UInt<1>} @[\\src\\main\\scala\\controller\\ADCTest.scala 7:14]

    reg synchedReset_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), synchedReset_REG) @[\\src\\main\\scala\\controller\\ADCTest.scala 9:37]
    synchedReset_REG <= reset @[\\src\\main\\scala\\controller\\ADCTest.scala 9:37]
    reg synchedReset : UInt<1>, clock with :
      reset => (UInt<1>("h0"), synchedReset) @[\\src\\main\\scala\\controller\\ADCTest.scala 9:29]
    synchedReset <= synchedReset_REG @[\\src\\main\\scala\\controller\\ADCTest.scala 9:29]
    node _T = asAsyncReset(synchedReset) @[\\src\\main\\scala\\controller\\ADCTest.scala 10:26]
    reg in_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), in_REG) @[\\src\\main\\scala\\controller\\ADCTest.scala 11:29]
    in_REG <= io.in @[\\src\\main\\scala\\controller\\ADCTest.scala 11:29]
    reg in : UInt<1>, clock with :
      reset => (UInt<1>("h0"), in) @[\\src\\main\\scala\\controller\\ADCTest.scala 11:21]
    in <= in_REG @[\\src\\main\\scala\\controller\\ADCTest.scala 11:21]
    inst ADC of ADC @[\\src\\main\\scala\\controller\\ADCTest.scala 13:21]
    ADC.clock <= clock
    ADC.reset <= _T
    reg out : UInt<8>, clock with :
      reset => (_T, UInt<8>("h0")) @[\\src\\main\\scala\\controller\\ADCTest.scala 14:22]
    reg updateCNT : UInt<27>, clock with :
      reset => (_T, UInt<27>("h0")) @[src/main/scala/chisel3/util/Counter.scala 61:40]
    wire updateWrap : UInt<1> @[src/main/scala/chisel3/util/Counter.scala 117:24]
    updateWrap <= UInt<1>("h0") @[src/main/scala/chisel3/util/Counter.scala 117:24]
    when UInt<1>("h1") : @[src/main/scala/chisel3/util/Counter.scala 118:16]
      node wrap_wrap = eq(updateCNT, UInt<27>("h5f5e0ff")) @[src/main/scala/chisel3/util/Counter.scala 73:24]
      node _wrap_value_T = add(updateCNT, UInt<1>("h1")) @[src/main/scala/chisel3/util/Counter.scala 77:24]
      node _wrap_value_T_1 = tail(_wrap_value_T, 1) @[src/main/scala/chisel3/util/Counter.scala 77:24]
      updateCNT <= _wrap_value_T_1 @[src/main/scala/chisel3/util/Counter.scala 77:15]
      when wrap_wrap : @[src/main/scala/chisel3/util/Counter.scala 87:20]
        updateCNT <= UInt<1>("h0") @[src/main/scala/chisel3/util/Counter.scala 87:28]
      updateWrap <= wrap_wrap @[src/main/scala/chisel3/util/Counter.scala 118:23]
    node _out_T = mux(updateWrap, ADC.io.out, out) @[\\src\\main\\scala\\controller\\ADCTest.scala 16:15]
    out <= _out_T @[\\src\\main\\scala\\controller\\ADCTest.scala 16:9]
    ADC.io.in <= in @[\\src\\main\\scala\\controller\\ADCTest.scala 17:15]
    io.out <= out @[\\src\\main\\scala\\controller\\ADCTest.scala 18:12]
    io.DACOut <= ADC.io.DACOut @[\\src\\main\\scala\\controller\\ADCTest.scala 19:15]
    io.valid <= ADC.io.valid @[\\src\\main\\scala\\controller\\ADCTest.scala 20:14]

