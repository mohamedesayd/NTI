interface arbiter_if(input logic clk);
    logic [1:0] request;
    logic [1:0] grant;
    logic rst;

    clocking cb @(posedge clk);
        default input #1 output #0;
        output request;
        input grant;
    endclocking

    modport arb_modport (clocking cb, output rst);
endinterface //arbiter_if