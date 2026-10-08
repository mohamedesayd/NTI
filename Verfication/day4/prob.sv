module mid2 #(
    parameter P1 = 10
)(input in, output out);
  case (P1)
    10: bot_a u1(.in(in), .out(out));
    20: bot_b u2(.in(in), .out(out));
    default: $error("Invalid parameter value");
  endcase
endmodule

module mid1 (input in, output out);
  genvar i;
  for(i = 0; i < 3; i++) begin : gen_mid2
    bot u_bot (.in(in), .out(out));
  end
endmodule