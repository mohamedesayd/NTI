module bit_select(
    input clk, sys_clk, arst_n, rst, tx_en,
    output reg [3:0]bit_select,
    output reg done, busy 
);
    parameter idle      = 2'b00,
              serialize = 2'b01,
              done_s    = 2'b10;

    reg [2:0] current_state, next_state;

    always @(posedge clk, negedge arst_n) begin
        if (~arst_n)
            current_state <= idle;
        else if (rst)
            current_state <= idle;
        else
            current_state <= next_state;
    end

    always @(*) begin
        case (current_state)
            idle: begin
                if (tx_en)
                    next_state = serialize;
                else
                    next_state = idle;
            end
            serialize: begin
                if (bit_select < 9)
                    next_state = serialize;
                else
                    next_state = done_s;
            end
            done_s     : begin
                next_state = idle;
            end
        endcase
    end

    always @(*) begin
        case (current_state)
            idle: begin
                done = 0;
                busy = 0;
            end
            serialize: begin 
                busy = 1;
                done = 0;
            end
            done_s:begin
                done = 1;
                busy = 0;
            end
        endcase
    end

    always @(posedge clk, negedge arst_n) begin
        if (~arst_n)
            bit_select <= 0;
        else if (rst) begin
            bit_select <= 0;
        end
        else if ((current_state == serialize) && sys_clk)begin
            if (bit_select < 9)
                    bit_select <= bit_select + 1;
                else
                    bit_select <= 0;
        end
        else
            bit_select <= bit_select;
    end
endmodule