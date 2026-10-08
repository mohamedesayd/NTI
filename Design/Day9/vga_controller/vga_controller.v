module vga_controller(
    input clk, rst_n,
    output h_sync, v_sync, video_on,
    output reg [9:0] v_counter, h_counter
);
    parameter display      =2'b00,
              front_porch  =2'b01,
              synch_pulse  =2'b10,
              back_porch   =2'b11;

    reg [1:0] current_state_s1, next_state_s1, current_state_s2, next_state_s2;

    //horizontal state machine
    always @(posedge clk, negedge rst_n) begin
        if (~rst_n)
            current_state_s1 <= display;
        else
            current_state_s1 <= next_state_s1;
    end

    always @(*) begin
        case (current_state_s1)
            display    :begin
                if (h_counter == 639)
                    next_state_s1 = front_porch;
                else
                    next_state_s1 = display;
            end
            front_porch:begin
                if (h_counter == 655)
                    next_state_s1 = synch_pulse;
                else
                    next_state_s1 = front_porch;
            end
            synch_pulse:begin
                if (h_counter == 751)
                    next_state_s1 = back_porch;
                else
                    next_state_s1 = synch_pulse;
            end
            back_porch :begin
                if (h_counter == 799)
                    next_state_s1 = display;
                else
                    next_state_s1 = back_porch;
            end
        endcase
    end

    always @(posedge clk, negedge rst_n) begin
        if (~rst_n)
            h_counter <=0;
        else if (h_counter == 799)
            h_counter <= 0;
        else
            h_counter <= h_counter + 1;
    end
    //vertical state machine
    always @(posedge clk, negedge rst_n) begin
        if (~rst_n)
            current_state_s2 <= display;
        else
            current_state_s2 <= next_state_s2;
    end

    always @(*) begin
        case (current_state_s2)
            display    :begin
                if (v_counter == 479)
                    next_state_s2 = front_porch;
                else
                    next_state_s2 = display;
            end
            front_porch:begin
                if (v_counter == 489)
                    next_state_s2 = synch_pulse;
                else
                    next_state_s2 = front_porch;
            end
            synch_pulse:begin
                if (v_counter == 491)
                    next_state_s2 = back_porch;
                else
                    next_state_s2 = synch_pulse;
            end
            back_porch :begin
                if (v_counter == 524)
                    next_state_s2 = display;
                else
                    next_state_s2 = back_porch;
            end
        endcase
    end

    always @(posedge clk, negedge rst_n) begin
        if (~rst_n)
            v_counter <=0;
        else if (h_counter == 799) begin
            if (v_counter == 524)
                v_counter <= 0;
            else
                v_counter <= v_counter + 1;
        end
        else
            v_counter <= v_counter;
    end

    assign v_sync = (current_state_s2 != synch_pulse);
    assign h_sync = (current_state_s1 != synch_pulse);
    assign video_on = (current_state_s1 == display) && (current_state_s2 == display);
endmodule