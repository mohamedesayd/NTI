module case_tb(
);
    
    reg [1:0] sel;
    wire [3:0]out;

    Cas dut (sel, out);

endmodule