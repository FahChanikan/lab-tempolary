`timescale 1ns / 1ps

module tb_exercise_4_9();

    // Inputs
    reg a, b, c;
    // Outputs
    wire y;

    // Instantiate the Unit Under Test (UUT)
    exercise_4_9 uut (
        .a(a), 
        .b(b), 
        .c(c), 
        .y(y)
    );

    integer i;

    initial begin
        // Display Header
        $display("Time | A B C | Y");
        $display("------------------");

        // Loop through all 8 combinations (000 to 111)
        for (i = 0; i < 8; i = i + 1) begin
            {a, b, c} = i; // Assign bit pattern of i to a, b, and c
            #10;           // Wait 10ns
            $display("%4t | %b %b %b | %b", $time, a, b, c, y);
        end

        #10 $stop;
    end

endmodule