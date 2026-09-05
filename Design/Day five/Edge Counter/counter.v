module counter(
    input clk, rst_n, tick,
    output reg [3:0]count
);
    
    always @(posedge clk, negedge rst_n) begin
        if (~rst_n) begin
            count <=0;
        end
        else if (tick)
            count <= count + 1;
    end
endmodule