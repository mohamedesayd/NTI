import uvm_pkg::*;
import pkg::*;
`include "uvm_macros.svh"
//============================================
//==============environment class=============
//============================================
class env extends uvm_env;
  `uvm_component_utils(env)
  function new(string name = "env", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  agent agnt;
  scoreboard scrbrd;
  subscriber sbscrber;
  virtual intf vif;
  //------------------------------------------
  //--------------build phase-----------------
  //------------------------------------------
  function void build_phase(uvm_phase phase);
    // $display("I am in the build phase of envinronment class");
    super.build_phase(phase);
    agnt = agent::type_id::create("agnt", this);
    scrbrd = scoreboard::type_id::create("scrbrd", this);
    sbscrber = subscriber::type_id::create("sbscrber", this);
    assert(uvm_config_db#(virtual intf)::get(this, "", "vif", vif));
    uvm_config_db#(virtual intf)::set(this, "agnt", "vif", vif);
  endfunction

  //------------------------------------------
  //--------------connect phase---------------
  //------------------------------------------
  function void connect_phase(uvm_phase phase);
    // $display("I am in the connect phase of envinronment class");
    super.connect_phase(phase);
  endfunction

  //------------------------------------------
  //----------------run phase-----------------
  //------------------------------------------
  task run_phase(uvm_phase phase);
    // $display("I am in the run phase of envinronment class");
    super.run_phase(phase);
  endtask  //
endclass  //env extends uvm_env
