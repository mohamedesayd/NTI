module bcd_digital_clock(
    input clk, rst_n,
    output [6:0] sev_segss0, sev_segss1, sev_segmm0, sev_segmm1, sev_seghh0, sev_seghh1
);
    wire [5:0] ss, mm, hh;

    digital_clock clock (clk, rst_n, ss, mm, hh);
    bin_to_sev_seg_dec uss ({2'b00, ss}, sev_segss0, sev_segss1,);
    bin_to_sev_seg_dec umm ({2'b00, mm}, sev_segmm0, sev_segmm1,);
    bin_to_sev_seg_dec uhh ({2'b00, hh}, sev_seghh0, sev_seghh1,);
endmodule