module transmission_gate(
    inout x,y,
    input en_p, en_n
);

    pmos p1 (y, x, en_p);
    nmos n1 (y, x, en_n);

endmodule