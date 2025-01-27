`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/13/2025 10:06:01 AM
// Design Name: 
// Module Name: sqrt_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sqrt_tb();

    localparam int INPUTS_SIZE = 14;

    real abs_real;
    real abs2_real;

    logic clk;
    logic [0:1-INPUTS_SIZE] abs;
    logic [0:1-INPUTS_SIZE] abs2 = 1;
    logic [0:1-INPUTS_SIZE] abs_2 [INPUTS_SIZE/2+INPUTS_SIZE%2:0] = '{INPUTS_SIZE/2+INPUTS_SIZE%2+1{0}};

    approx_inv_sqrt #(.INPUTS_SIZE(INPUTS_SIZE))
                    first (.abs2(abs2),
                            .clk(clk),
                            .abs(abs));
                            
    always_ff @(negedge clk) begin
        abs_2[INPUTS_SIZE/2+INPUTS_SIZE%2:1] <= abs_2[INPUTS_SIZE/2+INPUTS_SIZE%2-1:0];
    end
                            
    initial begin
    clk = 0;
    for (int x=0; x<500; x=x+1) begin
        clk = ~clk;
//        abs2_real = $random;
//        abs2_real = abs2_real - $floor(abs2_real);
//        abs2 = abs2_real*$pow(2, 2*INPUTS_SIZE-1);
//        abs_real = $sqrt(abs2_real);
//        abs_2 = abs_real*$pow(2, 2*INPUTS_SIZE-1);
        #5;
        abs2 = $random;
        abs2[0] = 0;
        abs2_real = abs2;
        abs_real = $sqrt(abs2_real);
        clk = ~clk;
        if (abs != abs_2[INPUTS_SIZE]) begin
            $error("Incorrect output data, time=%0t, abs=%0h, abs_correct=%0h, abs2=%0f, abs2_real=%0f", $time, abs, abs_2[4], abs2, abs2_real);
        end
        #5;
        abs_2[0] = abs_real;
    end
end
endmodule
