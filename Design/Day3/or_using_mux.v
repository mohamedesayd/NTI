module or_using_mux(
    input A, B, 
    output Y
);
    
    mux_2x1 u1 (B, 1'b1, A, Y);

endmodule