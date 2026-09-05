module Dec_TB ();

    localparam  input_no = 2 ;
    integer i ;
reg [input_no - 1 : 0 ] in;
wire [(2 ** input_no) -1 : 0] out;

Dec DUT (in, out);

initial begin 
    in =0;
    for(i = 0 ; i < 10 ; i = i + 1) begin 
        #5 in = $random;
    end
    $stop; 
end 
endmodule