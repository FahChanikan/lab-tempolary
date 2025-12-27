`timescale 1ns/1ps

module alu_simple_tb;

    // ประกาศสัญญาณสำหรับต่อกับ DUT
    reg  [31:0] A;
    reg  [31:0] B;
    reg  [1:0]  ALUControl;
    wire [31:0] Result;
    wire        Zero;

    // instance ของ ALU ที่เราเขียนไว้
    alu_simple dut (
        .A(A),
        .B(B),
        .ALUControl(ALUControl),
        .Result(Result),
        .Zero(Zero)
    );

    // monitor ดูค่าตลอดเวลาใน waveform / console
    initial begin
        $display(" time   ALUControl   A         B         Result    Zero");
        $monitor("%4t   %b        %d   %d   %d   %b",
                 $time, ALUControl, A, B, Result, Zero);
    end

    // สร้าง test vectors
    initial begin
        // เริ่มต้นค่า
        A = 32'd0;
        B = 32'd0;
        ALUControl = 2'b00;

        #10;
        // ทดสอบ ADD
        A = 32'd10;
        B = 32'd5;
        ALUControl = 2'b10;   // 10 = ADD ในโค้ดคุณ
        #10;

        // ทดสอบ SUB
        ALUControl = 2'b11;   // 11 = SUB
        #10;

        // ทดสอบ AND
        ALUControl = 2'b00;   // 00 = AND
        #10;

        // ทดสอบ OR
        ALUControl = 2'b01;   // 01 = OR
        #10;

        // ทดสอบกรณีผลลัพธ์เป็นศูนย์ (Zero = 1)
        A = 32'd8;
        B = 32'd8;
        ALUControl = 2'b11;   // SUB -> 8-8 = 0
        #10;

        // จบการ simulation
        $finish;
    end

endmodule
