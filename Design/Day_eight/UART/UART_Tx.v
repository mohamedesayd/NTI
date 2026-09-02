module UART_Tx(
    input clk, arst_n, rst, tx_en, 
    input [7:0] data, 
    output tx, busy, done
);

wire [9:0]out_frame;
wire [3:0]bit_select;

frame        Frame          (clk, arst_n, rst, tx_en,data,out_frame);
baud_counter Baud_counter   (clk, arst_n,sys_clk);
bit_select   Bit_select     (clk, sys_clk, arst_n, rst, tx_en, bit_select,done, busy );
mux          Mux            (out_frame,bit_select,tx);

endmodule