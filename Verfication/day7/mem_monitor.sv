//`include "mem_txn.sv"
import pkg::*;
class mem_monitor;
    mailbox #(mem_txn) mbxsb, mbxcov;
    virtual mem_if vif;
    mem_txn t;
            
    function new (mailbox #(mem_txn) mbxcov, mailbox #(mem_txn) mbxsb, virtual mem_if vif);
        this.mbxcov = mbxcov;
        this.mbxsb = mbxsb;
        this.vif = vif;
    endfunction //new()
    task run();
        forever begin
            @(posedge vif.cb)
            t = new;
            // $display("rst_n: %d, write_en: %d, read_en: %d, address: %d, data_in: %d, data_out: %d",
            //           vif.rst_n, vif.write_en, vif.read_en, vif.address, vif.data_in, vif.data_out);
            t.rst_n   = vif.rst_n   ;
            t.address = vif.address ;
            t.data_in = vif.data_in ;
            t.write_en= vif.write_en;
            t.read_en = vif.read_en ;
            t.data_out= vif.data_out;
            // $display("%0b", t.rst_n);
            // t.display("monitor");
            mbxsb.put(t);
            // t.display("mon");
            mbxcov.put(t);
        end
    endtask
endclass //mem_gen