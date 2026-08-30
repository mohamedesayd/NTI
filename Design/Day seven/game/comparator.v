module comparator(
    input [9:0] leds, sw,
    output loser, boss
);
    assign boss = (leds == sw);
    assign loser = (leds != sw);
endmodule