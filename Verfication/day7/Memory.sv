module memory #(
    parameter  DATA_WIDTH = 32,
    parameter  MEM_DEPTH  = 64,
    localparam ADDR_WIDTH  = $clog2(MEM_DEPTH)
) (
    input       wire                                clk,
    input       wire                                rst_n,
    input       wire                                write_en,
    input       wire                                read_en,
    input       wire        [ADDR_WIDTH-1:0]        address,
    input       wire        [DATA_WIDTH-1:0]        data_in,
    output      reg         [DATA_WIDTH-1:0]        data_out,
    output      reg                                 valid_out
);

reg [DATA_WIDTH-1:0] MEM [0:MEM_DEPTH-1];

always @(posedge clk, negedge rst_n) begin
    if (!rst_n) begin
        data_out <= 0;
        valid_out <= 0;
    end
    else begin
        if (write_en) begin
            MEM[address] <= data_in;
            valid_out <= 0;
        end
        else if (read_en) begin
            data_out <= MEM[address];
            valid_out <= 1;
        end
        else begin
            valid_out <= 0;
        end
    end
end

endmodule