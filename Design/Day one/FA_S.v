module FA_S(A, B, Cin, S, Cout);

input A;
input B; 
input Cin;
output S;
output Cout;

wire W1, W2, W3;

HA_S u1 (A, B , W1, W2);
HA_S u2 (W1, Cin, S, W3);

assign Cout = W2 | W3;

endmodule 