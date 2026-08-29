module clk_divider #(
    parameter CLK_REF_FREQ = 5_000_000
)(
    input clk_ref, rst_n,
    output reg clk
);
    reg [31:0] counter;
    always @(posedge clk_ref, negedge rst_n) begin
        if (~rst_n)
            counter <=0;
        else if (counter == CLK_REF_FREQ/2) begin
            counter <=0;
            clk <= ~clk;
        end 
        else
            counter <= counter + 1;
    end
endmodule