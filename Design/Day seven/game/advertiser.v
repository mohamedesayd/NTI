module advertiser(
    input [2:0] state,
    output reg [6:0] sevseg0, sevseg1, sevseg2, sevseg3,sevseg4,sevseg5
);
        parameter idle  =3'b000,
                  level1=3'b001,
                  levle2=3'b010,
                  level3=3'b011,
                  lose  =3'b100,
                  win   =3'b101;

    always @(*) begin
        case(state)
            idle:begin
                sevseg0 = 7'b0011010;
                sevseg1 = 7'b1110000; 
                sevseg2 = 7'b1011000; 
                sevseg3 = 7'b0001100;
                sevseg4 = 7'b1110000;
                sevseg5 = 7'b0100100;

            end
            level1:begin
                sevseg0 = 7'b1111001;
                sevseg1 = 7'b1110001; 
                sevseg2 = 7'b0110000; 
                sevseg3 = 7'b1000001;
                sevseg4 = 7'b0110000;
                sevseg5 = 7'b1110001;
            end
            levle2:begin
                sevseg0 = 7'b0010010;
                sevseg1 = 7'b1110001; 
                sevseg2 = 7'b0110000; 
                sevseg3 = 7'b1000001;
                sevseg4 = 7'b0110000;
                sevseg5 = 7'b1110001;
            end
            level3:begin
                sevseg0 = 7'b0000110;
                sevseg1 = 7'b1110001; 
                sevseg2 = 7'b0110000; 
                sevseg3 = 7'b1000001;
                sevseg4 = 7'b0110000;
                sevseg5 = 7'b1110001;
            end
            lose:begin
                sevseg0 = 7'b1111111;
                sevseg1 = 7'b1011000; 
                sevseg2 = 7'b0010000; 
                sevseg3 = 7'b0100100;
                sevseg4 = 7'b0000001;
                sevseg5 = 7'b1110001;
            end
            win:begin
                sevseg0 = 7'b1111111;
                sevseg1 = 7'b1111111; 
                sevseg2 = 7'b0100100; 
                sevseg3 = 7'b1000001;
                sevseg4 = 7'b0000001;
                sevseg5 = 7'b1100000;
            end
            default:begin
                sevseg0 = 7'b1111111;
                sevseg1 = 7'b1111111; 
                sevseg2 = 7'b1111111; 
                sevseg3 = 7'b1111111;
                sevseg4 = 7'b1111111;
                sevseg5 = 7'b1111111;
            end
        endcase
    end
endmodule