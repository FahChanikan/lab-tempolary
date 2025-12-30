module boolean_a(
    input logic a,b,c,
    output logic y
);
    assign y = (a & c) | (~a & ~b & c);

endmodule