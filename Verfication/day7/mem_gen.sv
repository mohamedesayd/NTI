//`include "mem_txn.sv"
import pkg::*;
class mem_gen;
    mailbox #(mem_txn) mbx;
    mem_txn t;

    function new (mailbox #(mem_txn) mbx);
        this.mbx = mbx;
    endfunction //new()
    task run(int iteration_no);
            t=new;
            t.rst_n   ='0;
            t.address ='0;
            t.data_in ='0;
            t.write_en='0;
            t.read_en ='0;
            mbx.put(t.copy());
        for (int i = 0; i<iteration_no ; i ++) begin
            t = new;
            assert(t.randomize());
            //t.display();
            mbx.put(t.copy());
        end
    endtask
endclass //mem_gen