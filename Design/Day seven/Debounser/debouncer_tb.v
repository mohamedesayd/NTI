`timescale 1ns/1ps
module debouncer_tb(
);
    
    reg clk, rst_n, sw;
    wire out;

    debouncer dut (sw, clk, rst_n, out);

    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    initial begin
        sw = 0;
        rst_n = 0;

        #20
        rst_n = 1;

        //direct happy scenario: high
        sw =1;
        fork : high_checker
            begin
              wait (out) 
              $display("debouncer is working");
              disable high_checker;
            end
            begin
              repeat (15001) @(posedge clk);
              $fatal("debouncer is NOT working");
            end
        join
        //direct happy scenario: low
        #50
        sw=0;
        fork : low_checker
            begin
                $display($time);
              wait (~out) 
              $display("debouncer is working");
              disable low_checker;
            end
            begin
              repeat (15001) @(posedge clk);
              $fatal("debouncer is NOT working");
            end
        join
        # 50
        //glich 
        fork:glich
            begin
                $display($time);
                wait(out);
                $fatal("glick is catched, debouncer not working");
            end
            begin(posedge clk);
                $display("glich is clear, debouncer working!!");
                disable glich;
            end
            begin
                sw=1;
                #50;
                sw=0;
                #50;
                sw=1;
                #50;
                sw=0;
            end
        join
        #50;
        $stop;
    end
endmodule