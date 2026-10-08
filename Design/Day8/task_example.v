module task_example(
);
    task buggy (input [3:0] delay);
        reg [3:0] local_delay;
        begin local_delay = delay;
        #(local_delay)
        $display("time: %0t, local_delay: %0d", $time, local_delay);
        end
    endtask
    initial buggy (5);
    initial buggy (2);
endmodule