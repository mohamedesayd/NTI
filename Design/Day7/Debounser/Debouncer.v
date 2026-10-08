module debouncer#(
    parameter CLK_FREQ = 50_000_000,// Hz 
    parameter DEBOUNCING_TIME = 10 // ns

) (
    input sw, clk, rst_n,
    output reg out
);
    
    parameter s0=3'b000,
              s1=3'b001,
              s2=3'b011,
              s3=3'b010,
              s4=3'b110,
              s5=3'b111,
              s6=3'b101,
              s7=3'b100;

    reg [2:0] current_state, next_state;
    reg tick;
    reg [31:0] counter;
    always @(posedge clk, negedge rst_n) begin
        if (~rst_n)
            current_state <= s0;
        else 
            current_state <= next_state;
    end

    always @(*) begin
        case (current_state)
            s0:begin 
                if (~sw)
                    next_state = s0;
                else
                    next_state = s1;
            end 
            s1:begin 
                if (sw & ~tick)
                    next_state = s1;
                else if (~sw)
                    next_state = s0;
                else
                    next_state = s2;
            end 
            s2:begin 
                if (sw & ~tick)
                    next_state = s2;
                else if (~sw)
                    next_state = s0;
                else
                    next_state = s3;
            end 
            s3:begin 
                if (sw & ~tick)
                    next_state = s3;
                else if (~sw)
                    next_state = s0;
                else
                    next_state = s4;
            end 
            s4:begin 
                if (sw)
                    next_state = s4;
                else
                    next_state = s5;
            end 
            s5:begin 
                if (sw)
                    next_state = s4;
                else if(~sw && ~tick)
                    next_state = s5;
                else
                    next_state = s6;
            end 
            s6:begin 
                if (sw)
                    next_state = s4;
                else if(~sw && ~tick)
                    next_state = s6;
                else
                    next_state = s7;
            end 
            s7:begin 
                if (sw)
                    next_state = s4;
                else if(~sw && ~tick)
                    next_state = s7;
                else
                    next_state = s0;
            end              
        endcase
    end

    always @(*) begin
        if ((current_state == s0)||
            (current_state == s1)||
            (current_state == s2)||
            (current_state == s3))
            out = 1'b0;
        else
            out = 1'b1;
    end

    //Internal counter
    always @(posedge clk, negedge rst_n) begin
        if (~rst_n) begin
            counter <= 0;
            tick <= 0;
        end
        else if (counter == (DEBOUNCING_TIME * (CLK_FREQ/1_000_000)))begin
            counter <= 0;
            tick <= 1;
        end
        else begin
            counter <= counter +1;
            tick <= 0;
        end
    end
endmodule