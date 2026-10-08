module rgb_generator(
    output [16:0]address,
    input [9:0] v_counter, h_counter
);
    assign address = ((v_counter <= 480) && (h_counter <= 640))?
                    ((v_counter >> 1) * 320 + (h_counter >> 1)): 17'hffff;
endmodule