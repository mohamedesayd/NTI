module digital_clock(
    input clk, rst_n,
    output reg [5:0] ss, mm, hh
);
    always @(posedge clk, negedge rst_n) begin
        if (~rst_n) begin 
            ss <=6'b000000;
            mm <=6'b000000;
            hh <=6'b000000;
        end
        else begin
            if (ss == 59) begin
                ss <= 6'd0;
                if (mm == 59) begin
                    mm <= 6'd0;
                    if (hh == 23) begin
                        hh <= 6'd0;
                    end
                    else begin
                      hh <= hh + 6'd1;
                    end
                end
                else begin
                    mm <= mm+ 6'd1;
                end 
            end
            else begin
                ss <= ss + 6'd1;
            end
        end
    end
endmodule