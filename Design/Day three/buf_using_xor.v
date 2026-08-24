module buf_using_xor(
    input A, 
    output Y
);
    
    xnor U1 (Y, A, 1'b1);

endmodule