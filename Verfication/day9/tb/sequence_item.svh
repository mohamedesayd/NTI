import uvm_pkg::*;
import pkg::*;
`include "uvm_macros.svh"
//============================================
//===========sequence item class==============
//============================================
class sequence_item extends uvm_sequence_item;
  `uvm_object_utils(sequence_item)
  rand logic                  rst_n;
  rand logic                  write_en;
  rand logic                  read_en;
  rand logic [ADDR_WIDTH-1:0] address;
  rand logic [DATA_WIDTH-1:0] data_in;
       logic [DATA_WIDTH-1:0] data_out;
       logic                  valid_out;

  constraint rst_n_const {
    rst_n dist {
      1 := 99,
      0 := 1
    };
  }
  ;
  constraint write_en_const {
    write_en dist {
      1 := 1,
      0 := 1
    };
  }
  ;
  constraint read_en_const {
    read_en dist {
      1 := 1,
      0 := 1
    };
  }
  ;
  constraint write_en_read_en {unique {write_en, read_en};};

  function new(string name = "sequence item");
    super.new(name);
  endfunction

  function void print();
    $display("rst_n:%0d, write_en:%0d, read_en:%0d, address:%0d, data_in:%0d, data_out:%0d, valid_out:%0d", rst_n, write_en, read_en, address, data_in, data_out, valid_out);
  endfunction
endclass  //sequence_item extends uvm_sequence_item
