program test (arbiter_if.arb_modport intf);

    // Internal signals
    logic [7:0] buffer;

    initial begin 
        //reset the arbiter
        intf.rst = 1;
        #5;
        intf.rst = 0;
        //request from port 0
        intf.request[0] = 1;
        if (intf.grant[0] == 1) begin
            $display("Port 0 granted access");
        end else begin
            $display("Port 0 not granted access");
        end
        #5;
        intf.request[0] = 0;
        //request from port 1
        intf.request[1] = 1;
        if (intf.grant[1] == 1) begin
            $display("Port 1 granted access");
        end else begin
            $display("Port 1 not granted access");
        end
        #5;
        intf.request[1] = 0;
        //request from both ports
        intf.request[0] = 1;
        intf.request[1] = 1;
        if (intf.grant[0] == 1) begin
            $display("Port 0 granted access");
        end else begin
            $display("Port 0 not granted access");
        end
        if (intf.grant[1] == 1) begin
            $display("Port 1 granted access, but Port 0 has higher priority");
        end else begin
            $display("Port 1 not granted access; correct behavior since Port 0 has higher priority");
        end
        #5;
        intf.request[0] = 0;
        intf.request[1] = 0;
        $stop;
    end
endprogram