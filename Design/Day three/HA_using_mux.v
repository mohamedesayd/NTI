module HA_using_mux(
    input A, B, 
    output S, C
);

    mux_2x1 u1 (1'b1, 1'b0, B, W);
    mux_2x1 u2 (B, W, A, S);

    mux_2x1 u3 (1'b0, B, A, C);
        
endmodule