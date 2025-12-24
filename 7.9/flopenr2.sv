module flopenr_tb;
    localparam WIDTH = 8;
    
    logic clk;
    logic reset;
    logic en;
    logic [WIDTH-1:0] d;
    logic [WIDTH-1:0] q;
    
    // Instantiate DUT
    flopenr #(.WIDTH(WIDTH)) dut (
        .clk(clk),
        .reset(reset),
        .en(en),
        .d(d),
        .q(q)
    );
    
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    // Test sequence
    initial begin
        // Initialize
        reset = 1;
        en = 0;
        d = 8'h00;
        
        // Release reset
        #20 reset = 0;
        
        // Test 1: Enable low - q should not change
        d = 8'hAA;
        #10 en = 0;
        #10;
        
        // Test 2: Enable high - q should capture d
        d = 8'h55;
        #10 en = 1;
        #10;
        
        // Test 3: Change d with enable high
        d = 8'hF0;
        #10;
        
        // Test 4: Enable low again
        en = 0;
        d = 8'h33;
        #10;
        
        // Test 5: Assert reset
        reset = 1;
        #10 reset = 0;
        
        // End simulation
        #20 $finish;
    end
    
    // Monitor changes
    initial begin
        $monitor("Time=%0t clk=%b reset=%b en=%b d=%h q=%h", 
                $time, clk, reset, en, d, q);
    end
    
endmodule