module bit_select_tb(
);
    

    reg clk, rst, arst_n, tx_en;
    wire [3:0] bit_select;
    wire busy, done;

    bit_select dut (clk, arst_n, rst, tx_en, bit_select, done, busy);

    initial begin
        clk =0;
        forever #5 clk = ~clk;
    end

    initial begin
        arst_n =0;
        rst =0;
        tx_en =0;
        #15 arst_n =1;
        tx_en =1;
        #10 tx_en =0;
        #120 $stop;
    end
endmodule