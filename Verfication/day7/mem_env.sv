import pkg::*;
class mem_env;
    mem_driver driver;
    mem_gen gen;
    mem_monitor monitor;
    mem_coverage coverage;
    mem_scorboard scorboard;
    virtual mem_if vif;
    mailbox #(mem_txn) gen2driver;
    mailbox #(mem_txn) monitor2cov;
    mailbox #(mem_txn) monitor2sb;
    function new(virtual mem_if vif);
        gen2driver =new;
        monitor2cov=new;
        monitor2sb =new;
        scorboard=new(monitor2sb);
        coverage =new(monitor2cov);
        driver   =new(gen2driver, vif);
        monitor  =new(monitor2cov, monitor2sb, vif);
        gen      =new(gen2driver);
    endfunction //new()

    task run();
        fork
            driver.run;
            monitor.run;
            scorboard.run;
            coverage.run;
            gen.run(300);
        join
    endtask
endclass //mem_env