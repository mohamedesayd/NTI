module and_using_nor(
    input A, B, 
    output Y
);
    
    nor u1 (W1, A, A);
    nor u2 (W2, B, B);
    nor u3 (Y, W1, W2);

endmodule