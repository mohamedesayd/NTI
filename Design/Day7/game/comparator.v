module comparator(
    input [9:0] leds, sw,
    output loser, boss
);
    assign boss = (sw == 10'b0000000000)? 0:  (leds == sw);
    assign loser = (sw == 10'b0000000000)? 0 :(leds != sw);
endmodule