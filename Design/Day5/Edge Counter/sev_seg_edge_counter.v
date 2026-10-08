module sev_seg_edge_counter(
    input clk, rst_n, in, 
    output [6:0]sev_seg
);
    wire [3:0] count;
    edge_counter u0 (clk, rst_n, in, count);
    sev_seg_hex_dec u1 (count, sev_seg);

endmodule