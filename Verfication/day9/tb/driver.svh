import uvm_pkg::*;
import pkg::*;
`include "uvm_macros.svh"
//============================================
//==============driver class==================
//============================================
class driver extends uvm_driver #(sequence_item);
  `uvm_component_utils(driver)
  function new(string name = "driver", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  virtual intf vif;
  //------------------------------------------
  //--------------build phase-----------------
  //------------------------------------------
  function void build_phase(uvm_phase phase);
    // $display("I am in the build phase of driver class");
    super.build_phase(phase);
    req = sequence_item::type_id::create("req", this);
   assert(uvm_config_db#(virtual intf)::get(this, "", "vif", vif));
  endfunction

  //------------------------------------------
  //--------------connect phase---------------
  //------------------------------------------
  function void connect_phase(uvm_phase phase);
    // $display("I am in the connect phase of driver class");
    super.connect_phase(phase);
  endfunction

  //------------------------------------------
  //----------------run phase-----------------
  //------------------------------------------
  task run_phase(uvm_phase phase);
    // $display("I am in the run phase of driver class");
    super.run_phase(phase);
    forever begin
      seq_item_port.get_next_item(req);
      @(posedge vif.cb);
      vif.cb.rst_n     <= req.rst_n;
      vif.cb.write_en  <= req.write_en;
      vif.cb.read_en   <= req.read_en;
      vif.cb.address   <= req.address;
      vif.cb.data_in   <= req.data_in;
      seq_item_port.item_done();
    end
  endtask  //
endclass  //driver extends uvm_driver 
