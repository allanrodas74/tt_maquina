// Interfaz obligatoria de Tiny Tapeout
module tt_um_allanrodas74 (
    input  wire [7:0] ui_in,
    output wire [7:0] uo_out,
    inout  wire [7:0] uio_inout,
    input  wire       ena,
    input  wire       clk,
    input  wire       rst_n
);

    // Entradas específicas del proyecto (P, R, N, D desde ui_in)
    wire [3:0] sw = ui_in[6:3];

    // Salidas LED uo_out[6:0]
    wire [6:0] led;

    // Instancia de tu módulo
    tt_Maquina_Top top (
        .clk   (clk),
        .reset (~rst_n),  // Invertimos rst_n porque tu módulo espera reset activo alto
        .sw    (sw),
        .led   (led)
    );

    // Asignación de salidas
    assign uo_out = {1'b0, led};  // El bit 7 se pone en 0
    assign uio_inout = 8'bz;      // No se usan IO bidireccionales

endmodule
