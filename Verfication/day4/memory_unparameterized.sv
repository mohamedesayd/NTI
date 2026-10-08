module simple_mem #(
    parameter WIDTH = 8,
    parameter DEPTH = 256
) (
    input  logic       clk,
    input  logic       we,        // write enable
    input  logic [WIDTH-1:0] addr,      // 256 locations
    input  logic [WIDTH-1:0] wdata,
    output logic [WIDTH-1:0] rdata
);

    // 256 x 8-bit storage array
    logic [WIDTH-1:0] mem [0:DEPTH-1];

    always_ff @(posedge clk) begin
        if (we)
            mem[addr] <= wdata;   // synchronous write
        rdata <= mem[addr];       // synchronous read (returns old data on a same-address write)
    end

endmodule