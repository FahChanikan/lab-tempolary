module mux8(
    input wire a, b, c,
    output wire y
);

    mux8 mux_inst(
        .s({a})
    )