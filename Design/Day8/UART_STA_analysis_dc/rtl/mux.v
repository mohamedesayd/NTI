module mux(
    input [9:0] in, 
    input [3:0] sel,
    output serial_out
);
    
assign serial_out = in [sel];

endmodule