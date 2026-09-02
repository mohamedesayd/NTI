module stream_parity_gen_tb(
);
    
    reg clk, rst, serial_in;
    wire parity_out;

    integer corrects;
    stream_parity_gen dut (clk, rst, serial_in, parity_out);

    initial begin
        clk =0;
        forever #5 clk = ~clk;
    end


    initial begin
        reset;
        stimulus_gen;   
        $stop;     
    end



    task reset ();
        begin
            rst =1;
            corrects =0;
            serial_in=0;
            #15 rst =0;
        end
    endtask

    task serial_byte(input [7:0] in);
        integer i;
        for (i=0; i<8; i = i +1) begin
           @(negedge clk) serial_in = in [i] ;
        end 
    endtask

    task checker(input [7:0] stim);
        begin
            @(negedge clk);
            if (parity_out != ^stim)
                $fatal ("Your design doesn't work ;)");
            else
                corrects = corrects +1; 
        end
    endtask

    task stimulus_gen();
        integer j;
        for (j=0; j< (2**8); j=j+1) begin
            serial_byte(j);
            checker (j);
        end
    endtask
endmodule