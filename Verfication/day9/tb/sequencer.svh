import uvm_pkg::*;
import pkg::*;
`include "uvm_macros.svh"
//============================================
//==============sequencer class===============
//============================================
class sequencer extends uvm_sequencer #(sequence_item);
  `uvm_component_utils(sequencer)
  function new(string name = "sequencer", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  sequence_item seq_item;

  //------------------------------------------
  //--------------build phase-----------------
  //------------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    seq_item = sequence_item::type_id::create("seq_item", this);
  endfunction

  //------------------------------------------
  //--------------connect phase---------------
  //------------------------------------------
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction

  //------------------------------------------
  //----------------run phase-----------------
  //------------------------------------------
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
  endtask  //
endclass  //sequencer extends uvm_sequencer
