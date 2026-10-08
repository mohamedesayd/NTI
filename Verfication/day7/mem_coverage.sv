import pkg::*;
class mem_coverage;
    covergroup cg;
        w_en: coverpoint t.write_en;
        r_en: coverpoint t.read_en;
        addr: coverpoint t.address {
            bins max_min [] = {'h0, 'hf};
            bins others = default;
        }
        w_add : cross w_en, addr;
        r_add : cross r_en, addr;
    endgroup
    mem_txn t;
    mailbox #(mem_txn) mbxcov;
    function new (mailbox #(mem_txn) mbxcov);
        cg  = new;
        this.mbxcov = mbxcov;    
    endfunction //new()

    task run();
        forever begin
            t =new;
            mbxcov.get(t);
            // t.display("cov");
            cg.sample();
        end
    endtask
endclass //mem_coverage