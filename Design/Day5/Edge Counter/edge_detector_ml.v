module edge_detector_ml(
    input clk, rst_n, in,
    output tick_p, tick_n, tick
);
    parameter s0 = 2'b00,
              s1 = 2'b01;

    reg [1:0]current_state, next_state;
    //register 
    always @(posedge clk, negedge rst_n) begin
        if (~rst_n)
            current_state <= s0;
        else 
            current_state <= next_state;
    end

    // next state logic
    always @(*) begin
        case (current_state)
            s0:begin
                if (in)
                    next_state = s1;
                else 
                    next_state = s0;
            end
            s1:begin
                if (in)
                    next_state <= s1;
                else 
                    next_state <= s0;
            end
        endcase
    end

    //output logic
    assign tick_p = (current_state == s0) && in;
    assign tick_n = (current_state == s1) && ~in;
    assign tick   = ((current_state == s0) && in) || ((current_state == s1) && ~in);
endmodule