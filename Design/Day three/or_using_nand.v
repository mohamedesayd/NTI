module or_using_nand (input A, B,output Y);
    
    nand u1 (W1, A, A);
    nand u2 (W2, B, B);
    nand U3 (Y, W1, W2);

endmodule