// Design module (your original code)
module flopr #(parameter WIDTH = 8)
 (input logic clk, reset,
 input logic [WIDTH-1:0] d,
 output logic [WIDTH-1:0] q);
 
 always_ff @(posedge clk, posedge reset)
 if (reset) q <= 0;
 else q <= d;
endmodule

// Testbench module
module flopr_tb;
 // Parameters
 parameter WIDTH = 8;
 parameter CLK_PERIOD = 10; // 10 time units per clock cycle
 
 // Testbench signals
 logic clk;
 logic reset;
 logic [WIDTH-1:0] d;
 logic [WIDTH-1:0] q;
 
 // Instantiate the DUT (Device Under Test)
 flopr #(.WIDTH(WIDTH)) dut (
  .clk(clk),
  .reset(reset),
  .d(d),
  .q(q)
 );
 
 // Clock generation
 initial begin
  clk = 0;
  forever #(CLK_PERIOD/2) clk = ~clk;
 end
 
 // Stimulus generation and monitoring
 initial begin
  // Initialize inputs
  reset = 0;
  d = 0;
  
  // Apply reset
  reset = 1;
  #20;
  reset = 0;
  
  // Test 1: Normal operation
  $display("Test 1: Normal operation");
  d = 8'hAA;
  #20;
  $display("Time = %0t, d = %h, q = %h", $time, d, q);
  
  // Test 2: Change data
  d = 8'h55;
  #20;
  $display("Time = %0t, d = %h, q = %h", $time, d, q);
  
  // Test 3: Apply reset during operation
  d = 8'hFF;
  #5;
  reset = 1;
  #15;
  $display("Time = %0t, Reset asserted, q = %h", $time, q);
  reset = 0;
  
  // Test 4: Continue after reset
  d = 8'hCC;
  #20;
  $display("Time = %0t, d = %h, q = %h", $time, d, q);
  
  // Test 5: Multiple data changes between clock edges
  d = 8'h11;
  #5;
  d = 8'h22;
  #5;
  d = 8'h33;
  #10;
  $display("Time = %0t, d = %h, q = %h", $time, d, q);
  
  // End simulation
  #100;
  $display("Simulation completed");
  $finish;
 end
 
 // Waveform dumping (for visualization in GUI simulators)
 initial begin
  $dumpfile("flopr_waves.vcd");
  $dumpvars(0, flopr_tb);
 end
endmodule