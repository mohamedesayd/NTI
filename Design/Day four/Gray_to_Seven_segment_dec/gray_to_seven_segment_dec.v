module gray_to_seven_segment_dec #(
   parameter DEC_WIDTH = 4
) (
    input [DEC_WIDTH-1:0] gray,
    output [6:0] seven_segment
);
    wire [DEC_WIDTH-1:0] binary;

    gray_2_bin_dec  #(DEC_WIDTH) u1 (gray, binary);
    sev_seg_hex_dec              u2 (binary, seven_segment);

endmodule