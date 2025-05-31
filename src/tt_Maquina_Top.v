// Encapsula la FSM y ordena los LEDs
module tt_Maquina_Top (
    input  wire       clk,
    input  wire       reset,          // activo-alto
    input  wire [3:0] sw,             // {P,R,N,D}
    output wire [6:0] led             // {R1,N1,P1,D4,D3,D2,D1}
);
    // Desempaquetar switches
    wire D = sw[0];
    wire N = sw[1];
    wire R = sw[2];
    wire P = sw[3];

    // Salidas de la FSM
    wire D1, D2, D3, D4;
    wire P1, N1, R1;
    wire unused_M0, unused_M1;        // no se exportan

    // Instancia de la máquina de estados
    Maquina fsm (
        .clk   (clk),
        .reset (reset),
        .D     (D),
        .N     (N),
        .R     (R),
        .P     (P),
        .D1    (D1),
        .D2    (D2),
        .D3    (D3),
        .D4    (D4),
        .P1    (P1),
        .N1    (N1),
        .R1    (R1),
        .M0    (unused_M0),
        .M1    (unused_M1)
    );

    // Ordenar bits a LED según datasheet
    assign led = {R1, N1, P1, D4, D3, D2, D1};
endmodule
