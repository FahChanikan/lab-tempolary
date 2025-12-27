module alu_simple_tb;

//Part 1: Declare variable

reg [31:0] A;
reg[31:0] B;
reg [1:0] ALUControl;

wire [31:0] Result;
wire Zero;

//Part 2: instance of ALU

alu_simple dut(
    .A(A),
    .B(B),
    .ALUControl(ALUControl),
    .Result(Result),
    .Zero(Zero)
);

//Part 3: Test

initial begin
    //Iniatial Value
    A = 32'd0;
    B = 32'd0;
    ALUControl = 2'b00;
    #10;

    //Test 1: AND
    $display("------Test 1 : AND --------");
    A = 32'd10;
    B = 32'd05;
    ALUControl = 2'b00;
    #10;

    $display("We got 0000");

    //Test 2: OR
    $display("------Test 2 : OR --------");
    A = 32'd10;
    B = 32'd05;
    ALUControl = 2'b01;
    #10;
    $display("We got 1111");

    //Test 3: ADD
    $display("------Test 3 : ADD --------");
    A = 32'd10;
    B = 32'd05;
    ALUControl = 2'b10;
    #10;

    $display("We got 10+5 =15");

    //Test 4: SUB
    $display("------Test 4 : SUB --------");
    A = 32'd10;
    B = 32'd05;
    ALUControl = 2'b11;
    #10;

    $display("We got 10-5 =5");

    //Test 5: Zero Flag
    $display("------Test 5 : Zero Flag --------");
    A = 32'd08;
    B = 32'd08;
    ALUControl = 2'b11;
    #10;

    $display("We got 8-8 = 0");

    //Test 6: Negative Value
    $display("------Test 6 : Negative Value --------");
    A = 32'd05;
    B = 32'd10;
    ALUControl = 2'b11;
    #10;

    $display("We got 5-10 = -5");

    //Test7: Large Value
    $display("------Test 7 : Large Value --------");
    A = 32'd1000000;
    B = 32'd2000000;
    ALUControl = 2'b10;
    #10;

    $display("We got 1000000 + 2000000 = 3000000");
    $finish;
    end
endmodule

    