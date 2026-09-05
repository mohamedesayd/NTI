module six_digit_digital_clock(
    input rst_n, clk_fpga,
    output [6:0] sev_segss0, sev_segss1, sev_segmm0, sev_segmm1, sev_seghh0, sev_seghh1
);
    bcd_digital_clock u0 (clk, rst_n, sev_segss0, sev_segss1, sev_segmm0, sev_segmm1, sev_seghh0, sev_seghh1);
    clk_divider       u1 (clk_ref, rst_n, clk);
    PLL (
		clk_fpga,   //  refclk.clk
		~rst_n,      //   reset.reset
		clk_ref, // outclk0.clk
		locked    //  locked.export
	);

endmodule
