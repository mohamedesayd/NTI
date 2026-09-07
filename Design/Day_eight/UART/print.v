module print(
    input clk, rst, arst_n, print,
    input [7:0] data,
    output tx, gnd
);
    UART_Tx uart_tx(clk, arst_n, ~rst, tick_n, data, tx, busy, done);
    edge_detector_mr edge_detector (clk, arst_n, print,tick_p, tick_n, tick);
    assign gnd = 0;
endmodule