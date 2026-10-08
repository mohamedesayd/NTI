module mul #(
    parameter A_W = 8,
    parameter B_W = A_W,
    parameter OUT_W = A_W + B_W
)(
    input logic [A_W-1:0] a,
    input logic [B_W-1:0] b,
    output logic [OUT_W-1:0] product
);
    
endmodule