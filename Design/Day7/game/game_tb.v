module game_tb(
);

reg pll_clk, rst_n;
reg [9:0] sw;
reg hold, start;
wire [6:0]sevseg0, sevseg1, sevseg2, sevseg3,sevseg4,sevseg5;
wire [9:0] leds ;

game dut (pll_clk, rst_n, sw, hold, start, sevseg0, sevseg1, sevseg2, sevseg3,sevseg4,sevseg5, leds);

initial begin
    pll_clk =0;
    forever #5 pll_clk = ~pll_clk;
end

initial begin
    rst_n=0;
    sw=0;
    hold=1;
    start=1;
    #15 rst_n =1;
    
end

endmodule