class rand_lab;    
    rand bit [7:0] address;
    rand int len;
    constraint addr_const {address != 24; address != 60; address != 72;
                           address inside {[16:200]};
                           (address%4) == 0;};
    constraint len_const  {len dist {1:=50, [2:4]:/30, [5:8]:/20};};
endclass //rand_lab

module rand_lab_tb;
    rand_lab lab;
    initial begin 
        lab=new;

        for (int i =0; i <10; i ++) begin 
            assert (lab.randomize()); 
            $display("address: %p, len: %p", lab.address, lab.len);
        end 
    end 
endmodule