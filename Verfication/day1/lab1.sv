module lab1(
);
    struct {
        string s;
        integer i;
        byte b;
        struct {
            event e;
            real r;
        } nst_strct;
    }strct;


    struct packed {
        logic [13:0] b;
        logic [13:0] a;
    } pstrct;

    //question 2
    bit [32:0] spa;
    string saa [9:0] ;
    typedef struct{
        string s ;
        event e;
        real r;
        bit [2:0] b;
    } my_struct;

    my_struct strct2[6];

    typedef struct {
        string s;
        event e;
        real r;
        bit [2:0] b;
    } ass_struct;

    ass_struct ass_array [string];

    string str_qeue [$];
    initial begin
        strct.nst_strct.r = 5.5;
        strct = '{s :"string",
                  i : 10,
                  b : 8,
                  nst_strct : '{r : 4.5, e : null}};
        pstrct = 10;
        $display("pstrct.a = %0d, pstrct.b = %0d", pstrct.a, pstrct.b);

        spa = 40;
        $display("spa [3:0] = %0d, spa [9] = %0d", spa[3:0], spa[9]);
        saa = '{"string1", 
                "string2", 
                "string3", 
                "string4", 
                "string5", 
                "string6", 
                "string7", 
                "string8", 
                "string9", 
                "string10"};
        strct2[0] = '{s : "string1", e : null, r : 1.1, b : 3'b001};
        $display("strct2[0].s = %s, strct2[0].r = %0f, strct2[0].b = %0d", strct2[0].s, strct2[0].r, strct2[0].b);

        ass_array ["hi"]= '{s: "hi", r: 4.2, e: null, b: 3'b100};
        ass_array ["hello"]= '{s: "hello", r: 0.2, e: null, b: 3'b010};
        ass_array ["hey"]= '{s: "hey", r: 1.2, e: null, b: 3'b001};

        $display("ass_array [\"hi\"].s = %s, ass_array [\"hi\"].r = %0f, ass_array [\"hi\"].b = %0d", ass_array ["hi"].s, ass_array ["hi"].r, ass_array ["hi"].b);
        $display("ass_array [\"hello\"].s = %s, ass_array [\"hello\"].r = %0f, ass_array [\"hello\"].b = %0d", ass_array ["hello"].s, ass_array ["hello"].r, ass_array ["hello"].b);
        $display("ass_array [\"hey\"].s = %s, ass_array [\"hey\"].r = %0f, ass_array [\"hey\"].b = %0d", ass_array ["hey"].s, ass_array ["hey"].r, ass_array ["hey"].b);
    
        str_qeue.push_front("string1");
        str_qeue.pop_back();
    end

endmodule

`timescale 1ns/1ps
module top();
    initial begin
        #10.2 $display("%0f",$time);
        #0.1  $display("%0f", $realtime);
    end
endmodule