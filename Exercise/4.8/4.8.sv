module mux8 (
    input logic [2:0] s,  // 3-bit select signal
    input logic d0, d1, d2, d3, d4, d5, d6, d7,  // 8 input data signals
    output logic y        // output
);

always_comb begin
    case (s)
        3'b000: y = d0;  // when s=000, output = d0
        3'b001: y = d1;  // when s=001, output = d1
        3'b010: y = d2;  // when s=010, output = d2
        3'b011: y = d3;  // when s=011, output = d3
        3'b100: y = d4;  // when s=100, output = d4
        3'b101: y = d5;  // when s=101, output = d5
        3'b110: y = d6;  // when s=110, output = d6
        3'b111: y = d7;  // when s=111, output = d7
        default: y = 1'b0;  // default case (should never happen)
    endcase
end

endmodule