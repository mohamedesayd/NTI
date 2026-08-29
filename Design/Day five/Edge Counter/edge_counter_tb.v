module edge_counter_tb(
);
    reg clk, rst_n, tick;
    wire [3:0] count;

    edge_counter dut (clk, rst_n, tick,count);

    initial begin
       clk =0 ;
        forever #5 clk = ~clk;
    end

    initial begin
        rst_n =1 ;
        tick = 0;
        #10 rst_n = 0;
        #10 rst_n = 1;
        repeat( 10 ) #10 tick = ~tick;
        #10 $stop;
    end
endmodule