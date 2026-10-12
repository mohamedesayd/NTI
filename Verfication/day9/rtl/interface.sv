interface intf #(
    parameter  DATA_WIDTH = 32,
    parameter  MEM_DEPTH  = 64,
    localparam ADDR_WIDTH = $clog2(MEM_DEPTH)
) (
    input clk
);
  import pkg::*;
  wire                  rst_n;
  wire                  write_en;
  wire                  read_en;
  wire [ADDR_WIDTH-1:0] address;
  wire [DATA_WIDTH-1:0] data_in;
  reg  [DATA_WIDTH-1:0] data_out;
  reg                   valid_out;

  clocking cb @(posedge clk);
    default input #1 output #0;
    output rst_n;
    output write_en;
    output read_en;
    output address;
    output data_in;
    input data_out;
    input valid_out;
  endclocking

  // initial $monitor("rst_n:%0d, write_en:%0d, read_en:%0d, address:%0d, data_in:%0d, data_out:%0d, valid_out:%0d", rst_n, write_en, read_en, address, data_in, data_out, valid_out);
endinterface  //intf
