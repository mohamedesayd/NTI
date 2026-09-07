module game(
    input clk_ref, rst_n,
    input [9:0]sw,
    input hold,
    input start, 
    output [6:0] sevseg0, sevseg1, sevseg2, sevseg3,sevseg4,sevseg5,
    output [9:0] leds
);
    wire [2:0] speed, state;

    clk_divider u1 (pll_clk, rst_n, speed, clk);
    sm u0 (pll_clk, rst_n, loser, boss, ~start, ~hold, sw, state, speed, active);
    advertiser u2 (state, sevseg0, sevseg1, sevseg2, sevseg3,sevseg4,sevseg5);
    lfsr u3 (clk, rst_n, (~hold && ~active), leds);
    comparator u4 (leds, sw,loser, boss);
    pll u5 (clk_ref, ~rst_n, pll_clk);

endmodule