module FA_B(A, B, Cin, S, Cout);

input A;
input B; 
input Cin;
output reg S;
output reg Cout;

    always @(*) begin
        case({A, B, Cin})
            3'b000: begin 
                S = 1'b0; 
                Cout = 1'b0;
            end
            3'b001: begin 
                S = 1'b1;
                Cout = 1'b0;
            end 
            3'b010: begin 
                S = 1'b1;
                Cout = 1'b0;
            end
            3'b011: begin 
                S = 1'b0;
                Cout = 1'b1;
            end
            3'b100: begin 
                S = 1'b1;
                Cout = 1'b0;
            end
            3'b101: begin 
                S = 1'b0;
                Cout = 1'b1;
            end
            3'b110: begin 
                S = 1'b0;
                Cout = 1'b1;
            end
            3'b111: begin 
                S = 1'b1;
                Cout = 1'b1;
            end
        endcase
    end
endmodule 