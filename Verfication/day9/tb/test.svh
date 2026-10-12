import uvm_pkg::*;
import pkg::*;
`include "uvm_macros.svh"
//============================================
//=================test class=================
//============================================
class test extends uvm_test;
  `uvm_component_utils(test)
  function new(string name = "test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  env environment;
  virtual intf vif;
  //------------------------------------------
  //--------------build phase-----------------
  //------------------------------------------
  function void build_phase(uvm_phase phase);
    // $display("I am in the build phase of test class");
    super.build_phase(phase);
    environment = env::type_id::create("environment", this);
    assert (uvm_config_db#(virtual intf)::get(this, "", "vif", vif));
    uvm_config_db#(virtual intf)::set(this, "environment", "vif", vif);
  endfunction

  //------------------------------------------
  //--------------connect phase---------------
  //------------------------------------------
  function void connect_phase(uvm_phase phase);
    // $display("I am in the connect phase of test class");
    super.connect_phase(phase);
  endfunction

  //------------------------------------------
  //----------------run phase-----------------
  //------------------------------------------
  task run_phase(uvm_phase phase);
    // $display("I am in the run phase of test class");
    my_sequence seq;
    super.run_phase(phase);
    seq = my_sequence::type_id::create("seq");
    phase.raise_objection(this);
    seq.start(environment.agnt.seqr);
    phase.drop_objection(this);
  endtask  //
endclass  //test extends uvm_test
