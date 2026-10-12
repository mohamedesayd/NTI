import uvm_pkg::*;
import pkg::*;
`include "uvm_macros.svh"
//============================================
//=============scoreboard class===============
//============================================
class scoreboard extends uvm_scoreboard;
  `uvm_component_utils(scoreboard)
  function new(string name = "scoreboard", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  //------------------------------------------
  //--------------build phase-----------------
  //------------------------------------------
  function void build_phase(uvm_phase phase);
    // $display("I am in the build phase of scoreboard class");
    super.build_phase(phase);
  endfunction

  //------------------------------------------
  //--------------connect phase---------------
  //------------------------------------------
  function void connect_phase(uvm_phase phase);
    // $display("I am in the connect phase of scoreboard class");
    super.connect_phase(phase);
  endfunction

  //------------------------------------------
  //----------------run phase-----------------
  //------------------------------------------
  task run_phase(uvm_phase phase);
    // $display("I am in the run phase of scoreboard class");
    super.run_phase(phase);
  endtask  //
endclass  //scoreboard extends uvm_scoreboard
