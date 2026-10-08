class singlton;
    int a;
    local static singlton s;
    static function singlton new_singleton;
        if (s == null)
            s = new;
        return s;
    endfunction
    local function new ();
    endfunction 
endclass //packet

class packet;
    rand int data, addr;
    function new();
    endfunction

    virtual function print();
        $display("Data: %d, Address: %d", data, addr);
    endfunction
endclass //packet

class error_packet extends packet;
    rand bit [3:0] err_code;
    function print();
        $display("Data: %d, Address: %d, Error Code: %d", data, addr, err_code);
    endfunction
endclass //error_packet extends packet
module testbench2 (
);
    singlton s1, s2, s3;
    packet pkt;
    error_packet err_pkt;
    packet queue [$];
    initial begin 
        s1 = singlton :: new_singleton();
        s2 = singlton :: new_singleton();
        s3 = singlton :: new_singleton();
        s1.a = 5;
        //$display(s1.a, s2.a, s3.a);
        
        for (int i =0; i<10; i++) begin
            pkt = new();
        err_pkt = new();
            assert(pkt.randomize()); 
            assert(err_pkt.randomize());
            pkt.print();
            err_pkt.print();
            queue.push_back(pkt);
            queue.push_back(err_pkt);
        end
        $display("%p", queue, queue.size());
        foreach (queue[i]) queue[i].print();
    end
endmodule

