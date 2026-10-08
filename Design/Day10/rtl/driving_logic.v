module driving_logic (
    input  [3:0] button,
    input  [1:0] sw,
    output [3:0] leds,
    output [2:0] rgb1,
    rgb2
);

  assign leds = button;
  assign rgb1 = {1'b0, sw};
  assign rgb2 = {1'b0, sw};

endmodule
