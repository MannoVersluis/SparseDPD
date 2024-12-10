`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2024 04:13:54 PM
// Design Name: 
// Module Name: phase_normalization
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


module phase_normalization #(parameter WIDTH = 16, // amount of I, Q inputs given at once
                    parameter INPUTS_SIZE = 12 //bits of input values
                    )(
    input logic signed [WIDTH-1:0][0:-INPUTS_SIZE] I_inputs, // I_inputs[0][0:-INPUTS_SIZE] is the current input, the others are previous inputs
    input logic signed [WIDTH-1:0][0:-INPUTS_SIZE] Q_inputs, // Q_inputs[0][0:-INPUTS_SIZE] is the current input, the others are previous inputs
    input logic unsigned [INPUTS_SIZE:-INPUTS_SIZE] abs_inv, // 1/abs, with abs being the absolute value of the current I and Q input
    input clk,
    output wire [WIDTH-1:0][0:-INPUTS_SIZE] I_out,
    output wire [WIDTH-2:0][0:-INPUTS_SIZE] Q_out
    );
    
    logic signed [WIDTH-2:0][0:-INPUTS_SIZE] I_tmp;
    logic signed [WIDTH-2:0][0:-INPUTS_SIZE] Q_tmp;
    logic signed [WIDTH-1:0][0:-INPUTS_SIZE] new_I_out;
    logic signed [WIDTH-2:0][0:-INPUTS_SIZE] new_Q_out;
    
    assign I_out = new_I_out;
    assign Q_out = new_Q_out;
    
    integer i;
    
    always_ff @(posedge clk) begin: pn1_stage
        for (i=1; i < WIDTH; i=i+1)
            I_tmp[i-1][0:-INPUTS_SIZE] = I_inputs[i][0:-INPUTS_SIZE] * I_inputs[0][0:-INPUTS_SIZE] + 
                                        Q_inputs[i][0:-INPUTS_SIZE] * Q_inputs[0][0:-INPUTS_SIZE];
            Q_tmp[i-1][0:-INPUTS_SIZE] = Q_inputs[i][0:-INPUTS_SIZE] * I_inputs[0][0:-INPUTS_SIZE] - 
                                        I_inputs[i][0:-INPUTS_SIZE] * Q_inputs[0][0:-INPUTS_SIZE];
    end
    always_ff @(posedge clk) begin: pn2_stage
        for (i=1; i < WIDTH; i=i+1)
            new_I_out[i-1][0:-INPUTS_SIZE] = I_tmp[i][0:-INPUTS_SIZE] * abs_inv;
            new_Q_out[i-1][0:-INPUTS_SIZE] = Q_tmp[i][0:-INPUTS_SIZE] * abs_inv;
    end   
endmodule




module phase_denormalization #(parameter WIDTH = 16, // amount of I, Q inputs given at once
                    parameter INPUTS_SIZE = 12 //bits of input values
                    )(
    input logic signed [WIDTH-1:0][0:-INPUTS_SIZE] I_inputs, // I_inputs[0][0:-INPUTS_SIZE] is the current input, the others are previous inputs
    input logic signed [WIDTH-1:0][0:-INPUTS_SIZE] Q_inputs, // Q_inputs[0][0:-INPUTS_SIZE] is the current input, the others are previous inputs
    input logic signed [0:-INPUTS_SIZE] denormalized_I, // the current I value before it was normalized
    input logic signed [0:-INPUTS_SIZE] denormalized_Q, // the current Q value before it was normalized
    input logic unsigned [INPUTS_SIZE:-INPUTS_SIZE] abs_inv, // 1/abs, with abs being the absolute value of the current I and Q input
    input clk,
    output wire [WIDTH-1:0][0:-INPUTS_SIZE] I_out,
    output wire [WIDTH-1:0][0:-INPUTS_SIZE] Q_out
    );
    
    logic signed [WIDTH:0][0:-INPUTS_SIZE] I_tmp;
    logic signed [WIDTH:0][0:-INPUTS_SIZE] Q_tmp;
    logic signed [WIDTH:0][0:-INPUTS_SIZE] new_I_out;
    logic signed [WIDTH:0][0:-INPUTS_SIZE] new_Q_out;
    
    assign I_out = new_I_out;
    assign Q_out = new_Q_out;
    
    integer i;
    
    always_ff @(posedge clk) begin: pn1_stage
        for (i=0; i < WIDTH; i=i+1)
            I_tmp[i][0:-INPUTS_SIZE] = I_inputs[i][0:-INPUTS_SIZE] * denormalized_I[0:-INPUTS_SIZE] + 
                                        Q_inputs[i][0:-INPUTS_SIZE] * denormalized_Q[0:-INPUTS_SIZE];
            Q_tmp[i][0:-INPUTS_SIZE] = Q_inputs[i][0:-INPUTS_SIZE] * denormalized_I[0:-INPUTS_SIZE] - 
                                        I_inputs[i][0:-INPUTS_SIZE] * denormalized_Q[0:-INPUTS_SIZE];
    end
    always_ff @(posedge clk) begin: pn2_stage
        for (i=0; i < WIDTH; i=i+1)
            new_I_out[i][0:-INPUTS_SIZE] = I_tmp[i][0:-INPUTS_SIZE] * abs_inv;
            new_Q_out[i][0:-INPUTS_SIZE] = Q_tmp[i][0:-INPUTS_SIZE] * abs_inv;
    end   
    
endmodule










