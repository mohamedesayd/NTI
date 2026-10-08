module top #(
    parameter P1 = 10
)(input in, output out);
    if (P1 == 10) begin
        mid1 u_mid1 (.in(in), .out(out));
    end else if (P1 == 20) begin
        mid2 #(.P1(P1)) u_mid2 (.in(in), .out(out));
    end else begin
        $error("Invalid parameter value");
    end
endmodule