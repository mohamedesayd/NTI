class pkt;
        rand bit [31:0] data;
        rand bit [7:0] addr;
    
    function new();    
    endfunction //new()
endclass //pkt
virtual class comm_component;
    pkt packet;
    static mailbox mbx;

    function new();
        mbx = new(1);
        packet =new();
    endfunction

    pure virtual function void initialize();

    pure virtual function void display();

    pure virtual task run();        

endclass

class transmitter extends comm_component;

    function void initialize();
        assert(packet.randomize());
        $display("The data and address are randomized: %0h, %0h", packet.data, packet.addr);
    endfunction

    function void display();
        $display("The transmitted data and address are: %0h, %0h", packet.data, packet.addr);
    endfunction 

    task run();
        while (1) begin
            #2;
            if (mbx.try_put(packet)) begin 
                display();
                break;
            end
        end    
    endtask
endclass //transmitter


class reciever extends comm_component;
    
    function void initialize();
    endfunction

    function void display();
        $display("The Stored data and address are: %0h, %0h", packet.data, packet.addr);
    endfunction 

    task run();
        while (1) begin 
            #2;
            if (mbx.try_get(packet)) begin 
                display;
                break;
            end
        end    
    endtask
endclass //reciever extends comm_component
module testbench (
);
    transmitter tx;
    reciever rx;

    initial begin
        tx = new;
        rx = new;
        tx.initialize();
        fork
            begin
                tx.run;
                tx.run;
                tx.run;
            end
            begin
                rx.run;
                #10;
                rx.run;
                rx.run;
            end
        join
    end    
endmodule