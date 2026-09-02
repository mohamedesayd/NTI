module UART_Tx_tb ;
    parameter CLK_FREQ = 50_000_000,
              BAUD_RATE= 9600;
    reg clk, arst_n, rst, tx_en;
    reg [7:0] data;
    wire busy, done, tx;

    UART_Tx dut (clk, arst_n, rst, tx_en, data, tx, busy, done);

    initial begin
        clk =0;
        forever #10 clk = ~clk;
    end

    initial begin
        arst_n =0;
        rst    =0;
        #20
        arst_n =1;
        data   = 8'b10101011;
        tx_en =1;
        #20 tx_en =0;
        repeat(11) #(5208*20);
        $stop;
    end
endmodule