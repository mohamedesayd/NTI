module lfsr(
    input clk, rst_n, hold, 
    output reg [9:0] out
);
    always @(posedge clk, negedge rst_n) begin
        if (~rst_n)
            out <= 10'b0000000001;
        else if (hold)
            out <= out;
        else
            out <= {out[0], out[9:1]};
    end
endmodule