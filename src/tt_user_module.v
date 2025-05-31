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

    // Entradas P, R, N, D conectadas a ui_in[6:3]
    wire [3:0] sw = ui_in[6:3];
    wire [6:0] led;

    tt_Maquina_Top top (
        .clk   (clk),
        .reset (~rst_n),
        .sw    (sw),
        .led   (led)
    );

    assign uo_out = {1'b0, led};   // LED en bits 6:0
    assign uio_out = 8'b0;         // No se usan los I/O bidireccionales
    assign uio_oe  = 8'b0;         // Se deshabilitan (alta impedancia)

endmodule
