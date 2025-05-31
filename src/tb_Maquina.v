`timescale 1ns / 1ps

module tb_Maquina;

    // Entradas
    reg clk;
    reg reset;
    reg D, N, R, P;

    // Salidas
    wire D1, D2, D3, D4;
    wire P1, N1, R1;
    wire M0, M1;

    // Instanciar el módulo bajo prueba (UUT)
    tt_Maquina uut (
        .clk(clk),
        .reset(reset),
        .D(D), .N(N), .R(R), .P(P),
        .D1(D1), .D2(D2), .D3(D3), .D4(D4),
        .P1(P1), .N1(N1), .R1(R1),
        .M0(M0), .M1(M1)
    );

    // Generar reloj (periodo de 10ns)
    always #5 clk = ~clk;

    // Secuencia de prueba
    initial begin
        $display("=== Simulación FSM Máquina ===");
        $dumpfile("tb_Maquina.vcd"); // Para visualizar en GTKWave
        $dumpvars(0, tb_Maquina);

        // Inicializar señales
        clk = 0;
        reset = 1;
        {P, R, N, D} = 4'b0000;

        #10 reset = 0; // Salir de reset

        // Probar P (Park)
        #10 P = 1;
        #10 P = 0;

        // Probar N (Neutral)
        #10 N = 1;
        #10 N = 0;

        // Probar R (Reverse)
        #10 R = 1;
        #10 R = 0;

        // Probar D (Drive) con 4 avances
        #10 D = 1;
        #10 D = 0;
        #10 D = 1;
        #10 D = 0;
        #10 D = 1;
        #10 D = 0;
        #10 D = 1;
        #10 D = 0;

        // Finalizar simulación
        #20 $finish;
    end

endmodule
