// Simple testbench for beginners
module mux8_tb_simple;
    // Test signals
    reg [2:0] s;
    reg d0, d1, d2, d3, d4, d5, d6, d7;
    wire y;
    
    // Instantiate mux8
    mux8 dut (
        .s(s),
        .d0(d0), .d1(d1), .d2(d2), .d3(d3),
        .d4(d4), .d5(d5), .d6(d6), .d7(d7),
        .y(y)
    );
    
    // Test sequence
    initial begin
        // Create waveform file
        $dumpfile("mux8_simple.vcd");
        $dumpvars(0, mux8_tb_simple);
        
        // Initialize display
        $display("Time\t Select\t Inputs (d0-d7)\t Output");
        $display("--------------------------------------------");
        
        // Test case 1: Basic test
        d0 = 0; d1 = 1; d2 = 0; d3 = 1;
        d4 = 0; d5 = 1; d6 = 0; d7 = 1;
        
        // Test all select values
        s = 3'b000; #10; $display("%0t\t 000\t 0 1 0 1 0 1 0 1\t %b", $time, y);
        s = 3'b001; #10; $display("%0t\t 001\t 0 1 0 1 0 1 0 1\t %b", $time, y);
        s = 3'b010; #10; $display("%0t\t 010\t 0 1 0 1 0 1 0 1\t %b", $time, y);
        s = 3'b011; #10; $display("%0t\t 011\t 0 1 0 1 0 1 0 1\t %b", $time, y);
        s = 3'b100; #10; $display("%0t\t 100\t 0 1 0 1 0 1 0 1\t %b", $time, y);
        s = 3'b101; #10; $display("%0t\t 101\t 0 1 0 1 0 1 0 1\t %b", $time, y);
        s = 3'b110; #10; $display("%0t\t 110\t 0 1 0 1 0 1 0 1\t %b", $time, y);
        s = 3'b111; #10; $display("%0t\t 111\t 0 1 0 1 0 1 0 1\t %b", $time, y);
        
        // Test case 2: All zeros
        $display("\nAll inputs = 0:");
        d0 = 0; d1 = 0; d2 = 0; d3 = 0;
        d4 = 0; d5 = 0; d6 = 0; d7 = 0;
        s = 3'b010; #10; $display("%0t\t 010\t 0 0 0 0 0 0 0 0\t %b", $time, y);
        
        // Test case 3: All ones
        $display("\nAll inputs = 1:");
        d0 = 1; d1 = 1; d2 = 1; d3 = 1;
        d4 = 1; d5 = 1; d6 = 1; d7 = 1;
        s = 3'b101; #10; $display("%0t\t 101\t 1 1 1 1 1 1 1 1\t %b", $time, y);
        
        $display("\nSimulation completed!");
        #10 $finish;
    end
endmodule