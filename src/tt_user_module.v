// Interfaz obligatoria de Tiny Tapeout
module tt_um_allanrodas74 (
    input  wire [7:0] io_in,   // io_in[3:0] = {P,R,N,D}
    output wire [7:0] io_out,  // io_out[6:0] = {R1,N1,P1,D4,D3,D2,D1}
    input wire ena,
    input  wire       clk,     // reloj global Tiny Tapeout
    input  wire       rst      // reset global
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
