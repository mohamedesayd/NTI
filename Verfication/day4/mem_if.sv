interface mem_if #(
    parameter WIDTH = 8, 
    parameter DEPTH = 256,
    parameter type data_type = logic
) (
    input logic clk
);
    logic we;        // write enable
    logic [WIDTH-1:0] addr;      // 256 locations
    data_type [WIDTH-1:0] data_in;
    data_type [WIDTH-1:0] data_out;

    modport mem (input clk, we, addr, data_in, output data_out);
endinterface