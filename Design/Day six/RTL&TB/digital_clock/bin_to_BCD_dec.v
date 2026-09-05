module bin_to_BCD_dec(
    input [7:0]bin,
    output [3:0] bcd2, bcd1,bcd0
);
    wire [3:0] w1, w2, w3, w4, w6;

    conditional_adder u1 ({1'b0,    bin[7:5]}, w1);
    conditional_adder u2 ({w1[2:0], bin[4]},   w2);
    conditional_adder u3 ({w2[2:0], bin[3]},   w3);
    conditional_adder u4 ({w3[2:0], bin[2]},   w4);
    conditional_adder u5 ({w4[2:0], bin[1]},{bcd1[0], bcd0[3:1]});
    conditional_adder u6 ({1'b0, w1[3], w2[3], w3[3]}, w6);
    conditional_adder u7 ({w6[2:0], w4[3]},{bcd2[0], bcd1[3:1]});
    assign bcd0 [0] = bin [0];
    assign bcd2 [3:1] = {2'b00, w6[3]};
endmodule