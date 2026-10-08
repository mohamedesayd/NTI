module reg_n #(
    parameter WIDTH = 8
) (
    input  logic       clk,
    input  logic       rst_n,
    input  logic       we,        // write enable
    input  logic [WIDTH-1:0] wdata,
    output logic [WIDTH-1:0] rdata
);

    logic [WIDTH-1:0] regn;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            regn <= '0;
        else if (we)
            regn <= wdata;
    end

    assign rdata = regn;
endmodule