module advertiser(
    input clk, rst_n,
    input [2:0] state,
    input [9:0] shift_reg,
    output reg [6:0] sevseg0, sevseg1, sevseg2, sevseg3,sevseg4,sevseg5,
    output [9:0] leds_out
);
        parameter idle  =3'b000,
                  level1=3'b001,
                //   levle2=3'b010,
                //   level3=3'b011,
                  lose  =3'b100,
                  win   =3'b101;
    reg [9:0] leds_in, counter;
    assign leds_out = (state == level1)? shift_reg : leds_in;
    always @(posedge clk, negedge rst_n) begin
        if (~rst_n)begin 
            sevseg0 <= 7'b1111111;
            sevseg1 <= 7'b1111111; 
            sevseg2 <= 7'b1111111; 
            sevseg3 <= 7'b1111111;
            sevseg4 <= 7'b1111111;
            sevseg5 <= 7'b1111111;
            counter <=0;
            leds_in <= 0;
        end
        else begin
            counter <= counter +1;
            case(state)
                idle:begin
                    sevseg0 <= 7'b0011010;
                    sevseg1 <= 7'b1110000; 
                    sevseg2 <= 7'b1011000; 
                    sevseg3 <= 7'b0001100;
                    sevseg4 <= 7'b1110000;
                    sevseg5 <= 7'b0100100;
                    if (counter > 25_000_000)
                        leds_in <= ~leds_in;
                    else
                        leds_in <= leds_in;
                end
                level1:begin
                    sevseg0 <= 7'b1111001;
                    sevseg1 <= 7'b1110001; 
                    sevseg2 <= 7'b0110000; 
                    sevseg3 <= 7'b1000001;
                    sevseg4 <= 7'b0110000;
                    sevseg5 <= 7'b1110001;
                    leds_in <= leds_in;
                end
                // levle2:begin
                //     sevseg0 <= 7'b0010010;
                //     sevseg1 <= 7'b1110001; 
                //     sevseg2 <= 7'b0110000; 
                //     sevseg3 <= 7'b1000001;
                //     sevseg4 <= 7'b0110000;
                //     sevseg5 <= 7'b1110001;
                // end
                // level3:begin
                //     sevseg0 <= 7'b0000110;
                //     sevseg1 <= 7'b1110001; 
                //     sevseg2 <= 7'b0110000; 
                //     sevseg3 <= 7'b1000001;
                //     sevseg4 <= 7'b0110000;
                //     sevseg5 <= 7'b1110001;
                //end
                lose:begin
                    sevseg0 <= 7'b1111111;
                    sevseg1 <= 7'b1011000; 
                    sevseg2 <= 7'b0010000; 
                    sevseg3 <= 7'b0100100;
                    sevseg4 <= 7'b0000001;
                    sevseg5 <= 7'b1110001;
                    if (counter > 12_500_000)
                        leds_in <= ~leds_in;
                    else
                        leds_in <= leds_in;
                end
                win:begin
                    sevseg0 <= 7'b1111111;
                    sevseg1 <= 7'b1111111; 
                    sevseg2 <= 7'b0100100; 
                    sevseg3 <= 7'b1000001;
                    sevseg4 <= 7'b0000001;
                    sevseg5 <= 7'b1100000;
                    if (counter > 12_500_000)
                        leds_in <= ~leds_in;
                    else
                        leds_in <= leds_in;
                end
                default:begin
                    sevseg0 <= 7'b1111111;
                    sevseg1 <= 7'b1111111; 
                    sevseg2 <= 7'b1111111; 
                    sevseg3 <= 7'b1111111;
                    sevseg4 <= 7'b1111111;
                    sevseg5 <= 7'b1111111;
                    leds_in <= leds_in;
                end
            endcase
        end
    end
endmodule