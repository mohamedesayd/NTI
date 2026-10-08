import pkg::*;
class mem_scorboard;
    mem_txn t;
    mailbox #(mem_txn) mbx;
    function new(mailbox #(mem_txn) mbx);
        this.mbx = mbx;
    endfunction //new()

    task run();
        forever begin
            t = new;
            mbx.get(t);
            // t.display("sb");        
        end
    endtask
endclass //scorboard