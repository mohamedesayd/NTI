module nand_using_mux (
    input A, B,
    output  Y
);

    mux_2x1 u1 (1'b1, 1'b0, B, W);
    mux_2x1 u2 (1'b1, W, A, Y);

endmodule