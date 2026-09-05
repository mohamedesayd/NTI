module dec_2x4(
    input A, B,
    output reg C, D, E, F
);

    always @(*) begin
        case ({A, B})
            2'b00: {C,D, E, F} = 4'b1000;
            2'b01: {C,D, E, F} = 4'b0100;
            2'b10: {C,D, E, F} = 4'b0010;
            2'b11: {C,D, E, F} = 4'b0001;
        endcase
    end

endmodule