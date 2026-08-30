module sm(
    input clk, rst_n, loser, boss, start, hold,
    output reg [2:0] state,
    output reg [2:0] speed,
    output reg active
);
    parameter idle  =3'b000,
              level1=3'b001,
              levle2=3'b010,
              level3=3'b011,
              lose  =3'b100,
              win   =3'b101;

    reg [2:0]current_state, next_state;
    always @(posedge clk, negedge rst_n) begin
        if (~rst_n)
            current_state <= idle;
        else
            current_state <= next_state;
    end

    always @(*) begin
        case(current_state)
            idle:begin
                if (start)
                    next_state <= level1;
                else
                    next_state <= idle;
            end
            level1:begin
                if (boss && hold)
                    next_state <= levle2;
                else if (loser && hold)
                    next_state <= lose;
                else
                    next_state <= level1;
            end
            levle2:begin
                if (boss && hold)
                    next_state <= level3;
                else if (loser && hold)
                    next_state <= lose;
                else
                    next_state <= levle2;
            end
            level3:begin
                if (boss && hold)
                    next_state <= win;
                else if (loser && hold)
                    next_state <= lose;
                else
                    next_state <= level3; 
            end
            lose:begin
                if (start)
                    next_state <= level1;
                else
                    next_state <= lose;
            end
            win:begin
                if (start)
                    next_state <= level1;
                else
                    next_state <= win;
            end
        endcase
    end

    always @(*) begin
        if ((current_state == idle)|| (current_state == lose)|| (current_state == win))
            active =0;
        else
            active =1;

        if (current_state == level3)
            speed = 3'd4;
        else if (current_state == levle2)
            speed = 3'd2;
        else    
            speed = 3'd1;

        state = current_state;
    end
endmodule