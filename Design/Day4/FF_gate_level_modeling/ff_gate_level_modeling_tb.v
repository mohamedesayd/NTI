`timescale 1ns/1ps
module ff_gate_level_modeling_tb(
);
    
    reg D, clk;
    wire Q, Q_b;

    ff_gate_level_modeling dut (D, clk, Q, Q_b);

    initial begin
      clk =0;
      forever #10 clk = ~clk;
    end

    initial begin
      D = 0;
      # 28 D = 1;
      # 25 D = 0;
      # 37 D = 1;
      # 24 D = 0;
      # 35 D = 1;
      #39.9 D= 0;
      #21.1 D= 1;
      #21   D= 0;
      #19.1 D=1;
      #20;
      $stop;
    end
endmodule