module global_tb(
);
    
    reg A, B, Cin;
    integer i, errors;

    buf_using_xor  dut1  (A, Y_buf);
    and_using_nor  dut2  (A, B, Y_and_nor);
    and_using_nand dut3  (A, B, Y_and_nand);
    nand_using_mux dut4  (A, B, Y_nand_mux);
    or_using_mux   dut5  (A, B, Y_or_mux);
    or_using_nand  dut6 (A, B, Y_or_nand);
    xor_using_mux  dut7  (A, B, Y_xor_mux);
    HA_using_dec   dut8  (A, B, S_HAD, C_HAD);
    HA_using_mux   dut9  (A, B, S_HAM, C_HAM);
    FA_using_mux   dut10  (A, B, Cin, S_FA_mux, Cout_mux);
    FA_using_dec   dut11 (A, B, Cin, S_FA_dec, Cout_dec );

    initial begin
      A   = 1'b0;
      B   = 1'b0;
      Cin = 1'b0;
      errors = 0;
      for (i = 0; i <= 7; i = i + 1) begin
        {A, B, Cin} = i;
        
        #10;
        
        if (Y_buf == A) $display("Buffer Pass!");
        else begin
          $error("Buffer Failed");
          errors = errors +1;
        end
        
        if (Y_and_nand == (A & B)) $display("AND using NAND Pass");
        else begin 
          errors = errors +1;
          $error ("AND using NAND Failed");
        end 
        
        if (Y_and_nor == (A & B)) $display("AND using NOR Pass");
        else begin 
          errors = errors +1;
          $error ("AND using NOR Failed");
        end
        
        if (Y_nand_mux == !(A & B))$display("NAND using MUX Pass");
        else begin 
          errors = errors +1;
          $error ("NAND using MUX Failed");
        end

        if (Y_or_mux == (A | B))$display("OR using MUX Pass");
        else begin 
          errors = errors +1;
          $error ("OR using MUX Failed");
        end

        if (Y_or_nand == (A | B))$display("OR using NAND Pass");
        else begin 
          errors = errors +1;
          $error ("OR using NAND Failed");
        end

        if (Y_xor_mux == (A ^ B))$display("XOR using MUX Pass");
        else begin 
          errors = errors +1;
          $error ("XOR using MUX Failed");
        end

        if (S_HAD == (A ^ B))$display("Sum HA using DEC Pass");
        else begin 
          errors = errors +1;
          $error ("Sum HA using DEC Failed");
        end

        if (C_HAD == (A & B))$display("Carry HA using DEC Pass");
        else begin 
          errors = errors +1;
          $error ("Carry HA using DEC Failed");
        end

        if (S_HAM == (A ^ B))$display("Sum HA using MUX Pass");
        else begin 
          errors = errors +1;
          $error ("Sum HA using MUX Failed");
        end

        if (C_HAM == (A & B))$display("Carry HA using DEC Pass");
        else begin 
          errors = errors +1;
          $error ("Carry HA using MUX Failed");
        end

        if (S_FA_mux == (A ^ B ^ Cin))$display("Sum FA using MUX Pass");
        else begin 
          errors = errors +1;
          $error ("Sum HA using MUX Failed");
        end

        if (Cout_mux == (((A ^ B) & Cin) | (A & B))) $display("Carry FA using MUX Pass");
        else begin 
          errors = errors +1;
          $error ("Carry HA using MUX Failed");
        end

        if (S_FA_dec == (A ^ B ^ Cin))$display("Sum FA using DEC Pass");
        else begin 
          errors = errors +1;
          $error ("Sum HA using DEC Failed");
        end

        if (Cout_dec == (((A ^ B) & Cin) | (A & B))) $display("Carry FA using DEC Pass");
        else begin 
          errors = errors +1;
          $error ("Carry HA using DEC Failed");
        end
      end
      $display("=============================================");
      if (!errors) $display ("Test Passed; No Errors!!");
      else $display("There is some errors : %0d", errors);
      $display("=============================================");
      $stop;
    end
endmodule