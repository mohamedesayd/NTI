module gray_2_bin_dec # (parameter WIDTH = 8)(
    input [WIDTH -1 : 0]  in,
    output reg [WIDTH -1 : 0] out
);
    integer i;
    always @(*) begin
        out [WIDTH - 1] = in [WIDTH -1];
        for (i = (WIDTH -2) ; i >= 0 ; i = i - 1)
            out [i] = in [i] ^ out [i + 1];
    end
endmodule