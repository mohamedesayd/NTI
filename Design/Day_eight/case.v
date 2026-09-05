module Cas (
    input [1:0] sel,
    output reg[3:0] out
);
always @ (*) begin 
    case (sel)
        2'b0z: out = 4'b0111;  
        2'b00: out = 4'b0010;
        2'b01: out = 4'b0100;
        2'b10: out = 4'b0001;    
        2'b11: out = 4'b0000;    
    endcase
end
endmodule