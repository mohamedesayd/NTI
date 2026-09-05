// module P_Enc #(
//     parameter out_no = 2
// ) (
//     input [(1 << out_no) -1 : 0] in,
//     output reg [out_no -1:0] out,
//     output reg valid
// );
//     integer i ;
//   //  reg p; 
//     always @ * begin
//    //     p = 1'b0;
//         out = {1 << out_no {1'b0}};
//         for (i = 0  ; i < (2 ** out_no) ; i = i + 1 ) begin
//            // if (in [i] && ~p) begin 
//             if (in [i]) begin 
//                 out = i;
//    //             p = 1'b1;
//             end
//         end
//     end
// endmodule

module P_Enc #(
    parameter out_no = 2
) (
    input [(1 << out_no) -1 : 0] in,
    output reg [out_no -1:0] out,
    output  valid
);
    integer i ;
    always @ * begin
        out = {1 << out_no {1'b0}};
        for (i = 0  ; i < (2 ** out_no) ; i = i + 1 ) begin
            if (in [i]) begin 
                out = i;
            end
        end
    end
    assign valid = ~(in == {(1 << out_no) {1'b0}});
endmodule