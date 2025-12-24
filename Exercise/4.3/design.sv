module four_input_xor_tb;
    logic [3:0] a;
    logic y;
    
    four_input_xor dut (a , y);
    
    initial begin
        $monitor("Time=%0t a=%4b y=%b Expected=%b", 
                $time, a, y, a[3]^a[2]^a[1]^a[0]);
        
        // Exhaustive test
        for (int i = 0; i < 16; i++) begin
            a = i;
            #10;
            assert(y === (a[3]^a[2]^a[1]^a[0])) 
            else $error("Test failed for a=%4b", a);
        end
        
        $display("All tests passed!");
        $finish;
    end
endmodule