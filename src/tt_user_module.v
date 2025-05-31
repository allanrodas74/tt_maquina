module tt_um_allanrodas74 (
    input  wire [7:0] ui_in,       // Entradas estándar
    output wire [7:0] uo_out,      // Salidas estándar
    input  wire [7:0] uio_in,      // Entradas bidireccionales
    output wire [7:0] uio_out,     // Salidas bidireccionales
    output wire [7:0] uio_oe,      // Control de salida (output enable)
    input  wire       ena,         // Enable de usuario
    input  wire       clk,         // Reloj global
    input  wire       rst_n        // Reset global activo bajo
);

    wire [3:0] sw = ui_in[6:3];    // P, R, N, D
    wire [6:0] led;

    tt_Maquina_Top top (
        .clk   (clk),
        .reset (~rst_n),
        .sw    (sw),
        .led   (led)
    );

    assign uo_out  = {1'b0, led}; // LED en bits [6:0]
    assign uio_out = 8'b0;        // No usas uio, se mantiene en 0
    assign uio_oe  = 8'b0;        // Salidas en alta impedancia

endmodule
