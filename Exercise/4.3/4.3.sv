module four_input_xor (
    input [3:0] a,
    output y
);
    assign y = ((a[3] ^ a[2]) ^ (a[1] ^ a[0]));
endmodule