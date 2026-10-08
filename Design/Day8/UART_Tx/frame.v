module frame(
    input clk, arst_n, rst, tx_en,
    input [7:0] data,
    output reg [9:0]out_frame
);
    always @(posedge clk, negedge arst_n) begin
        if (~arst_n)
            out_frame <= 10'b0000000001;
        else if (rst)
            out_frame <= 10'b0000000001;
        else if (tx_en)
            out_frame <= {data, 2'b01};
        else
            out_frame <= out_frame;
    end
endmodule