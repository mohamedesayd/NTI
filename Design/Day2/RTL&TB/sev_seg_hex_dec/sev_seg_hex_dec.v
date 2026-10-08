module sev_seg_hex_dec(
    input [3:0] in,
    output [6:0] out
);
	reg [6:0] out_n;
    always @ *  begin
        case (in)          //gfedcba
            4'h0: out_n = 7'b0111111;
            4'h1: out_n = 7'b0000110;
            4'h2: out_n = 7'b1011011;
            4'h3: out_n = 7'b1001111;
            4'h4: out_n = 7'b1100110;
            4'h5: out_n = 7'b1101101;
            4'h6: out_n = 7'b1111101;
            4'h7: out_n = 7'b0000111;
            4'h8: out_n = 7'b1111111;
            4'h9: out_n = 7'b1101111;
            4'hA: out_n = 7'b1110111;
            4'hB: out_n = 7'b1111111;
            4'hC: out_n = 7'b0111001;
            4'hD: out_n = 7'b0111111;
            4'hE: out_n = 7'b1111001;
            4'hF: out_n = 7'b1110001;
            default : out_n = 7'b0000000;
        endcase
    end

    assign out = ~out_n; //Active low 7 segmant

endmodule