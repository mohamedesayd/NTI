module game(
    input clk_ref, rst_n,
    input [9:0]sw,
    input hold,
    input start, 
    output [6:0] sevseg0, sevseg1, sevseg2, sevseg3,sevseg4,sevseg5,
    output [9:0] leds_out
);
    wire [2:0] speed, state;
    wire [9:0] leds;

    clk_divider u1 (clk_ref, rst_n, speed, clk);
    sm u0 (clk_ref, rst_n, loser, boss, ~start, ~hold, sw, state, speed, active);
    advertiser u2 (clk_ref, rst_n,state,leds, sevseg0, sevseg1, sevseg2, sevseg3,sevseg4,sevseg5, leds_out);
    lfsr u3 (clk, rst_n, (~hold && ~active), leds);
    comparator u4 (leds, sw,loser, boss);
    //pll u5 (clk_ref, ~rst_n, pll_clk);

endmodule