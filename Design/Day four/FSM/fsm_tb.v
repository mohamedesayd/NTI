module fsm_tb();
    
reg a, b, clk, rst_n;
wire y0, y1;

fsm dut (a, b, clk, rst_n, y0, y1);

always #5 clk = ~clk;

initial begin
//initialization the inputs
    a=0;
    b=0;
    clk =0;
    rst_n =1;

//reset the system
    rst_n = 0;
    #20 
    rst_n = 1;
//test vectors
    #6 a = 1;
       b = 1;

       #2;
       a = 0;
       b = 0;       
    #20 $stop;
end


endmodule