module clk_divider #(
    parameter CLK_REF_FREQ = 50_000_000
)(
    input clk_ref, rst_n,
    input [2:0] speed,
    output reg clk
);
    reg [31:0] counter;
    always @(posedge clk_ref, negedge rst_n) begin
        if (~rst_n) begin 
            counter <=0;
            clk <= 0;
        end
        else if (counter == ((CLK_REF_FREQ*speed)/2)) begin
            counter <=0;
            clk <= ~clk;
        end 
        else
            counter <= counter + 1;
    end
endmodule