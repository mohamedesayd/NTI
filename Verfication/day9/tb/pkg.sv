package pkg;
  parameter DATA_WIDTH = 32;
  parameter MEM_DEPTH = 64;
  parameter ADDR_WIDTH = $clog2(MEM_DEPTH);
  `include "sequence_item.svh"
  `include "sequence.svh"
  `include "sequencer.svh"
  `include "driver.svh"
  `include "monitor.svh"
  `include "agent.svh"
  `include "scoreboard.svh"
  `include "subscriber.svh"
  `include "env.svh"
  `include "test.svh"
endpackage
