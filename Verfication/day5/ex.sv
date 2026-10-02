class className;
    function new();
        
    endfunction //new()

    randc int a;
    randc int b;
     constraint c1 { a dist {1:=1, 20:=2, 3:=3};}
endclass //className

module top;
    className obj;
    initial begin
        obj = new();
        for(int i=0; i<10; i++)
        if(!obj.randomize()) $display("Randomization failed");
        else $display("Randomized values: a=%0d, b=%0d", obj.a, obj.b);
    end
endmodule //top