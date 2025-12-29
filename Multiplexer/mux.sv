module mux(
    input logic D0,
    input logic D1,
    input logic S,
    output logic Y
);

always_comb begin
    if(S == 0)
        Y = D0;
    else
        Y = D1;

end

endmodule