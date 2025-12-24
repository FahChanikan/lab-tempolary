`timescale 1ns/1ps

module minority_tb;
    // Declare testbench signals
    logic a, b, c;
    logic y;
    
    // Expected output for verification
    logic expected_y;
    
    // Instantiate the Design Under Test (DUT)
    minority dut (
        .a(a),
        .b(b),
        .c(c),
        .y(y)
    );
    
    // Function to calculate expected value
    function logic calc_expected(input logic a, b, c);
        int false_count = 0;
        if (a == 0) false_count++;
        if (b == 0) false_count++;
        if (c == 0) false_count++;
        return (false_count >= 2) ? 1'b1 : 1'b0;
    endfunction
    
    // Test stimulus generator
    initial begin
        $display("==========================================");
        $display("Testing minority module");
        $display("==========================================");
        $display("Time\t a b c\t y\t Expected\t Pass/Fail");
        $display("------------------------------------------");
        
        // Test all 8 possible combinations
        for (int i = 0; i < 8; i++) begin
            // Set input values
            {a, b, c} = i[2:0];
            
            // Calculate expected output
            expected_y = calc_expected(a, b, c);
            
            // Wait for propagation delay
            #10;
            
            // Check and display results
            if (y === expected_y) begin
                $display("%0t\t %b %b %b\t %b\t %b\t\t PASS", 
                         $time, a, b, c, y, expected_y);
            end else begin
                $display("%0t\t %b %b %b\t %b\t %b\t\t FAIL", 
                         $time, a, b, c, y, expected_y);
                $error("ERROR: Output mismatch!");
            end
        end
        
        // Additional corner cases
        $display("\nAdditional corner cases:");
        $display("------------------------------------------");
        
        // Case 1: All zeros
        a = 0; b = 0; c = 0;
        #10;
        expected_y = calc_expected(a, b, c);
        $display("%0t\t %b %b %b\t %b\t %b\t\t %s", 
                 $time, a, b, c, y, expected_y,
                 (y === expected_y) ? "PASS" : "FAIL");
        
        // Case 2: All ones
        a = 1; b = 1; c = 1;
        #10;
        expected_y = calc_expected(a, b, c);
        $display("%0t\t %b %b %b\t %b\t %b\t\t %s", 
                 $time, a, b, c, y, expected_y,
                 (y === expected_y) ? "PASS" : "FAIL");
        
        // Case 3: Random test
        a = 0; b = 1; c = 0;
        #10;
        expected_y = calc_expected(a, b, c);
        $display("%0t\t %b %b %b\t %b\t %b\t\t %s", 
                 $time, a, b, c, y, expected_y,
                 (y === expected_y) ? "PASS" : "FAIL");
        
        $display("\n==========================================");
        $display("Simulation completed successfully!");
        $finish;
    end
    
    // Waveform dumping for visualization
    initial begin
        $dumpfile("minority_wave.vcd");
        $dumpvars(0, minority_tb);
    end
    
    // Optional: Monitor all changes
    initial begin
        $monitor("Monitor: Time=%0t a=%b b=%b c=%b y=%b", 
                 $time, a, b, c, y);
    end
endmodule