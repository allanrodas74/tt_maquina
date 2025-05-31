// Interfaz obligatoria de Tiny Tapeout
module tt_um_allanrodas74 (
    input  wire [7:0] ui_in,
    output wire [7:0] uo_out,
    inout  wire [7:0] uio_inout,
    input  wire       ena,
    input  wire       clk,     // reloj global Tiny Tapeout
    input  wire       rst_n    // reset global
);
    // P, R, N, D conectados a ui_in[6:3]
    wire [3:0] sw = ui_in[6:3];

    // Salida de los LEDs
    wire [6:0] led;

    // Instancia del módulo superior de tu diseño
    tt_Maquina_Top top (
        .clk   (clk),
        .reset (~rst_n),  // Se invierte porque rst_n es activo bajo
        .sw    (sw),
        .led   (led)
    );

    // Asignación a las salidas del diseño
    assign uo_out = {1'b0, led};   // Bit 7 a 0, leds en bits [6:0]

    // Los IO bidireccionales no se usan, así que se dejan en alta impedancia
    assign uio_inout = 8'bz;

endmodule
