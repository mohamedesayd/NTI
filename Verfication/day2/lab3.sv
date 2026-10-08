module lab3 (
);

    mailbox mb = new();
    typedef enum bit [1:0] {control, message, command} packet_type;
    typedef struct {
        int id;
        time t;
        packet_type ptype;
        bit [31:0] data;
    } strct;

    strct my_struct;
    task producer();
        //command
        my_struct.id = 0;
        my_struct.t = $time;
        my_struct.ptype = command;
        my_struct.data = $urandom();
        mb.put(my_struct);
        //control
        #10;
        my_struct.id = 1;
        my_struct.t = $time;
        my_struct.ptype = control;
        my_struct.data = $urandom();
        mb.put(my_struct);
        //message
        for(int i = 0; i < 8; i++) begin
            #10;
            my_struct.id = $urandom_range(2, 9);
            my_struct.t = $time;
            my_struct.ptype = message;
            my_struct.data = $urandom();
            mb.put(my_struct);
        end
    endtask

    task consumer();
        strct my_struct_c;
        for(int i = 0; i < 10; i++) begin
            #5;
            mb.get(my_struct_c);
            $display("id = %0d, time = %2t, packet_type = %0s, data = %0d", my_struct_c.id, my_struct_c.t, my_struct_c.ptype.name(), my_struct_c.data);
        end
    endtask

    initial begin
        fork
            producer();
            consumer();
        join
    end
endmodule