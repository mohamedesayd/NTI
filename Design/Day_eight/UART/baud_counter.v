module baud_counter
#(
    parameter CLK_FREQ = 50_000_000,
              BAUD_RATE=9600
)
(
    input clk, arst_n, 
    output reg sys_clk
);
    reg[32:0] counter;
    always @(posedge clk) begin
        if (~arst_n) begin
            counter <= 0;
            sys_clk <= 0;
        end
        else if (counter < (CLK_FREQ/BAUD_RATE)) begin
            sys_clk <= 0;
            counter <= counter +1;
        end
        else begin
            counter <=0;
            sys_clk <= 1;
        end
    end

endmodule