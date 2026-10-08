import pkg::*;
class mem_txn;
    rand logic rst_n;
    rand logic write_en;
    rand logic read_en;
    rand logic [ADDR_WIDTH-1:0] address;
    rand logic [DATA_WIDTH-1:0] data_in;
         logic [DATA_WIDTH-1:0] data_out;
         logic valid_out;

    constraint rst_n_const {rst_n dist {0:=1, 1:=99};};
    constraint write_en_const {write_en dist {1:=1, 0:=1};};
    constraint read_en_const {read_en dist {1:=1, 0:=1};};

    function new();
        
    endfunction //new()

    function void display(string s="null");
        $display("%0s:::: rst_n: %d, write_en: %d, read_en: %d, address: %d, data_in: %d, data_out: %d", 
                  s, rst_n, write_en, read_en, address, data_in, data_out);
    endfunction

    function mem_txn copy;
        copy =new();
        copy.rst_n    = rst_n;
        copy.address  = address;
        copy.data_in  = data_in;
        copy.data_out = data_out;
        copy.write_en = write_en;
        copy.read_en  = read_en; 
        
    endfunction
endclass //mem_txn