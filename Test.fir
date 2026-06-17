FIRRTL version 1.2.0
circuit Test :
  module Test :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip in : UInt<8>, out : UInt<8>} @[\\src\\main\\scala\\controller\\Test.scala 12:14]

    reg in_REG : UInt, clock with :
      reset => (UInt<1>("h0"), in_REG) @[\\src\\main\\scala\\controller\\Test.scala 13:27]
    in_REG <= io.in @[\\src\\main\\scala\\controller\\Test.scala 13:27]
    reg in : UInt, clock with :
      reset => (UInt<1>("h0"), in) @[\\src\\main\\scala\\controller\\Test.scala 13:19]
    in <= in_REG @[\\src\\main\\scala\\controller\\Test.scala 13:19]
    io.out <= in @[\\src\\main\\scala\\controller\\Test.scala 14:10]

