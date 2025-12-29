module mux_tb;

reg D0;
reg D1;
reg S;

wire Y;

mux uut(
    .D0(D0),
    .D1(D1),
    .S(S),
    .Y(Y)
);

initial begin
    D1 = 0;
    D0 = 0;
    S = 0;
    #10;

    D1 = 0;
    D0 = 1;
    S = 0;
    #10;

    D1 = 1;
    D0 =0;
    S = 0;
    #10;

    D1 = 1;
    D0 = 1;
    S = 0;
    #10;

    D1 = 0;
    D0 = 0;
    S = 1;
    #10;

    D1 = 0;
    D0 = 1;
    S = 1;
    #10;

    D1 = 1;
    D0 = 0;
    S = 1;
    #10;

    D1 = 1;
    D0 = 1;
    S = 1;
    #10;

    $display("finish");
    $finish;

    end
endmodule


    