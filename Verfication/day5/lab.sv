class rand_lab;    
    rand bit [7:0] address;
    //rand int len;

    rand bit error;

    rand int a;
    rand int b;
    rand int c;

    rand bit is_write;
    //rand bit [7:0] len;

    rand enum {READ, WRITE, BURST} cmd;
    rand int len;

    constraint enum_const {if (cmd == WRITE) len == 1;
                     else if (cmd == READ) len inside {1, 4};
                     else { 
                        len%4==0;
                        len inside {8, 32};
                          }};

    constraint is_write_const {(is_write)->(len inside {4, 16});
                               (!is_write)-> (len ==1);};

    constraint a_const {a inside {[0:40]};};
    constraint b_const {b inside {[0:40]};};
    constraint c_const {c inside {[0:40]};};
    constraint abc_const {a + b + c < 100;
                          unique {a, b, c};};
    constraint error_const {error dist {0:=90, 1:=10};};
    constraint addr_const {address != 24; address != 60; address != 72;
                           address inside {[16:200]};
                           (address%4) == 0;};
    //constraint len_const  {len dist {1:=50, [2:4]:/30, [5:8]:/20};};


endclass //rand_lab

module rand_lab_tb;
    rand_lab lab;
    initial begin 
        lab=new;

        for (int i =0; i <10; i ++) begin 
            assert (lab.randomize()); 
            $display("len: %p, a: %p, b: %p, c: %p", lab.address, lab.len, lab.a, lab.b, lab.c);
        end 
    end 
endmodule

class rand_lab2;
    // rand bit [7:0] arr [];

    // constraint arr_constr{arr.size inside {5, 10};
    //                       unique {arr};}

    // rand bit [3:0] arr [8];

    // constraint arr_constr {arr [0] == 0;
    //                        foreach (arr[i]) 
    //                        if (i !=0)
    //                         arr[i] != arr[i-1];
    //                         }
    // rand bit x;
    // rand bit [7:0] y;
    // constraint x_y_constr{(x==1)->(y==0);}

    rand bit[31:0] addr;
    constraint c_addr { $countones(addr) == 10;
                        foreach (addr[i]) 
                                if (addr[i] && (i != 31))
                                    addr[i+1] != 1 ;}
    
endclass //rand_lab2

module top2 (
);
    int a, b;
    covergroup group1;
        cover_1: coverpoint a {bins bin_1 [5] = {[0:4]};}
        coverpoint b;
    endgroup

    group1 g1 = new();
    rand_lab2 r_lab;
    
    initial begin
        r_lab = new();
        for (int i  =0  ; i < 10 ;i++ ) begin
        assert(r_lab.randomize());
        $display("addr: %b", r_lab.addr);
        end
        $display("%p", g1.cover_1);
    end
endmodule