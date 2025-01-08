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
    
    logic clk;
    
    feature_extraction_amp2_4 #(.INPUTS_SIZE(INPUTS_SIZE))
        feature_extraction (.I(I),.Q(Q),.I_out(I_out),.Q_out(Q_out),.abs2_out(abs_out),.abs4_out(abs4_out));
    
    always #1 clk = ~clk;
    
    initial begin
        clk = 0;
        for (int i=0;i<50;i=i+1) begin
            int_I = $signed($urandom_range(0, 127)) - 128;
            int_Q = $signed($urandom_range(0, 127)) - 128;
            
            I = int_I;
            Q = int_Q;
            #10
            if ((I != I_out) || (Q != Q_out) || ((I*I+Q*Q) != abs2_out) || ((I*I+Q*Q)*(I*I+Q*Q) != abs4_out))               $error("Incorrect output data, time=%0t I_in=%0h, Q_in=%0h", $time, I, Q);
        end
    end
endmodule
