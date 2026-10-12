import uvm_pkg::*;
import pkg::*;
`include "uvm_macros.svh"
//============================================
//===============monitor class================
//============================================
class monitor extends uvm_monitor;
  `uvm_component_utils(monitor)
  uvm_analysis_port #(sequence_item) analysis_port;
  function new(string name = "monitor", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  virtual intf  vif;
  sequence_item seq_item;
  //------------------------------------------
  //--------------build phase-----------------
  //------------------------------------------
  function void build_phase(uvm_phase phase);
    // $display("I am in the build phase of monitor class");
    super.build_phase(phase);
    assert(uvm_config_db#(virtual intf)::get(this, "", "vif", vif));
    analysis_port = new("analysis_port", this);
    seq_item = new("seq_item");
  endfunction

  //------------------------------------------
  //--------------connect phase---------------
  //------------------------------------------
  function void connect_phase(uvm_phase phase);
    // $display("I am in the connect phase of monitor class");
    super.connect_phase(phase);
  endfunction

  //------------------------------------------
  //----------------run phase-----------------
  //------------------------------------------
  task run_phase(uvm_phase phase);
    // $display("I am in the run phase of monitor class");
    super.run_phase(phase);
    forever begin
      @(posedge vif.cb);
      seq_item.rst_n   <= vif.rst_n   ;
      seq_item.write_en<= vif.write_en;
      seq_item.read_en <= vif.read_en ;
      seq_item.address <= vif.address ;
      seq_item.data_in <= vif.data_in ;
      analysis_port.write(seq_item);

    end
  endtask  //
endclass  //monitor extends uvm_monitor
