`timescale 1ns/1ps
module ff_gate_level_modeling(
    input D, clk,
    output Q, Q_b
);
    not #1 u1(clk_b, clk);
    transmission_gate u2 (D, W1, clk, clk_b);
    not #1 u3 (W3, W1);
    not #1 u4 (W2, W3);
    transmission_gate u5 (W2, W1, clk_b, clk);
    transmission_gate u6 (W3, W4, clk_b, clk);
    not #1 u7 (W6, W4);
    not #1 u8 (W5, W6);
    transmission_gate u9 (W5, W4, clk, clk_b);

    assign Q   = W6;
    assign Q_b = W5;
endmodule