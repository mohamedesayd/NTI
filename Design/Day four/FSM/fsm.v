module fsm(
    input a, b, clk, rst_n,
    output y0, y1
);
    parameter s0 = 2'b00, 
              s1 = 2'b01, 
              s2 = 2'b10;

    reg [1:0] cs, ns;

    //next state logic
    always @(*) begin
        case (cs)
            s0:begin
              if (~a)     ns = s0;
              else if (b) ns = s2;
              else        ns = s1;
            end
            s1:begin
              if (~a) ns = s1;
              else    ns = s0;
            end
            s2:begin
              ns = s0;
            end
            default : ns = s0;
        endcase
    end

    //state reg
    always @(posedge clk, negedge rst_n) begin
        if (~rst_n)
            cs <= s0;
        else 
            cs <= ns;
    end

    //output logic 
    assign y0 = (cs == s0) && (a & b);
    assign y1 = (cs == s0) || (cs == s1);
endmodule