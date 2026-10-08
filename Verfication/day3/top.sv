module top ;
    logic clk =0;
    always #5 clk = ~clk;
    arbiter_if arb_if(clk);
    arb_port arb_port_inst(.grant(arb_if.grant), 
                           .request(arb_if.request), 
                           .rst(arb_if.rst), 
                           .clk(clk));
    test test_inst(arb_if.arb_modport);
endmodule