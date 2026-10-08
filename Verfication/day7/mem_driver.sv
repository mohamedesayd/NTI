//`include "mem_txn.sv"
import pkg::*;
class mem_driver;
    mailbox #(mem_txn) mbx;
    virtual mem_if vif;
    mem_txn t;
    function new (mailbox #(mem_txn) mbx, virtual mem_if vif);
        this.mbx = mbx;
        this.vif = vif;
    endfunction //new()
    task run();
        forever begin
            t = new;
            mbx.get(t);
            //t.display("driver");
            @(posedge vif.cb)
            vif.rst_n    <= t.rst_n;
            vif.address  <= t.address;
            vif.data_in  <= t.data_in;
            vif.write_en <= t.write_en;
            vif.read_en  <= t.read_en;
        end
    endtask
endclass //mem_gen