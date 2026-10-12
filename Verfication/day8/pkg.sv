package pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"
  //============================================
  //===========sequence item class==============
  //============================================
  class sequence_item extends uvm_sequence_item;
    `uvm_object_utils(sequence_item)
    function new(string name = "sequence item");
      super.new(name);
    endfunction
  endclass  //sequence_item extends uvm_sequence_item



  //============================================
  //==============sequence class================
  //============================================
  class my_sequence extends uvm_sequence #(sequence_item);
    `uvm_object_utils(my_sequence)
    function new(string name);
      super.new(name);
    endfunction
    sequence_item seq_item;
  endclass




  //============================================
  //==============sequencer class===============
  //============================================
  class sequencer extends uvm_sequencer #(sequence_item);
    `uvm_component_utils(sequencer)
    function new(string name, uvm_component parent);
      super.new(name, parent);
    endfunction
    sequence_item seq_item;

    //------------------------------------------
    //--------------build phase-----------------
    //------------------------------------------
    function void build_phase(uvm_phase phase);
      $display("I am in the build phase of sequencer class");
      super.build_phase(phase);
      seq_item = sequence_item::type_id::create("seq_item", this);
    endfunction

    //------------------------------------------
    //--------------connect phase---------------
    //------------------------------------------
    function void connect_phase(uvm_phase phase);
      $display("I am in the connect phase of sequencer class");
      super.connect_phase(phase);
    endfunction

    //------------------------------------------
    //----------------run phase-----------------
    //------------------------------------------
    task run_phase(uvm_phase phase);
      $display("I am in the run phase of sequencer class");
      super.run_phase(phase);
    endtask  //
  endclass  //sequencer extends uvm_sequencer

  //============================================
  //==============driver class==================
  //============================================
  class driver extends uvm_driver #(sequence_item);
    `uvm_component_utils(driver)
    function new(string name, uvm_component parent);
      super.new(name, parent);
    endfunction
    //------------------------------------------
    //--------------build phase-----------------
    //------------------------------------------
    function void build_phase(uvm_phase phase);
      $display("I am in the build phase of driver class");
      super.build_phase(phase);
    endfunction

    //------------------------------------------
    //--------------connect phase---------------
    //------------------------------------------
    function void connect_phase(uvm_phase phase);
      $display("I am in the connect phase of driver class");
      super.connect_phase(phase);
    endfunction

    //------------------------------------------
    //----------------run phase-----------------
    //------------------------------------------
    task run_phase(uvm_phase phase);
      $display("I am in the run phase of driver class");
      super.run_phase(phase);
    endtask  //
  endclass  //driver extends uvm_driver 

  //============================================
  //===============monitor class================
  //============================================
  class monitor extends uvm_monitor;
    `uvm_component_utils(monitor)
    function new(string name, uvm_component parent);
      super.new(name, parent);
    endfunction
    //------------------------------------------
    //--------------build phase-----------------
    //------------------------------------------
    function void build_phase(uvm_phase phase);
      $display("I am in the build phase of monitor class");
      super.build_phase(phase);
    endfunction

    //------------------------------------------
    //--------------connect phase---------------
    //------------------------------------------
    function void connect_phase(uvm_phase phase);
      $display("I am in the connect phase of monitor class");
      super.connect_phase(phase);
    endfunction

    //------------------------------------------
    //----------------run phase-----------------
    //------------------------------------------
    task run_phase(uvm_phase phase);
      $display("I am in the run phase of monitor class");
      super.run_phase(phase);
    endtask  //
  endclass  //monitor extends uvm_monitor

  //============================================
  //===============agent class==================
  //============================================
  class agent extends uvm_agent;
    `uvm_component_utils(agent)
    function new(string name, uvm_component parent);
      super.new(name, parent);
    endfunction
    driver drvr;
    monitor mntr;
    sequencer seqr;
    //------------------------------------------
    //--------------build phase-----------------
    //------------------------------------------
    function void build_phase(uvm_phase phase);
      $display("I am in the build phase of agent class");
      super.build_phase(phase);
      drvr = driver::type_id::create("drvr", this);
      mntr = monitor::type_id::create("mntr", this);
      seqr = sequencer::type_id::create("seqr", this);
    endfunction

    //------------------------------------------
    //--------------connect phase---------------
    //------------------------------------------
    function void connect_phase(uvm_phase phase);
      $display("I am in the connect phase of agent class");
      super.connect_phase(phase);
    endfunction

    //------------------------------------------
    //----------------run phase-----------------
    //------------------------------------------
    task run_phase(uvm_phase phase);
      $display("I am in the run phase of agent class");
      super.run_phase(phase);
    endtask  //
  endclass  //agent extends uvm_agent

  //============================================
  //=============scoreboard class===============
  //============================================
  class scoreboard extends uvm_scoreboard;
    `uvm_component_utils(scoreboard)
    function new(string name, uvm_component parent);
      super.new(name, parent);
    endfunction
    //------------------------------------------
    //--------------build phase-----------------
    //------------------------------------------
    function void build_phase(uvm_phase phase);
      $display("I am in the build phase of scoreboard class");
      super.build_phase(phase);
    endfunction

    //------------------------------------------
    //--------------connect phase---------------
    //------------------------------------------
    function void connect_phase(uvm_phase phase);
      $display("I am in the connect phase of scoreboard class");
      super.connect_phase(phase);
    endfunction

    //------------------------------------------
    //----------------run phase-----------------
    //------------------------------------------
    task run_phase(uvm_phase phase);
      $display("I am in the run phase of scoreboard class");
      super.run_phase(phase);
    endtask  //
  endclass  //scoreboard extends uvm_scoreboard

  //============================================
  //=============subscriber class===============
  //============================================
  class subscriber extends uvm_subscriber #(int);
    `uvm_component_utils(subscriber)
    function new(string name, uvm_component parent);
      super.new(name, parent);
    endfunction
    virtual function void write(T t);
    endfunction
    //------------------------------------------
    //--------------build phase-----------------
    //------------------------------------------
    function void build_phase(uvm_phase phase);
      $display("I am in the build phase of subscriber class");
      super.build_phase(phase);
    endfunction

    //------------------------------------------
    //--------------connect phase---------------
    //------------------------------------------
    function void connect_phase(uvm_phase phase);
      $display("I am in the connect phase of subscriber class");
      super.connect_phase(phase);
    endfunction

    //------------------------------------------
    //----------------run phase-----------------
    //------------------------------------------
    task run_phase(uvm_phase phase);
      $display("I am in the run phase of subscriber class");
      super.run_phase(phase);
    endtask  //
  endclass  //subscriber extends uvm_subscriber

  //============================================
  //==============environment class=============
  //============================================
  class env extends uvm_env;
    `uvm_component_utils(env)
    function new(string name, uvm_component parent);
      super.new(name, parent);
    endfunction
    agent agnt;
    scoreboard scrbrd;
    subscriber sbscrber;
    //------------------------------------------
    //--------------build phase-----------------
    //------------------------------------------
    function void build_phase(uvm_phase phase);
      $display("I am in the build phase of envinronment class");
      super.build_phase(phase);
      agnt = agent::type_id::create("agnt", this);
      scrbrd = scoreboard::type_id::create("scrbrd", this);
      sbscrber = subscriber::type_id::create("sbscrber", this);
    endfunction

    //------------------------------------------
    //--------------connect phase---------------
    //------------------------------------------
    function void connect_phase(uvm_phase phase);
      $display("I am in the connect phase of envinronment class");
      super.connect_phase(phase);
    endfunction

    //------------------------------------------
    //----------------run phase-----------------
    //------------------------------------------
    task run_phase(uvm_phase phase);
      $display("I am in the run phase of envinronment class");
      super.run_phase(phase);
    endtask  //
  endclass  //env extends uvm_env

  //============================================
  //=================test class=================
  //============================================
  class test extends uvm_test;
    `uvm_component_utils(test)
    function new(string name, uvm_component parent);
      super.new(name, parent);
    endfunction
    env enviroment;
    my_sequence seq;
    //------------------------------------------
    //--------------build phase-----------------
    //------------------------------------------
    function void build_phase(uvm_phase phase);
      $display("I am in the build phase of test class");
      super.build_phase(phase);
      enviroment = env::type_id::create("env", this);
    endfunction

    //------------------------------------------
    //--------------connect phase---------------
    //------------------------------------------
    function void connect_phase(uvm_phase phase);
      $display("I am in the connect phase of test class");
      super.connect_phase(phase);
    endfunction

    //------------------------------------------
    //----------------run phase-----------------
    //------------------------------------------
    task run_phase(uvm_phase phase);
      $display("I am in the run phase of test class");
      super.run_phase(phase);
    endtask  //
  endclass  //test extends uvm_test
endpackage

interface intf;

endinterface  //intf

module tb_top ();
  intf intf1;
  virtual itnf vif;
  initial begin
    uvm_config_db#(virtual intf)::set(this, "*", "vif", vif);
    run_test();
  end
endmodule
