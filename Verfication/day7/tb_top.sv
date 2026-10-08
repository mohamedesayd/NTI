import pkg::*;
module tb_top (
);
    logic clk = 0;
    initial begin
    forever #(CLK_PERIOD/2) clk = ~clk;    
    end
    mem_if #(
        DATA_WIDTH, MEM_DEPTH
    ) vif  (
        .clk(clk)
    );
    memory #(
        DATA_WIDTH, MEM_DEPTH
    ) dut (
        .clk      (vif.clk      ),
        .rst_n    (vif.rst_n    ),
        .write_en (vif.write_en ),
        .read_en  (vif.read_en  ),
        .address  (vif.address  ),
        .data_in  (vif.data_in  ),
        .data_out (vif.data_out ),
        .valid_out(vif.valid_out)
    );
    mem_env env;
    initial begin
        env = new(vif);
        fork
            env.run();
            #2000 $stop;
        join
    end
endmodule