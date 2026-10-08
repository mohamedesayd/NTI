module stream_parity_gen(
    input clk, rst, serial_in, 
    output reg parity_out
);
    reg [7:0] register;
    function parity_gen (input [7:0]input_byte);
        parity_gen = ^input_byte;
    endfunction

    function [7:0]shifted_value (input [7:0]value, input serial_input);
        shifted_value = {value [6:0], serial_input};
    endfunction

    always @(posedge clk) begin
        if(rst) begin
            register <=0;
        end
        else begin
            register <= shifted_value (register, serial_in);
        end
        parity_out <= parity_gen (register);
    end
endmodule