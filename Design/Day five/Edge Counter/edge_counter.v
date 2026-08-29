module edge_counter(
    input clk, rst_n, in,
    output [3:0]count
);
    edge_detector_mr u0 (clk, rst_n, in, tick_n, tick_p, tick);
    counter      u1 (clk, rst_n, tick, count);
endmodule