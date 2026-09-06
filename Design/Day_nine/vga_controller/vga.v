module vga(
    input ref_clk, rst_n,
    //input [9:0] cfg, 
    output h_sync, v_sync, clk, video_on,vga_sync_n,
    output [7:0] r, g, b
);
    wire [23:0] data;
    wire [16:0] address;
    wire [9:0] v_counter, h_counter;
    vga_controller u0 (clk, rst_n, h_sync, v_sync, video_on, v_counter, h_counter);
    rgb_generator  u1 (address, v_counter, h_counter);
    pll u3 (ref_clk,~rst_n, clk,locked);
    rom u4 (address, clk, data);
    assign vga_sync_n =0;
    assign r= data [23:16];
    assign g= data [15:8];
    assign b= data [7:0];
endmodule