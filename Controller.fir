FIRRTL version 1.2.0
circuit Controller :
  module Clamp :
    input clock : Clock
    input reset : Reset
    output io : { flip in : SInt<16>, clampedValue : SInt<16>, isClamped : UInt<1>} @[\\src\\main\\scala\\controller\\Clamp.scala 14:14]

    node _io_clampedValue_T = lt(io.in, asSInt(UInt<1>("h0"))) @[\\src\\main\\scala\\controller\\Clamp.scala 16:32]
    node _io_clampedValue_T_1 = gt(io.in, asSInt(UInt<8>("h63"))) @[\\src\\main\\scala\\controller\\Clamp.scala 16:58]
    node _io_clampedValue_T_2 = mux(_io_clampedValue_T_1, asSInt(UInt<8>("h63")), io.in) @[\\src\\main\\scala\\controller\\Clamp.scala 16:51]
    node _io_clampedValue_T_3 = mux(_io_clampedValue_T, asSInt(UInt<1>("h0")), _io_clampedValue_T_2) @[\\src\\main\\scala\\controller\\Clamp.scala 16:25]
    io.clampedValue <= _io_clampedValue_T_3 @[\\src\\main\\scala\\controller\\Clamp.scala 16:19]
    node _io_isClamped_T = lt(io.in, asSInt(UInt<1>("h0"))) @[\\src\\main\\scala\\controller\\Clamp.scala 17:25]
    node _io_isClamped_T_1 = gt(io.in, asSInt(UInt<8>("h63"))) @[\\src\\main\\scala\\controller\\Clamp.scala 17:42]
    node _io_isClamped_T_2 = or(_io_isClamped_T, _io_isClamped_T_1) @[\\src\\main\\scala\\controller\\Clamp.scala 17:33]
    io.isClamped <= _io_isClamped_T_2 @[\\src\\main\\scala\\controller\\Clamp.scala 17:16]

  module SSegDecoder :
    input clock : Clock
    input reset : Reset
    output io : { flip in : UInt<7>, out : UInt<7>} @[\\src\\main\\scala\\controller\\SSegDecoder.scala 12:14]

    wire sevSeg : UInt<7> @[\\src\\main\\scala\\controller\\SSegDecoder.scala 14:27]
    sevSeg <= UInt<7>("h0") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 14:27]
    node _T = eq(UInt<6>("h20"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
    when _T : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
      sevSeg <= UInt<1>("h0") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 17:23]
    else :
      node _T_1 = eq(UInt<6>("h30"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
      when _T_1 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
        sevSeg <= UInt<6>("h3f") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 19:23]
      else :
        node _T_2 = eq(UInt<6>("h31"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
        when _T_2 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
          sevSeg <= UInt<3>("h6") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 20:23]
        else :
          node _T_3 = eq(UInt<6>("h32"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
          when _T_3 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
            sevSeg <= UInt<7>("h5b") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 21:23]
          else :
            node _T_4 = eq(UInt<6>("h33"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
            when _T_4 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
              sevSeg <= UInt<7>("h4f") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 22:23]
            else :
              node _T_5 = eq(UInt<6>("h34"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
              when _T_5 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                sevSeg <= UInt<7>("h66") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 23:23]
              else :
                node _T_6 = eq(UInt<6>("h35"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                when _T_6 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                  sevSeg <= UInt<7>("h6d") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 24:23]
                else :
                  node _T_7 = eq(UInt<6>("h36"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                  when _T_7 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                    sevSeg <= UInt<7>("h7d") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 25:23]
                  else :
                    node _T_8 = eq(UInt<6>("h37"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                    when _T_8 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                      sevSeg <= UInt<3>("h7") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 26:23]
                    else :
                      node _T_9 = eq(UInt<6>("h38"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                      when _T_9 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                        sevSeg <= UInt<7>("h7f") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 27:23]
                      else :
                        node _T_10 = eq(UInt<6>("h39"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                        when _T_10 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                          sevSeg <= UInt<7>("h6f") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 28:23]
                        else :
                          node _T_11 = eq(UInt<6>("h3d"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                          when _T_11 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                            sevSeg <= UInt<7>("h6f") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 30:23]
                          else :
                            node _T_12 = eq(UInt<7>("h41"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                            when _T_12 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                              sevSeg <= UInt<7>("h77") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 32:23]
                            else :
                              node _T_13 = eq(UInt<7>("h42"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                              when _T_13 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                sevSeg <= UInt<7>("h7c") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 33:23]
                              else :
                                node _T_14 = eq(UInt<7>("h43"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                when _T_14 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                  sevSeg <= UInt<6>("h39") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 34:23]
                                else :
                                  node _T_15 = eq(UInt<7>("h44"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                  when _T_15 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                    sevSeg <= UInt<7>("h5e") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 35:23]
                                  else :
                                    node _T_16 = eq(UInt<7>("h45"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                    when _T_16 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                      sevSeg <= UInt<7>("h79") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 36:23]
                                    else :
                                      node _T_17 = eq(UInt<7>("h46"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                      when _T_17 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                        sevSeg <= UInt<7>("h71") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 37:23]
                                      else :
                                        node _T_18 = eq(UInt<7>("h47"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                        when _T_18 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                          sevSeg <= UInt<6>("h3d") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 38:23]
                                        else :
                                          node _T_19 = eq(UInt<7>("h48"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                          when _T_19 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                            sevSeg <= UInt<7>("h76") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 39:23]
                                          else :
                                            node _T_20 = eq(UInt<7>("h49"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                            when _T_20 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                              sevSeg <= UInt<3>("h6") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 40:23]
                                            else :
                                              node _T_21 = eq(UInt<7>("h4a"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                              when _T_21 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                sevSeg <= UInt<4>("he") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 41:23]
                                              else :
                                                node _T_22 = eq(UInt<7>("h4b"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                when _T_22 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                  sevSeg <= UInt<7>("h75") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 42:23]
                                                else :
                                                  node _T_23 = eq(UInt<7>("h4c"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                  when _T_23 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                    sevSeg <= UInt<6>("h38") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 43:23]
                                                  else :
                                                    node _T_24 = eq(UInt<7>("h4d"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                    when _T_24 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                      sevSeg <= UInt<6>("h37") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 44:23]
                                                    else :
                                                      node _T_25 = eq(UInt<7>("h4e"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                      when _T_25 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                        sevSeg <= UInt<6>("h37") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 45:23]
                                                      else :
                                                        node _T_26 = eq(UInt<7>("h4f"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                        when _T_26 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                          sevSeg <= UInt<6>("h3f") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 46:23]
                                                        else :
                                                          node _T_27 = eq(UInt<7>("h50"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                          when _T_27 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                            sevSeg <= UInt<7>("h73") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 47:23]
                                                          else :
                                                            node _T_28 = eq(UInt<7>("h51"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                            when _T_28 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                              sevSeg <= UInt<7>("h67") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 48:23]
                                                            else :
                                                              node _T_29 = eq(UInt<7>("h52"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                              when _T_29 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                sevSeg <= UInt<7>("h50") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 49:23]
                                                              else :
                                                                node _T_30 = eq(UInt<7>("h53"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                when _T_30 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                  sevSeg <= UInt<7>("h6d") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 50:23]
                                                                else :
                                                                  node _T_31 = eq(UInt<7>("h54"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                  when _T_31 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                    sevSeg <= UInt<7>("h78") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 51:23]
                                                                  else :
                                                                    node _T_32 = eq(UInt<7>("h55"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                    when _T_32 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                      sevSeg <= UInt<6>("h3e") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 52:23]
                                                                    else :
                                                                      node _T_33 = eq(UInt<7>("h56"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                      when _T_33 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                        sevSeg <= UInt<5>("h1c") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 53:23]
                                                                      else :
                                                                        node _T_34 = eq(UInt<7>("h57"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                        when _T_34 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                          sevSeg <= UInt<6>("h3e") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 54:23]
                                                                        else :
                                                                          node _T_35 = eq(UInt<7>("h58"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                          when _T_35 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                            sevSeg <= UInt<7>("h76") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 55:23]
                                                                          else :
                                                                            node _T_36 = eq(UInt<7>("h59"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                            when _T_36 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                              sevSeg <= UInt<7>("h6e") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 56:23]
                                                                            else :
                                                                              node _T_37 = eq(UInt<7>("h5a"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                              when _T_37 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                sevSeg <= UInt<7>("h5b") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 57:23]
                                                                              else :
                                                                                node _T_38 = eq(UInt<7>("h61"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                when _T_38 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                  sevSeg <= UInt<7>("h5f") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 59:24]
                                                                                else :
                                                                                  node _T_39 = eq(UInt<7>("h62"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                  when _T_39 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                    sevSeg <= UInt<7>("h7c") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 60:24]
                                                                                  else :
                                                                                    node _T_40 = eq(UInt<7>("h63"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                    when _T_40 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                      sevSeg <= UInt<7>("h58") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 61:24]
                                                                                    else :
                                                                                      node _T_41 = eq(UInt<7>("h64"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                      when _T_41 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                        sevSeg <= UInt<7>("h5e") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 62:24]
                                                                                      else :
                                                                                        node _T_42 = eq(UInt<7>("h65"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                        when _T_42 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                          sevSeg <= UInt<7>("h7b") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 63:24]
                                                                                        else :
                                                                                          node _T_43 = eq(UInt<7>("h66"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                          when _T_43 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                            sevSeg <= UInt<7>("h71") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 64:24]
                                                                                          else :
                                                                                            node _T_44 = eq(UInt<7>("h67"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                            when _T_44 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                              sevSeg <= UInt<7>("h6f") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 65:24]
                                                                                            else :
                                                                                              node _T_45 = eq(UInt<7>("h68"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                              when _T_45 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                                sevSeg <= UInt<7>("h74") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 66:24]
                                                                                              else :
                                                                                                node _T_46 = eq(UInt<7>("h69"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                                when _T_46 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                                  sevSeg <= UInt<3>("h4") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 67:24]
                                                                                                else :
                                                                                                  node _T_47 = eq(UInt<7>("h6a"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                                  when _T_47 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                                    sevSeg <= UInt<4>("hc") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 68:24]
                                                                                                  else :
                                                                                                    node _T_48 = eq(UInt<7>("h6b"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                                    when _T_48 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                                      sevSeg <= UInt<7>("h75") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 69:24]
                                                                                                    else :
                                                                                                      node _T_49 = eq(UInt<7>("h6c"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                                      when _T_49 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                                        sevSeg <= UInt<5>("h18") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 70:24]
                                                                                                      else :
                                                                                                        node _T_50 = eq(UInt<7>("h6d"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                                        when _T_50 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                                          sevSeg <= UInt<6>("h37") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 71:24]
                                                                                                        else :
                                                                                                          node _T_51 = eq(UInt<7>("h6e"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                                          when _T_51 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                                            sevSeg <= UInt<7>("h54") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 72:24]
                                                                                                          else :
                                                                                                            node _T_52 = eq(UInt<7>("h6f"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                                            when _T_52 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                                              sevSeg <= UInt<7>("h5c") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 73:24]
                                                                                                            else :
                                                                                                              node _T_53 = eq(UInt<7>("h70"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                                              when _T_53 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                                                sevSeg <= UInt<7>("h73") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 74:24]
                                                                                                              else :
                                                                                                                node _T_54 = eq(UInt<7>("h71"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                                                when _T_54 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                                                  sevSeg <= UInt<7>("h67") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 75:24]
                                                                                                                else :
                                                                                                                  node _T_55 = eq(UInt<7>("h72"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                                                  when _T_55 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                                                    sevSeg <= UInt<7>("h50") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 76:24]
                                                                                                                  else :
                                                                                                                    node _T_56 = eq(UInt<7>("h73"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                                                    when _T_56 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                                                      sevSeg <= UInt<7>("h6d") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 77:24]
                                                                                                                    else :
                                                                                                                      node _T_57 = eq(UInt<7>("h74"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                                                      when _T_57 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                                                        sevSeg <= UInt<7>("h78") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 78:24]
                                                                                                                      else :
                                                                                                                        node _T_58 = eq(UInt<7>("h75"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                                                        when _T_58 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                                                          sevSeg <= UInt<5>("h1c") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 79:24]
                                                                                                                        else :
                                                                                                                          node _T_59 = eq(UInt<7>("h76"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                                                          when _T_59 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                                                            sevSeg <= UInt<5>("h1c") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 80:24]
                                                                                                                          else :
                                                                                                                            node _T_60 = eq(UInt<7>("h77"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                                                            when _T_60 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                                                              sevSeg <= UInt<7>("h76") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 81:24]
                                                                                                                            else :
                                                                                                                              node _T_61 = eq(UInt<7>("h78"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                                                              when _T_61 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                                                                sevSeg <= UInt<7>("h6e") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 82:24]
                                                                                                                              else :
                                                                                                                                node _T_62 = eq(UInt<7>("h79"), io.in) @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                                                                when _T_62 : @[\\src\\main\\scala\\controller\\SSegDecoder.scala 16:17]
                                                                                                                                  sevSeg <= UInt<7>("h5b") @[\\src\\main\\scala\\controller\\SSegDecoder.scala 83:24]
    io.out <= sevSeg @[\\src\\main\\scala\\controller\\SSegDecoder.scala 86:10]

  module Display :
    input clock : Clock
    input reset : Reset
    output io : { flip currentTemp : SInt<16>, flip targetTemp : SInt<16>, sseg : UInt<7>, an : UInt<4>} @[\\src\\main\\scala\\controller\\Display.scala 20:14]

    reg curMode : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[\\src\\main\\scala\\controller\\Display.scala 22:24]
    reg modeCnt : UInt<28>, clock with :
      reset => (reset, UInt<28>("h0")) @[src/main/scala/chisel3/util/Counter.scala 61:40]
    wire modeCntWrap : UInt<1> @[src/main/scala/chisel3/util/Counter.scala 117:24]
    modeCntWrap <= UInt<1>("h0") @[src/main/scala/chisel3/util/Counter.scala 117:24]
    when UInt<1>("h1") : @[src/main/scala/chisel3/util/Counter.scala 118:16]
      node wrap_wrap = eq(modeCnt, UInt<28>("hbebc1ff")) @[src/main/scala/chisel3/util/Counter.scala 73:24]
      node _wrap_value_T = add(modeCnt, UInt<1>("h1")) @[src/main/scala/chisel3/util/Counter.scala 77:24]
      node _wrap_value_T_1 = tail(_wrap_value_T, 1) @[src/main/scala/chisel3/util/Counter.scala 77:24]
      modeCnt <= _wrap_value_T_1 @[src/main/scala/chisel3/util/Counter.scala 77:15]
      when wrap_wrap : @[src/main/scala/chisel3/util/Counter.scala 87:20]
        modeCnt <= UInt<1>("h0") @[src/main/scala/chisel3/util/Counter.scala 87:28]
      modeCntWrap <= wrap_wrap @[src/main/scala/chisel3/util/Counter.scala 118:23]
    when modeCntWrap : @[\\src\\main\\scala\\controller\\Display.scala 24:22]
      node _T = asUInt(UInt<1>("h0")) @[\\src\\main\\scala\\controller\\Display.scala 25:22]
      node _T_1 = asUInt(curMode) @[\\src\\main\\scala\\controller\\Display.scala 25:22]
      node _T_2 = eq(_T, _T_1) @[\\src\\main\\scala\\controller\\Display.scala 25:22]
      when _T_2 : @[\\src\\main\\scala\\controller\\Display.scala 25:22]
        curMode <= UInt<1>("h1") @[\\src\\main\\scala\\controller\\Display.scala 26:43]
      else :
        node _T_3 = asUInt(UInt<1>("h1")) @[\\src\\main\\scala\\controller\\Display.scala 25:22]
        node _T_4 = asUInt(curMode) @[\\src\\main\\scala\\controller\\Display.scala 25:22]
        node _T_5 = eq(_T_3, _T_4) @[\\src\\main\\scala\\controller\\Display.scala 25:22]
        when _T_5 : @[\\src\\main\\scala\\controller\\Display.scala 25:22]
          curMode <= UInt<1>("h0") @[\\src\\main\\scala\\controller\\Display.scala 27:42]
    reg showTemp : UInt<1>, clock with :
      reset => (reset, UInt<1>("h1")) @[\\src\\main\\scala\\controller\\Display.scala 31:25]
    reg blinkCnt : UInt<26>, clock with :
      reset => (reset, UInt<26>("h0")) @[src/main/scala/chisel3/util/Counter.scala 61:40]
    wire blinkCntWrap : UInt<1> @[src/main/scala/chisel3/util/Counter.scala 117:24]
    blinkCntWrap <= UInt<1>("h0") @[src/main/scala/chisel3/util/Counter.scala 117:24]
    when UInt<1>("h1") : @[src/main/scala/chisel3/util/Counter.scala 118:16]
      node wrap_wrap_1 = eq(blinkCnt, UInt<26>("h2faf07f")) @[src/main/scala/chisel3/util/Counter.scala 73:24]
      node _wrap_value_T_2 = add(blinkCnt, UInt<1>("h1")) @[src/main/scala/chisel3/util/Counter.scala 77:24]
      node _wrap_value_T_3 = tail(_wrap_value_T_2, 1) @[src/main/scala/chisel3/util/Counter.scala 77:24]
      blinkCnt <= _wrap_value_T_3 @[src/main/scala/chisel3/util/Counter.scala 77:15]
      when wrap_wrap_1 : @[src/main/scala/chisel3/util/Counter.scala 87:20]
        blinkCnt <= UInt<1>("h0") @[src/main/scala/chisel3/util/Counter.scala 87:28]
      blinkCntWrap <= wrap_wrap_1 @[src/main/scala/chisel3/util/Counter.scala 118:23]
    when blinkCntWrap : @[\\src\\main\\scala\\controller\\Display.scala 33:23]
      node _showTemp_T = not(showTemp) @[\\src\\main\\scala\\controller\\Display.scala 34:19]
      showTemp <= _showTemp_T @[\\src\\main\\scala\\controller\\Display.scala 34:16]
    wire curMessage : UInt<7>[4] @[\\src\\main\\scala\\controller\\Display.scala 37:24]
    wire leadingChar : UInt<7> @[\\src\\main\\scala\\controller\\Display.scala 38:32]
    leadingChar <= UInt<7>("h20") @[\\src\\main\\scala\\controller\\Display.scala 38:32]
    inst Clamp of Clamp @[\\src\\main\\scala\\controller\\Display.scala 39:21]
    Clamp.clock <= clock
    Clamp.reset <= reset
    wire clampIn : SInt<16> @[\\src\\main\\scala\\controller\\Display.scala 40:28]
    clampIn <= asSInt(UInt<16>("h0")) @[\\src\\main\\scala\\controller\\Display.scala 40:28]
    node _T_6 = asUInt(UInt<1>("h0")) @[\\src\\main\\scala\\controller\\Display.scala 42:20]
    node _T_7 = asUInt(curMode) @[\\src\\main\\scala\\controller\\Display.scala 42:20]
    node _T_8 = eq(_T_6, _T_7) @[\\src\\main\\scala\\controller\\Display.scala 42:20]
    when _T_8 : @[\\src\\main\\scala\\controller\\Display.scala 42:20]
      leadingChar <= UInt<7>("h43") @[\\src\\main\\scala\\controller\\Display.scala 44:19]
      clampIn <= io.currentTemp @[\\src\\main\\scala\\controller\\Display.scala 45:15]
    else :
      node _T_9 = asUInt(UInt<1>("h1")) @[\\src\\main\\scala\\controller\\Display.scala 42:20]
      node _T_10 = asUInt(curMode) @[\\src\\main\\scala\\controller\\Display.scala 42:20]
      node _T_11 = eq(_T_9, _T_10) @[\\src\\main\\scala\\controller\\Display.scala 42:20]
      when _T_11 : @[\\src\\main\\scala\\controller\\Display.scala 42:20]
        leadingChar <= UInt<7>("h54") @[\\src\\main\\scala\\controller\\Display.scala 48:19]
        clampIn <= io.targetTemp @[\\src\\main\\scala\\controller\\Display.scala 49:15]
    Clamp.io.in <= clampIn @[\\src\\main\\scala\\controller\\Display.scala 53:15]
    node curNumber = asUInt(Clamp.io.clampedValue) @[\\src\\main\\scala\\controller\\Display.scala 54:41]
    curMessage[0] <= leadingChar @[\\src\\main\\scala\\controller\\Display.scala 56:17]
    curMessage[1] <= UInt<6>("h3d") @[\\src\\main\\scala\\controller\\Display.scala 57:17]
    node _curMessage_2_T = and(showTemp, Clamp.io.isClamped) @[\\src\\main\\scala\\controller\\Display.scala 58:33]
    node _curMessage_2_T_1 = div(curNumber, UInt<4>("ha")) @[\\src\\main\\scala\\controller\\Display.scala 58:72]
    node _curMessage_2_T_2 = mux(_curMessage_2_T, UInt<6>("h20"), _curMessage_2_T_1) @[\\src\\main\\scala\\controller\\Display.scala 58:23]
    curMessage[2] <= _curMessage_2_T_2 @[\\src\\main\\scala\\controller\\Display.scala 58:17]
    node _curMessage_3_T = and(showTemp, Clamp.io.isClamped) @[\\src\\main\\scala\\controller\\Display.scala 59:33]
    node _curMessage_3_T_1 = rem(curNumber, UInt<4>("ha")) @[\\src\\main\\scala\\controller\\Display.scala 59:72]
    node _curMessage_3_T_2 = mux(_curMessage_3_T, UInt<6>("h20"), _curMessage_3_T_1) @[\\src\\main\\scala\\controller\\Display.scala 59:23]
    curMessage[3] <= _curMessage_3_T_2 @[\\src\\main\\scala\\controller\\Display.scala 59:17]
    reg anodeCnt : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[src/main/scala/chisel3/util/Counter.scala 61:40]
    wire anodeCntWrap : UInt<1> @[src/main/scala/chisel3/util/Counter.scala 117:24]
    anodeCntWrap <= UInt<1>("h0") @[src/main/scala/chisel3/util/Counter.scala 117:24]
    when UInt<1>("h1") : @[src/main/scala/chisel3/util/Counter.scala 118:16]
      node wrap_wrap_2 = eq(anodeCnt, UInt<2>("h3")) @[src/main/scala/chisel3/util/Counter.scala 73:24]
      node _wrap_value_T_4 = add(anodeCnt, UInt<1>("h1")) @[src/main/scala/chisel3/util/Counter.scala 77:24]
      node _wrap_value_T_5 = tail(_wrap_value_T_4, 1) @[src/main/scala/chisel3/util/Counter.scala 77:24]
      anodeCnt <= _wrap_value_T_5 @[src/main/scala/chisel3/util/Counter.scala 77:15]
      anodeCntWrap <= wrap_wrap_2 @[src/main/scala/chisel3/util/Counter.scala 118:23]
    inst sseg of SSegDecoder @[\\src\\main\\scala\\controller\\Display.scala 62:20]
    sseg.clock <= clock
    sseg.reset <= reset
    sseg.io.in <= curMessage[anodeCnt] @[\\src\\main\\scala\\controller\\Display.scala 63:14]
    node _io_sseg_T = not(sseg.io.out) @[\\src\\main\\scala\\controller\\Display.scala 65:14]
    io.sseg <= _io_sseg_T @[\\src\\main\\scala\\controller\\Display.scala 65:11]
    node _io_an_T = dshl(UInt<1>("h1"), anodeCnt) @[\\src\\main\\scala\\controller\\Display.scala 66:18]
    node _io_an_T_1 = not(_io_an_T) @[\\src\\main\\scala\\controller\\Display.scala 66:12]
    io.an <= _io_an_T_1 @[\\src\\main\\scala\\controller\\Display.scala 66:9]

  module Accumulator :
    input clock : Clock
    input reset : Reset
    output io : { flip next : SInt<16>, tot : SInt<16>} @[\\src\\main\\scala\\controller\\Accumulator.scala 13:14]

    reg tot : SInt<16>, clock with :
      reset => (reset, asSInt(UInt<16>("h0"))) @[\\src\\main\\scala\\controller\\Accumulator.scala 14:20]
    reg regChain : SInt<16>[64], clock with :
      reset => (UInt<1>("h0"), regChain) @[\\src\\main\\scala\\controller\\Accumulator.scala 15:22]
    regChain[0] <= io.next @[\\src\\main\\scala\\controller\\Accumulator.scala 17:15]
    regChain[1] <= regChain[0] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[2] <= regChain[1] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[3] <= regChain[2] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[4] <= regChain[3] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[5] <= regChain[4] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[6] <= regChain[5] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[7] <= regChain[6] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[8] <= regChain[7] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[9] <= regChain[8] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[10] <= regChain[9] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[11] <= regChain[10] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[12] <= regChain[11] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[13] <= regChain[12] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[14] <= regChain[13] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[15] <= regChain[14] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[16] <= regChain[15] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[17] <= regChain[16] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[18] <= regChain[17] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[19] <= regChain[18] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[20] <= regChain[19] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[21] <= regChain[20] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[22] <= regChain[21] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[23] <= regChain[22] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[24] <= regChain[23] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[25] <= regChain[24] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[26] <= regChain[25] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[27] <= regChain[26] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[28] <= regChain[27] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[29] <= regChain[28] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[30] <= regChain[29] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[31] <= regChain[30] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[32] <= regChain[31] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[33] <= regChain[32] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[34] <= regChain[33] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[35] <= regChain[34] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[36] <= regChain[35] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[37] <= regChain[36] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[38] <= regChain[37] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[39] <= regChain[38] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[40] <= regChain[39] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[41] <= regChain[40] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[42] <= regChain[41] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[43] <= regChain[42] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[44] <= regChain[43] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[45] <= regChain[44] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[46] <= regChain[45] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[47] <= regChain[46] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[48] <= regChain[47] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[49] <= regChain[48] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[50] <= regChain[49] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[51] <= regChain[50] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[52] <= regChain[51] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[53] <= regChain[52] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[54] <= regChain[53] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[55] <= regChain[54] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[56] <= regChain[55] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[57] <= regChain[56] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[58] <= regChain[57] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[59] <= regChain[58] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[60] <= regChain[59] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[61] <= regChain[60] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[62] <= regChain[61] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    regChain[63] <= regChain[62] @[\\src\\main\\scala\\controller\\Accumulator.scala 20:17]
    wire diff : SInt<16> @[\\src\\main\\scala\\controller\\Accumulator.scala 23:18]
    node _diff_T = sub(io.next, regChain[63]) @[\\src\\main\\scala\\controller\\Accumulator.scala 24:19]
    node _diff_T_1 = tail(_diff_T, 1) @[\\src\\main\\scala\\controller\\Accumulator.scala 24:19]
    node _diff_T_2 = asSInt(_diff_T_1) @[\\src\\main\\scala\\controller\\Accumulator.scala 24:19]
    diff <= _diff_T_2 @[\\src\\main\\scala\\controller\\Accumulator.scala 24:8]
    node _tot_T = add(tot, diff) @[\\src\\main\\scala\\controller\\Accumulator.scala 26:14]
    node _tot_T_1 = tail(_tot_T, 1) @[\\src\\main\\scala\\controller\\Accumulator.scala 26:14]
    node _tot_T_2 = asSInt(_tot_T_1) @[\\src\\main\\scala\\controller\\Accumulator.scala 26:14]
    tot <= _tot_T_2 @[\\src\\main\\scala\\controller\\Accumulator.scala 26:7]
    io.tot <= tot @[\\src\\main\\scala\\controller\\Accumulator.scala 27:10]

  module PID :
    input clock : Clock
    input reset : Reset
    output io : { flip P : SInt<16>, flip I : SInt<16>, flip D : SInt<16>, flip e : SInt<16>, response : SInt<16>} @[\\src\\main\\scala\\controller\\PID.scala 16:14]

    wire propE : SInt<16> @[\\src\\main\\scala\\controller\\PID.scala 18:19]
    wire intE : SInt<16> @[\\src\\main\\scala\\controller\\PID.scala 19:18]
    wire diffE : SInt<16> @[\\src\\main\\scala\\controller\\PID.scala 20:19]
    reg lastE : SInt, clock with :
      reset => (UInt<1>("h0"), lastE) @[\\src\\main\\scala\\controller\\PID.scala 22:22]
    lastE <= io.e @[\\src\\main\\scala\\controller\\PID.scala 22:22]
    inst accumulator of Accumulator @[\\src\\main\\scala\\controller\\PID.scala 23:27]
    accumulator.clock <= clock
    accumulator.reset <= reset
    accumulator.io.next <= io.e @[\\src\\main\\scala\\controller\\PID.scala 24:23]
    propE <= io.e @[\\src\\main\\scala\\controller\\PID.scala 26:9]
    intE <= accumulator.io.tot @[\\src\\main\\scala\\controller\\PID.scala 27:8]
    node _diffE_T = sub(io.e, lastE) @[\\src\\main\\scala\\controller\\PID.scala 28:17]
    node _diffE_T_1 = tail(_diffE_T, 1) @[\\src\\main\\scala\\controller\\PID.scala 28:17]
    node _diffE_T_2 = asSInt(_diffE_T_1) @[\\src\\main\\scala\\controller\\PID.scala 28:17]
    diffE <= _diffE_T_2 @[\\src\\main\\scala\\controller\\PID.scala 28:9]
    node _io_response_T = mul(io.P, propE) @[\\src\\main\\scala\\controller\\PID.scala 30:22]
    node _io_response_T_1 = mul(io.I, intE) @[\\src\\main\\scala\\controller\\PID.scala 30:35]
    node _io_response_T_2 = add(_io_response_T, _io_response_T_1) @[\\src\\main\\scala\\controller\\PID.scala 30:29]
    node _io_response_T_3 = tail(_io_response_T_2, 1) @[\\src\\main\\scala\\controller\\PID.scala 30:29]
    node _io_response_T_4 = asSInt(_io_response_T_3) @[\\src\\main\\scala\\controller\\PID.scala 30:29]
    node _io_response_T_5 = mul(io.D, diffE) @[\\src\\main\\scala\\controller\\PID.scala 30:47]
    node _io_response_T_6 = add(_io_response_T_4, _io_response_T_5) @[\\src\\main\\scala\\controller\\PID.scala 30:41]
    node _io_response_T_7 = tail(_io_response_T_6, 1) @[\\src\\main\\scala\\controller\\PID.scala 30:41]
    node _io_response_T_8 = asSInt(_io_response_T_7) @[\\src\\main\\scala\\controller\\PID.scala 30:41]
    io.response <= _io_response_T_8 @[\\src\\main\\scala\\controller\\PID.scala 30:15]

  module Controller :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip target : SInt<16>, flip cur : SInt<16>, heatingResponse : UInt<16>, coolingResponse : UInt<16>, sseg : UInt<7>, an : UInt<4>} @[\\src\\main\\scala\\controller\\Controller.scala 19:14]

    reg target : SInt, clock with :
      reset => (UInt<1>("h0"), target) @[\\src\\main\\scala\\controller\\Controller.scala 21:23]
    target <= io.target @[\\src\\main\\scala\\controller\\Controller.scala 21:23]
    reg cur : SInt, clock with :
      reset => (UInt<1>("h0"), cur) @[\\src\\main\\scala\\controller\\Controller.scala 22:20]
    cur <= io.cur @[\\src\\main\\scala\\controller\\Controller.scala 22:20]
    inst display of Display @[\\src\\main\\scala\\controller\\Controller.scala 24:23]
    display.clock <= clock
    display.reset <= reset
    display.io.currentTemp <= cur @[\\src\\main\\scala\\controller\\Controller.scala 25:26]
    display.io.targetTemp <= target @[\\src\\main\\scala\\controller\\Controller.scala 26:25]
    io.sseg <= display.io.sseg @[\\src\\main\\scala\\controller\\Controller.scala 27:11]
    io.an <= display.io.an @[\\src\\main\\scala\\controller\\Controller.scala 28:9]
    wire e : SInt<16> @[\\src\\main\\scala\\controller\\Controller.scala 30:15]
    node _e_T = sub(target, cur) @[\\src\\main\\scala\\controller\\Controller.scala 31:15]
    node _e_T_1 = tail(_e_T, 1) @[\\src\\main\\scala\\controller\\Controller.scala 31:15]
    node _e_T_2 = asSInt(_e_T_1) @[\\src\\main\\scala\\controller\\Controller.scala 31:15]
    e <= _e_T_2 @[\\src\\main\\scala\\controller\\Controller.scala 31:5]
    inst pid of PID @[\\src\\main\\scala\\controller\\Controller.scala 33:19]
    pid.clock <= clock
    pid.reset <= reset
    pid.io.P <= asSInt(UInt<16>("h1")) @[\\src\\main\\scala\\controller\\Controller.scala 34:12]
    pid.io.I <= asSInt(UInt<16>("h1")) @[\\src\\main\\scala\\controller\\Controller.scala 35:12]
    pid.io.D <= asSInt(UInt<16>("h1")) @[\\src\\main\\scala\\controller\\Controller.scala 36:12]
    pid.io.e <= e @[\\src\\main\\scala\\controller\\Controller.scala 37:12]
    node inverseResponse = mul(asSInt(UInt<16>("hffff")), pid.io.response) @[\\src\\main\\scala\\controller\\Controller.scala 40:38]
    node _io_heatingResponse_T = gt(pid.io.response, asSInt(UInt<16>("h0"))) @[\\src\\main\\scala\\controller\\Controller.scala 42:45]
    node _io_heatingResponse_T_1 = asUInt(pid.io.response) @[\\src\\main\\scala\\controller\\Controller.scala 42:70]
    node _io_heatingResponse_T_2 = asUInt(asSInt(UInt<16>("h0"))) @[\\src\\main\\scala\\controller\\Controller.scala 42:91]
    node _io_heatingResponse_T_3 = mux(_io_heatingResponse_T, _io_heatingResponse_T_1, _io_heatingResponse_T_2) @[\\src\\main\\scala\\controller\\Controller.scala 42:28]
    io.heatingResponse <= _io_heatingResponse_T_3 @[\\src\\main\\scala\\controller\\Controller.scala 42:22]
    node _io_coolingResponse_T = lt(pid.io.response, asSInt(UInt<16>("h0"))) @[\\src\\main\\scala\\controller\\Controller.scala 43:45]
    node _io_coolingResponse_T_1 = asUInt(inverseResponse) @[\\src\\main\\scala\\controller\\Controller.scala 43:77]
    node _io_coolingResponse_T_2 = asUInt(asSInt(UInt<16>("h0"))) @[\\src\\main\\scala\\controller\\Controller.scala 43:98]
    node _io_coolingResponse_T_3 = mux(_io_coolingResponse_T, _io_coolingResponse_T_1, _io_coolingResponse_T_2) @[\\src\\main\\scala\\controller\\Controller.scala 43:28]
    io.coolingResponse <= _io_coolingResponse_T_3 @[\\src\\main\\scala\\controller\\Controller.scala 43:22]

