import uvm_pkg::*;
import pkg::*;
`include "uvm_macros.svh"
//============================================
//=============subscriber class===============
//============================================
class subscriber extends uvm_subscriber #(sequence_item);
  `uvm_component_utils(subscriber)
  sequence_item seq_item;
  covergroup cg;
    w_en: coverpoint seq_item.write_en;
    r_en: coverpoint seq_item.read_en;
    addr: coverpoint seq_item.address {bins max_min[] = {'h0, 'hf}; bins others = default;}
    w_add : cross w_en, addr;
    r_add : cross r_en, addr;
  endgroup
  function new(string name = "subscriber", uvm_component parent = null);
    super.new(name, parent);
    cg = new();
  endfunction
  virtual function void write(T t);
    $cast(this.seq_item, t.clone());
    seq_item = new("seq_item");
    seq_item.print();
    cg.sample();
  endfunction
  //------------------------------------------
  //--------------build phase-----------------
  //------------------------------------------
  function void build_phase(uvm_phase phase);
    // $display("I am in the build phase of subscriber class");
    super.build_phase(phase);
  endfunction

  //------------------------------------------
  //--------------connect phase---------------
  //------------------------------------------
  function void connect_phase(uvm_phase phase);
    // $display("I am in the connect phase of subscriber class");
    super.connect_phase(phase);
  endfunction

  //------------------------------------------
  //----------------run phase-----------------
  //------------------------------------------
  task run_phase(uvm_phase phase);
    // $display("I am in the run phase of subscriber class");
    super.run_phase(phase);
  endtask  //
endclass  //subscriber extends uvm_subscriber
