module transmission_gate_tb();
    
    reg en, x;
    wire x_in, y, en_b;

    not #(1) u1 (en_b, en);
    transmission_gate dut (x_in, y, en, en_b);
    assign x_in = x;

    initial begin
            x  =0;
            en =0;
        #10 x  =1;
        #10 en =1;
        #10 x  =0;
        #10 $stop;
    end

endmodule