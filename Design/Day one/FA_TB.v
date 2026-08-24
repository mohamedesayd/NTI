module FA_TB();
//input and output decleration     
reg A;
reg B; 
reg Cin;
wire S_B;
wire S_D;
wire S_G;
wire S_S;
wire Cout_B;
wire Cout_D;
wire Cout_G;
wire Cout_S;

integer i;

reg [6:0] corrects, errors;
//instantiation of the dut 
FA_B DUT  (A, B, Cin, S_B, Cout_B);
FA_D DUT1 (A, B, Cin, S_D, Cout_D);
FA_G DUT2 (A, B, Cin, S_G, Cout_G);
FA_S DUT3 (A, B, Cin, S_S, Cout_S);
//test vectors
initial begin
corrects =0;
errors =0;
for (i =0; i<50; i=i+1) begin 
    A = $random;
    B = $random;
    Cin = $random;
    #10;
    if ((S_B == A ^ B ^ Cin) && (Cout_B == ((A & B) | (Cin & (A ^ B)))))
        corrects = corrects + 1; 

    else begin  
        errors = errors + 1;
        $display ("Error for B!"); 
    end 
    if ((S_D == A ^ B ^ Cin) && (Cout_D == ((A & B) | (Cin & (A ^ B)))))
        corrects = corrects + 1; 

    else begin  
        errors = errors + 1;
        $display ("Error for D!"); 
    end 
    if ((S_G == A ^ B ^ Cin) && (Cout_G == ((A & B) | (Cin & (A ^ B)))))
        corrects = corrects + 1; 

    else begin  
        errors = errors + 1;
        $display ("Error for G!"); 
    end 
    if ((S_S == A ^ B ^ Cin) && (Cout_S == ((A & B) | (Cin & (A ^ B)))))
        corrects = corrects + 1; 

    else begin  
        errors = errors + 1;
        $display ("Error for S!"); 
    end 
    #10;
end
$stop;
end 
endmodule