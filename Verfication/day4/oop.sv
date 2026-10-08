class parent;
    int a;
    function new(int a = 0);
        this.a = a;
    endfunction

    function void display();
        $display("Parent: Value of a is %0d", a);
    endfunction
endclass

class child extends parent;
    int b;
    int mul;
    int a;
    function new(int mul = 0, int b = 0);
        super.new(3);
        this.b = b;
        this.mul = mul;
        a = 7;
        $display("child: value of a is %0d", a);
    endfunction
    
    function void multiplier();
        $display("Child: Value of b is %0d", b);
        mul = a * b;
        $display("Child: Value of mul is %0d", mul);
    endfunction 
endclass

module top_oop;
    parent p;
    child c;
    initial begin
        p = new(5);
        p.display();

        c = new(10, 3);
        c.display();
        c.multiplier();
    end
endmodule