`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/13/2025 12:38:59 PM
// Design Name: 
// Module Name: mult_tb
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


module mult_tb();

    parameter INPUTS_AMOUNT = 6;
    parameter INPUTS_SIZE = 5;
    parameter WEIGHTS_SIZE = 4;
    parameter MIN_BIT_INPUTS = -11;
    parameter MIN_BIT_WEIGHTS = -11;
    parameter LAST = 0;
    
    logic signed [0:1-INPUTS_SIZE] inputs [0:INPUTS_AMOUNT-1];
    logic signed [0:1-WEIGHTS_SIZE] weights [0:INPUTS_AMOUNT-1];
//    input logic signed [0:1-WEIGHTS_SIZE] bias;
    logic clk;
    logic signed [LAST:1-INPUTS_SIZE] outputs;
    
    
    csa_mult #(.INPUTS_AMOUNT(INPUTS_AMOUNT),
                .INPUTS_SIZE(INPUTS_SIZE),
                .WEIGHTS_SIZE(WEIGHTS_SIZE),
                .MIN_BIT_INPUTS(MIN_BIT_INPUTS),
                .MIN_BIT_WEIGHTS(MIN_BIT_WEIGHTS),
                .LAST(LAST))
        test_mult (.inputs(inputs),
                    .weights(weights),
                    .clk(clk),
                    .outputs(outputs));
    
    initial begin
        
        for (int i=0;i<500;i=i+1) begin
            for (int j=0; j<INPUTS_AMOUNT; j=j+1) begin
                inputs[j] = $random;
                weights[j] = $random;
            end
//            sum = 'b0;
            #5;
//            for (int i=0;i<INPUTS_AMOUNT;i=i+1) begin
//                sum = sum + in[i];
//            end
//            if (sum != out) begin
//                $error("Incorrect output data, time=%0t in=%0h, out=%0h.", $time, sum, out);
//            end
            #5;
        end
    end
    
    
    
endmodule
