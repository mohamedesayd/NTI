module dec_3x8(
    input A, B, C, 
    output reg D, E, F, G, H, I, J, K
);
    always @* begin
        case ({A, B, C})
            3'd0:{D, E, F, G, H, I, J, K} = 8'b10000000;
            3'd1:{D, E, F, G, H, I, J, K} = 8'b01000000;
            3'd2:{D, E, F, G, H, I, J, K} = 8'b00100000;
            3'd3:{D, E, F, G, H, I, J, K} = 8'b00010000;
            3'd4:{D, E, F, G, H, I, J, K} = 8'b00001000;
            3'd5:{D, E, F, G, H, I, J, K} = 8'b00000100;
            3'd6:{D, E, F, G, H, I, J, K} = 8'b00000010;
            3'd7:{D, E, F, G, H, I, J, K} = 8'b00000001;
        endcase
    end
endmodule