`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2024 02:06:09 PM
// Design Name: 
// Module Name: adder_tree_tb
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


module adder_tree_tb();

    parameter INPUTS_SIZE = 16; // amount of bits of input values
    parameter INPUTS_AMOUNT = 14; // number of input values
    parameter MIN_BIT_INPUTS = -15; //lowest bit of the inputs

    logic signed [MIN_BIT_INPUTS+INPUTS_SIZE-1:MIN_BIT_INPUTS] in [INPUTS_AMOUNT-1:0];
    logic signed [MIN_BIT_INPUTS+INPUTS_SIZE-1:MIN_BIT_INPUTS] out;
    logic signed [MIN_BIT_INPUTS+INPUTS_SIZE-1:MIN_BIT_INPUTS] sum;
    
    parameter CLOG2_INPUTS_AMOUNT = $clog2(INPUTS_AMOUNT);
    // type 0 is add_tree, type_1 is csa_tree
    parameter TREE_TYPE = 1;
    
    
    adder_trees #(.INPUTS_SIZE(INPUTS_SIZE),
                    .INPUTS_AMOUNT(INPUTS_AMOUNT),
                    .MIN_BIT_INPUTS(MIN_BIT_INPUTS),
                    .TREE_TYPE(TREE_TYPE))
        test_adder_tree (.inputs(in),
                            .output_sum(out));
    
    initial begin
        for (int i=0;i<50;i=i+1) begin
            for (int j=0; j<INPUTS_AMOUNT; j=j+1)
                in[j] = $random;
            sum = 'b0;
            #5;
            for (int i=0;i<INPUTS_AMOUNT;i=i+1) begin
                sum = sum + in[i];
            end
            if (sum != out) begin
                $error("Incorrect output data, time=%0t in=%0h, out=%0h.", $time, sum, out);
            end
            #5;
        end
    end
endmodule
