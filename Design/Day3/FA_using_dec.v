module FA_using_dec(
    input A, B, Cin,
    output S, Cout
);

    dec_3x8 u1 (A, B, Cin, D, E, F, G, H, I, J, K);
    assign S    = E | F | H | K;
    assign Cout = G | I | J | K;

endmodule