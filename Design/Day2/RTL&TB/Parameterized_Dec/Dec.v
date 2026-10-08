module Dec #(
    parameter input_no = 2
) (
    input [input_no -1 : 0] in, 
    output reg [(1 << input_no) -1 : 0] out
);
    
always @ * begin
    out = {(2 ** input_no) {1'b0}};
    out [in] = 1;
end
endmodule