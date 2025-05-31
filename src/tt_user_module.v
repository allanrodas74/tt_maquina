// Interfaz obligatoria de Tiny Tapeout
module tt_um_allanrodas74 (
   input  wire [7:0] ui_in,
    output wire [7:0] uo_out,
    inout  wire [7:0] uio_inout,
    input wire ena,
    input  wire       clk,     // reloj global Tiny Tapeout
    input  wire       rst_n      // reset global
);
    wire [3:0] sw = io_in[3:0];   // P,R,N,D
    wire [6:0] led;

   tt_Maquina_Top top (
        .clk   (clk),
        .reset (~rst_n),
        .sw    (sw),
        .led   (led)
    );

  assign io_out = {1'b0, led};  // io_out[7] = 0, io_out[6:0] = led[6:0]

endmodule
