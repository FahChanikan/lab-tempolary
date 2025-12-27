module alu_simple(
    input [31:0] A,
    input [31:0] B,
    input [1:0] ALUControl,
    output [31:0] Result,
    output Zero
);

//Part 1: Inside variable
reg [31:0] ALUResult;

//Part 2: Main of Logic - Select Working

always @(*) begin //working everytime when A B or ALUControl are changed

    case(ALUControl)
        2'b00: ALUResult = A & B; //AND
        2'b01: ALUResult = A | B; //or
        2'b10: ALUResult = A + B; //ADD
        2'b11: ALUResult = A - B; //SUB
    endcase
end
//part 3: output
assign Result = ALUResult; //Send the Result
assign Zero = (ALUResult == 32'b0); //if the answer is 0, give Zero will be 1

endmodule
