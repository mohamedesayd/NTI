module edge_detector_tb(
);
    reg clk, rst_n, in;
    wire tick_p_mr, tick_n_mr, tick_mr, tick_p_ml, tick_n_ml, tick_ml;

    edge_detector_mr dut0 (clk, rst_n, in, tick_p_mr, tick_n_mr, tick_mr);
    edge_detector_ml dut1(clk, rst_n, in, tick_p_ml, tick_n_ml, tick_ml);

    initial begin
      clk =0;
      forever #5 clk = !clk;
    end

    initial begin
      in =0;
      rst_n =1;
      #5 rst_n =0;
      #10 rst_n =1;

      @(negedge clk) in=1;
      @(negedge clk) in=0;
      #20; 
      @(negedge clk) in=1;
      #20;
      @(negedge clk) in=0;
      #20 $stop;  
    end
endmodule