module gray_2_bin_dec_TB ();

parameter WIDTH = 4;

reg [WIDTH -1 : 0] in;
wire [WIDTH -1 : 0] out;
integer i;

gray_2_bin_dec #(WIDTH) DUT (in, out);

initial begin
  in =0 ;
  for (i = 0 ; i < 10 ; i = i + 1) 
    #10 in = $random;

  $stop;

end
endmodule