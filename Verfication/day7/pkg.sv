package pkg;
    parameter  DATA_WIDTH = 32;
    parameter  MEM_DEPTH  = 64;
    parameter  ADDR_WIDTH  = $clog2(MEM_DEPTH);
    parameter  CLK_PERIOD = 10; //ns
    `include "mem_txn.sv"
    `include "mem_gen.sv"
    `include "mem_driver.sv"
    `include "mem_monitor.sv" 
    `include "mem_coverage.sv"   
    `include "mem_scorboard.sv"
    `include "mem_env.sv"
endpackage