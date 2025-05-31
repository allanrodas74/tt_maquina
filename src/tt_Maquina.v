module tt_Maquina(
    input  wire clk,
    input  wire reset,
    input  wire D, N, R, P,       // órdenes del selector
    output reg  D1, D2, D3, D4,   // LEDs marchas
    output reg  P1, N1, R1,       // LEDs modos
    output reg  M0, M1            // estado binario (opcional)
);

    // Codificación de estados
    parameter EST_P = 2'b00;
    parameter EST_N = 2'b01;
    parameter EST_R = 2'b10;
    parameter EST_D = 2'b11;

    reg [1:0] estado, sig_estado;
    reg [1:0] marcha;             // 0-3 → D1-D4

    // Estado presente y avance de marcha
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            estado <= EST_P;
            marcha <= 2'b00;
        end
        else begin
            estado <= sig_estado;
            if (sig_estado == EST_D)
                marcha <= marcha + 1'b1;   // avanza a la siguiente marcha
            else
                marcha <= 2'b00;           // reinicia marchas fuera de Drive
        end
    end

    // Lógica de transición (prioridad: P > N > R > D)
    always @(*) begin
        sig_estado = estado;      // por defecto
        if      (P) sig_estado = EST_P;
        else if (N) sig_estado = EST_N;
        else if (R) sig_estado = EST_R;
        else if (D) sig_estado = EST_D;
    end

    // Salidas combinacionales
    always @(*) begin
        // Apagar todo
        {D1,D2,D3,D4} = 4'b0;
        {P1,N1,R1}    = 3'b0;
        {M1,M0}       = estado;

        case (estado)
            EST_P: P1 = 1'b1;
            EST_N: N1 = 1'b1;
            EST_R: R1 = 1'b1;
            EST_D: begin
                case (marcha)
                    2'b00: D1 = 1'b1;
                    2'b01: D2 = 1'b1;
                    2'b10: D3 = 1'b1;
                    2'b11: D4 = 1'b1;
                endcase
            end
        endcase
    end
endmodule
