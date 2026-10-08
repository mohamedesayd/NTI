module HA_using_dec(
    input A, B,
    output S, C
);

    dec_2x4 u1 (A, B, W, W1, W2, C);
    assign S = W1 | W2;

endmodule