import uvm_pkg::*;
import pkg::*;
`include "uvm_macros.svh"
//============================================
//==============sequence class================
//============================================
class my_sequence extends uvm_sequence #(sequence_item);
  `uvm_object_utils(my_sequence)
  function new(string name = "my_sequence");
    super.new(name);
  endfunction
  task body();
      req = sequence_item::type_id::create("req");
      start_item(req);
      req.rst_n = 0;
      finish_item(req);
    for (int i = 0; i < 10; i++) begin
      req = sequence_item::type_id::create("req");
      start_item(req);
      assert (req.randomize());
      finish_item(req);
    end
  endtask
endclass
