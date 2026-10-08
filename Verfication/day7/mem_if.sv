interface mem_if#(
    parameter  DATA_WIDTH = 32,
    parameter  MEM_DEPTH  = 64,
    localparam ADDR_WIDTH  = $clog2(MEM_DEPTH)
)(input logic clk);

logic rst_n;
logic write_en;
logic read_en;
logic [ADDR_WIDTH-1:0] address;
logic [DATA_WIDTH-1:0] data_in;
logic [DATA_WIDTH-1:0] data_out;
logic valid_out;

clocking cb @(posedge clk);
    default input #1 output #0;
    output  write_en;
    output  read_en;
    output  address;
    output  data_in;
    input   data_out;
    input   valid_out;
endclocking

modport dut_if (clocking cb, output rst_n);
// initial begin
//     $monitor("rst_n: %d, write_en: %d, read_en: %d, address: %d, data_in: %d, data_out: %d", 
//               rst_n, write_en, read_en, address, data_in, data_out);
// end
endinterface //mem_if