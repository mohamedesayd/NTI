import uvm_pkg::*;
`include "uvm_macros.svh"
module tb_top ();
  import uvm_pkg::*;
  import pkg::*;
  logic clk = 0;
  always #5 clk = ~clk;

  intf intf1 (clk);
  virtual itnf vif;
  test my_test;
  initial begin
    uvm_config_db#(virtual intf)::set(null, "uvm_test_top", "vif", intf1);
    run_test("test");
  end
endmodule
