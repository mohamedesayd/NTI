module FA_using_mux(
    input A, B, Cin, 
    output S, Cout
);
    mux_4x1 u1 (Cin, W, W, Cin, {A, B}, S);
    mux_2x1 u2 (1'b1, 1'b0, Cin, W);

    mux_4x1 u3 (1'b0, Cin, Cin, 1'b1, {A, B}, Cout);
    
endmodule