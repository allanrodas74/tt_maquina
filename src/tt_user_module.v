// ────────────────────────────────────────────────────────────────
// Top‐level obligatorio para Tiny Tapeout v6
// Nombres de puertos EXACTOS requeridos por la plataforma
// ────────────────────────────────────────────────────────────────
module tt_um_allanrodas74 (
    input  wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    input  wire       ena,
    input  wire       clk,
    input  wire       rst_n
);


    //--------------------------------------------------------------------
    //  Mapeo de pines según tu pinout YAML
    //      ui[3] = P   ui[4] = R   ui[5] = N   ui[6] = D
    //--------------------------------------------------------------------
    wire P = ui_in[3];
    wire R = ui_in[4];
    wire N = ui_in[5];
    wire D = ui_in[6];

    //--------------------------------------------------------------------
    //  Instancia de la lógica principal
    //--------------------------------------------------------------------
    wire [6:0] led;

    tt_Maquina_Top core (
        .clk   (clk),
        .reset (~rst_n),           // reset activo-alto interno
        .sw    ({P, R, N, D}),     // {P,R,N,D}
        .led   (led)
    );

    //--------------------------------------------------------------------
    //  Salidas
    //      uo_out[6:0] = {R1,N1,P1,D4,D3,D2,D1}
    //      uo_out[7]   = 0 (sin usar)
    //--------------------------------------------------------------------
    assign uo_out = {1'b0, led};

    //--------------------------------------------------------------------
    //  Bus bidireccional no utilizado
    //--------------------------------------------------------------------
    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;        // Hi-Z permanente

endmodule
