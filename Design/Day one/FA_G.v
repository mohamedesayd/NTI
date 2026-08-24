module FA_G(A, B, Cin, S, Cout);

input A;
input B; 
input Cin;
output S;
output Cout;

xor (W0, A, B);
xor (S, W0, Cin);
or (Cout, W1, W2);
and (W1, A, B);
and (W2, Cin, W0);


endmodule 