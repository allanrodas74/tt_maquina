module tt_um_allanrodas74 (
    input  wire [7:0] ui_in,     // Entradas
    output wire [7:0] uo_out,    // Salidas
    input  wire [7:0] uio_in,    // Entradas (no usadas)
    output wire [7:0] uio_out,   // Salidas (no usadas)
    output wire [7:0] uio_oe,    // Output enable (no usado)
    input  wire ena,
    input  wire clk,
    input  wire rst_n
);


    // Según tu pinout:
    // ui[3]: P
    // ui[4]: R
    // ui[5]: N
    // ui[6]: D

    wire P = ui_in[3];
    wire R = ui_in[4];
    wire N = ui_in[5];
    wire D = ui_in[6];

    wire reset = ~rst_n;

    wire [6:0] led;

    // Instancia del módulo top de la máquina
    tt_Maquina_Top top (
        .clk(clk),
        .reset(reset),
        .sw({P, R, N, D}),
        .led(led)
    );

    // Asignar salida uo_out: bit 7 a 0 + leds 6:0
    assign uo_out = {1'b0, led};

    // No usamos uio_inout, se deja en alta impedancia
    assign uio_inout = 8'bz;
    assign uio_out = 8'b0;
assign uio_oe  = 8'b0;


endmodule


