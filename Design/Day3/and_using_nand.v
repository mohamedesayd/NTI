module and_using_nand (input A, B, output Y);

    nand u1 (W, A, B);
    nand u2 (Y, W, W);

endmodule