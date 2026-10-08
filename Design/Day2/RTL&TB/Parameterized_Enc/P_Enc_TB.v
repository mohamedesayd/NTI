module P_Enc_TB ();
    parameter out_no = 2;
    reg  [(1 << out_no) -1 : 0] in;
    wire [out_no -1:0] out;
    wire valid;
    integer i;

    P_Enc # (.out_no(out_no))DUT (in, out, valid);

    initial begin
      in =0;
      for ( i =0 ; i < 10 ; i = i + 1)
        # 10 in = $random;
    $stop;
    end
endmodule