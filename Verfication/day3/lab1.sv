module q1 (
);
    bit signed [7:0] a;
    bit unsigned [15:0] b;

    bit signed [7:0] c;
    bit unsigned [15:0] d;
    initial begin
        a = -5;
        b = 600;
        $display("a = %0d, b = %0d", a, b);
        c = unsigned'(a);
        d = 8'(b);
        $display("c = %0d, d = %0d", c, d);
        c = a;
        d = a;
        $display("c = %0d, d = %0d", c, d);

    end
endmodule

module q2 (
);
    bit [31:0] a;
    bit [15:0] b;
    bit [63:0] c;

    initial begin 
        a = 32'hFFFFFFFF;
        b = 16'(a);
        c = 63'(a);
        $display("a = %0d, b = %0d, c = %0d", a, b, c);
        a = 32'(b);
        $display("a = %0d", a);
    end 
endmodule

module q3();
    typedef enum bit [1:0] {control, message, command} state_t;
    state_t state;
    int a;
    initial begin
        a =2;
        state = state_t'(a);
        $display("state = %0s, a = %0d", state.name(), a);
        a = int'(state);
        $display("state = %0s, a = %0d", state.name(), a);
        a =7;
        state = state_t'(a);
        $display("state = %0s, a = %0d", state.name(), a);
        a = int'(state);
        $display("state = %0s, a = %0d", state.name(), a);
    end
endmodule

module q4();
    typedef struct packed {
        logic [5:0] opcode;
        logic [4:0] rs;
        logic [4:0] rt;
        logic [15:0] imm;
    } instruction;

    instruction inst;
    logic [31:0] inst_int;
    initial begin
        inst = '{opcode : 6'b000000, rs : 5'b00010, rt : 5'b00011, imm : 16'hFFFF};
        inst_int = 32'b000000_00010_00011_0000000000011111;

        $display("opcode = %0b, rs = %0b, rt = %0b, imm = %0h", inst.opcode, inst.rs, inst.rt, inst.imm);
        $display("inst_int = %32b", inst_int);

        $display("==============================assignment==============================");
        inst = instruction'(inst_int);
        $display("opcode = %0b, rs = %0b, rt = %0b, imm = %0h", inst.opcode, inst.rs, inst.rt, inst.imm);
        $display("inst_int = %32b", inst_int);

        $display("==============================assignment==============================");
        inst_int = int'(inst);
        $display("opcode = %0b, rs = %0b, rt = %0b, imm = %0h", inst.opcode, inst.rs, inst.rt, inst.imm);
        $display("inst_int = %32b", inst_int);
    end
endmodule

module q5();
    real a;
    shortreal b;

    initial begin
        a = 3.14159265358979323846141592653589793238461415926535897932384622222222222222222222222222;
        b = shortreal'(a);
        $display("a = %0.64f, \n b = %0.64f", a, b);
        a = real'(b);
        $display("a = %0.64f, \n b = %0.64f", a, b);
    end
endmodule

module q6();
    int qeue[$];
    byte unsigned b [5];
    initial begin
        qeue = '{1, 2, 3, 4, 5000};
        $display("qeue = %p", qeue);
        foreach(qeue[i]) begin
            $cast(b[i], qeue[i]);
        end
        $display("qeue = %p, b = %p", qeue, b);
    end
endmodule