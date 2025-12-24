module four_input_xor_tb;
    // Testbench signals
    logic [3:0] a;
    logic y;
    
    // Expected value for verification
    logic expected_y;
    
    // Instantiate the DUT (Device Under Test)
    four_input_xor dut (
        .a(a),
        .y(y)
    );
    
    // Function to calculate expected XOR
    function logic calculate_expected(input [3:0] val);
        return val[3] ^ val[2] ^ val[1] ^ val[0];
    endfunction
    
    // Test stimulus
    initial begin
        $display("Starting four_input_xor testbench...");
        $display("Time\t a[3:0]\t y\t Expected\t Status");
        $display("------------------------------------------------");
        
        // Test all 16 possible input combinations
        for (int i = 0; i < 16; i++) begin
            a = i;  // 4-bit value from 0 to 15
            expected_y = calculate_expected(a);
            
            #10;  // Wait for propagation
            
            // Check result
            if (y === expected_y) begin
                $display("%0t\t %4b\t %b\t %b\t\t PASS", $time, a, y, expected_y);
            end else begin
                $display("%0t\t %4b\t %b\t %b\t\t FAIL", $time, a, y, expected_y);
                $error("Mismatch at a=%4b: got %b, expected %b", a, y, expected_y);
            end
        end
        
        // Additional edge case tests
        $display("\nAdditional edge case tests:");
        $display("Time\t a[3:0]\t y\t Expected\t Status");
        $display("------------------------------------------------");
        
        // Test specific patterns
        a = 4'b0000; #10; expected_y = calculate_expected(a);
        $display("%0t\t %4b\t %b\t %b\t\t %s", $time, a, y, expected_y, 
                 (y === expected_y) ? "PASS" : "FAIL");
        
        a = 4'b1111; #10; expected_y = calculate_expected(a);
        $display("%0t\t %4b\t %b\t %b\t\t %s", $time, a, y, expected_y, 
                 (y === expected_y) ? "PASS" : "FAIL");
        
        a = 4'b0101; #10; expected_y = calculate_expected(a);
        $display("%0t\t %4b\t %b\t %b\t\t %s", $time, a, y, expected_y, 
                 (y === expected_y) ? "PASS" : "FAIL");
        
        a = 4'b1010; #10; expected_y = calculate_expected(a);
        $display("%0t\t %4b\t %b\t %b\t\t %s", $time, a, y, expected_y, 
                 (y === expected_y) ? "PASS" : "FAIL");
        
        // Random tests
        $display("\nRandom tests:");
        $display("Time\t a[3:0]\t y\t Expected\t Status");
        $display("------------------------------------------------");
        
        repeat (5) begin
            a = $urandom_range(0, 15);
            expected_y = calculate_expected(a);
            #10;
            $display("%0t\t %4b\t %b\t %b\t\t %s", $time, a, y, expected_y, 
                     (y === expected_y) ? "PASS" : "FAIL");
        end
        
        $display("\nTestbench completed!");
        $finish;
    end
    
    // Optional: Waveform dump for visualization
    initial begin
        $dumpfile("four_input_xor.vcd");
        $dumpvars(0, four_input_xor_tb);
    end
    
    // Monitor to track changes (alternative approach)
    // initial begin
    //     $monitor("Time=%0t a=%4b y=%b Expected=%b", $time, a, y, calculate_expected(a));
    // end
    
endmodule