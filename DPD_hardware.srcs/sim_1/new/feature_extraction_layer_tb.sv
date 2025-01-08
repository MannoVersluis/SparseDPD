`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2024 11:47:24 AM
// Design Name: 
// Module Name: activation_layer_tb
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


module activation_layer_tb();
    parameter INPUTS_SIZE = 8;

    int signed int_I;
    int signed int_Q;
    
    logic signed [0:1-INPUTS_SIZE] I;
    logic signed [0:1-INPUTS_SIZE] Q;
    
    logic signed [0:1-INPUTS_SIZE] I_out;
    logic signed [0:1-INPUTS_SIZE] Q_out;
    logic signed [0:1-INPUTS_SIZE] abs2_out;
    logic signed [0:1-INPUTS_SIZE] abs4_out;
    
    logic signed [0:1-INPUTS_SIZE] I;
    logic signed [0:1-INPUTS_SIZE] Q;
    
    logic signed [0:1-2*INPUTS_SIZE] I2;
    logic signed [0:1-2*INPUTS_SIZE] Q2;
    logic signed [0:1-2*INPUTS_SIZE] abs2;
    logic signed [0:1-2*INPUTS_SIZE] abs4;
    
    logic clk;
    
    feature_extraction_amp2_4 #(.INPUTS_SIZE(INPUTS_SIZE))
        feature_extraction (.I(I),.Q(Q),.I_out(I_out),.Q_out(Q_out),.abs2_out(abs2_out),.abs4_out(abs4_out),.clk(clk));
    
    always #1 clk = ~clk;
    
    initial begin
        clk = 0;
        for (int i=0;i<50;i=i+1) begin
            int_I = $signed($urandom_range(0, 127)) - 128;
            int_Q = $signed($urandom_range(0, 127)) - 128;
            
            I = int_I;
            Q = int_Q;
            #10
            I2 = I*I;
            Q2 = Q*Q;
            abs2 = I2+Q2;
            abs4= abs2*abs2;
            if ((I != I_out) || (Q != Q_out) || (abs2[0:1-INPUTS_SIZE] != abs2_out) || (abs4[0:1-INPUTS_SIZE] != abs4_out))
                $error("Incorrect output data, time=%0t I_in=%0h, Q_in=%0h", $time, I, Q);
        end
    end
endmodule
