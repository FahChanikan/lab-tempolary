// Part 1: The 8:1 Multiplexer (Requirement for Exercise 4.8)
module mux8 (
    input  wire [7:0] d,     // 8 data inputs packed into a vector
    input  wire [2:0] s,     // 3 select lines (s2, s1, s0)
    output wire       y      // 1-bit output
);
    // Continuous assignment using index selection
    assign y = d[s]; 
endmodule

// Part 2: The implementation of Exercise 4.9
module exercise_4_9 (
    input  wire a, b, c,
    output wire y
);
    // Internal wire to hold the 8-bit truth table values
    wire [7:0] truth_table_values;

    // Based on the truth table derived for y = ab' + b'c + a'bc:
    // d0=0, d1=1, d2=0, d3=1, d4=1, d5=1, d6=0, d7=0
    assign truth_table_values = 8'b00111010; // Organized as [d7, d6, d5, d4, d3, d2, d1, d0]

    // Instantiate the 8:1 Mux
    mux8 structural_mux (
        .d(truth_table_values),
        .s({a, b, c}), // Concatenate a, b, c to form the 3-bit select signal
        .y(y)
    );

endmodule