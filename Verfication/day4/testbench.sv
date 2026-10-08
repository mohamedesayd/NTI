module test;

    logic clk;
    logic rst_n;
    logic we;
    logic [7:0] wdata_8;
    logic [7:0] rdata_8;
    logic [3:0] wdata_4;
    logic [3:0] rdata_4;
    logic [15:0] wdata_16;
    logic [15:0] rdata_16;
    
    
    reg_n #(.WIDTH(8)) my_reg (
        .clk(clk),
        .rst_n(rst_n),
        .we(we),
        .wdata(wdata_8),
        .rdata(rdata_8)
    );

    reg_n #(4) my_reg_4 (
        .clk(clk),
        .rst_n(rst_n),
        .we(we),
        .wdata(wdata_4),
        .rdata(rdata_4)
    );

    reg_n my_reg_16 (
        .clk(clk),
        .rst_n(rst_n),
        .we(we),
        .wdata(wdata_16),
        .rdata(rdata_16)
    );
    
    defparam my_reg_16.WIDTH = 16;

    mem_if #(8) my_mem (
        .clk(clk)
    );
endmodule