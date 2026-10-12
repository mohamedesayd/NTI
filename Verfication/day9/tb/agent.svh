import uvm_pkg::*;
import pkg::*;
`include "uvm_macros.svh"
//============================================
//===============agent class==================
//============================================
class agent extends uvm_agent;
  `uvm_component_utils(agent)
  function new(string name = "agent", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  driver drvr;
  monitor mntr;
  sequencer seqr;
  virtual intf vif;
  //------------------------------------------
  //--------------build phase-----------------
  //------------------------------------------
  function void build_phase(uvm_phase phase);
    // $display("I am in the build phase of agent class");
    super.build_phase(phase);
    drvr = driver::type_id::create("drvr", this);
    mntr = monitor::type_id::create("mntr", this);
    seqr = sequencer::type_id::create("seqr", this);
    assert (uvm_config_db#(virtual intf)::get(this, "", "vif", vif));
    uvm_config_db#(virtual intf)::set(this, "drvr", "vif", vif);
    uvm_config_db#(virtual intf)::set(this, "mntr", "vif", vif);
  endfunction

  //------------------------------------------
  //--------------connect phase---------------
  //------------------------------------------
  function void connect_phase(uvm_phase phase);
    // $display("I am in the connect phase of agent class");
    super.connect_phase(phase);
    drvr.seq_item_port.connect(seqr.seq_item_export);
  endfunction

  //------------------------------------------
  //----------------run phase-----------------
  //------------------------------------------
  task run_phase(uvm_phase phase);
    // $display("I am in the run phase of agent class");
    super.run_phase(phase);
  endtask  //
endclass  //agent extends uvm_agent
