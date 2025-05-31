module tt_Maquina_Top(
    input  wire       clk,
    input  wire       reset,
    input  wire [3:0] sw,     // {P,R,N,D}
    output wire [6:0] led     // {R1,N1,P1,D4,D3,D2,D1}
);
    // Separar cada switch
    wire D = sw[0];
    wire N = sw[1];
    wire R = sw[2];
    wire P = sw[3];

    // Salidas de la FSM
    wire D1, D2, D3, D4;
    wire P1, N1, R1;
    wire M0, M1;

    Maquina fsm (
        .clk  (clk),
        .reset(reset),
        .D(D), .N(N), .R(R), .P(P),
        .D1(D1), .D2(D2), .D3(D3), .D4(D4),
        .P1(P1), .N1(N1), .R1(R1),
        .M0(M0), .M1(M1)           // M0/M1 expuestos por si los necesitas
    );

    assign led = {R1, N1, P1, D4, D3, D2, D1};
endmodule
