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
    input logic signed [0:1-INPUTS_SIZE] I_inputs [WIDTH-1:0],        // I_inputs[0][0:-INPUTS_SIZE] is the current input, the others are previous inputs
    input logic signed [0:1-INPUTS_SIZE] Q_inputs [WIDTH-1:0],        // Q_inputs[0][0:-INPUTS_SIZE] is the current input, the others are previous inputs
    input logic signed [0:1-INPUTS_SIZE] norm_I_input,               // next I input, used to determine complex complement for next cycle
    input logic signed [0:1-INPUTS_SIZE] norm_Q_input,               // next Q input, used to determine complex complement for next cycle
    input clk,
    output logic signed [0:1-INPUTS_SIZE] I_out [WIDTH-1:0],
    output logic signed [0:1-INPUTS_SIZE] Q_out [WIDTH-1:0]
    );
    
    logic signed [0:1-2*INPUTS_SIZE] new_I_out1 [WIDTH-1:0];
    logic signed [0:1-2*INPUTS_SIZE] new_I_out2 [WIDTH-1:0];
    logic signed [0:1-2*INPUTS_SIZE] new_I_out3 [WIDTH-1:0];
    logic signed [0:1-INPUTS_SIZE]   new_I_out4 [WIDTH-1:0];
    logic signed [0:1-2*INPUTS_SIZE] new_Q_out1 [WIDTH-1:0];
    logic signed [0:1-2*INPUTS_SIZE] new_Q_out2 [WIDTH-1:0];
    logic signed [0:1-2*INPUTS_SIZE] new_Q_out3 [WIDTH-1:0];
    logic signed [0:1-INPUTS_SIZE]   new_Q_out4 [WIDTH-1:0];
    
    
    assign I_out = new_I_out4;
    assign Q_out = new_Q_out4;
    
    always_ff @(posedge clk) begin: pn_stage
        for (int i=0; i<WIDTH; i=i+1) begin
            new_I_out1[i] <= I_inputs[i] * norm_I_input;// + 
            new_I_out2[i] <= Q_inputs[i] * norm_Q_input;
            new_Q_out1[i] <= Q_inputs[i] * norm_I_input;// - 
            new_Q_out2[i] <= I_inputs[i] * norm_Q_input;
            
            new_I_out4[i] <= new_I_out3[i][-1:-INPUTS_SIZE] + new_I_out3[i][-1-INPUTS_SIZE];
            new_Q_out4[i] <= new_Q_out3[i][-1:-INPUTS_SIZE] + new_Q_out3[i][-1-INPUTS_SIZE];
        end
    end
    
    always_comb begin
        for (int i=0; i<WIDTH; i=i+1) begin
            new_I_out3[i] = new_I_out1[i] + new_I_out2[i];
            new_Q_out3[i] = new_Q_out1[i] - new_Q_out2[i];
        end
    end
endmodule




module phase_denormalization #(parameter WIDTH = 16, // amount of I, Q inputs given at once
                                parameter INPUTS_SIZE = 12 //bits of input values
                    )(
    input logic signed [1:1-INPUTS_SIZE] I_inputs [WIDTH-1:0],        // I_inputs[0][0:-INPUTS_SIZE] is the current input, the others are previous inputs
    input logic signed [1:1-INPUTS_SIZE] Q_inputs [WIDTH-1:0],        // Q_inputs[0][0:-INPUTS_SIZE] is the current input, the others are previous inputs
    input logic signed [0:1-INPUTS_SIZE] norm_I_input,               // next I input, used to determine complex complement for next cycle
    input logic signed [0:1-INPUTS_SIZE] norm_Q_input,               // next Q input, used to determine complex complement for next cycle
    input clk,
    output logic signed [1:1-2*INPUTS_SIZE] I_out [WIDTH-1:0],
    output logic signed [1:1-2*INPUTS_SIZE] Q_out [WIDTH-1:0]
    );

    logic signed [1:1-2*INPUTS_SIZE] new_I_out1 [WIDTH-1:0];
    logic signed [1:1-2*INPUTS_SIZE] new_I_out2 [WIDTH-1:0];
    logic signed [1:1-2*INPUTS_SIZE] new_Q_out1 [WIDTH-1:0];
    logic signed [1:1-2*INPUTS_SIZE] new_Q_out2 [WIDTH-1:0];

    for (genvar x=0; x<WIDTH; x=x+1) begin
        assign I_out[x] = new_I_out1[x] - new_I_out2[x];
        assign Q_out[x] = new_Q_out1[x] + new_Q_out2[x];
    end
    
    always_ff @(posedge clk) begin: pn_stage
        for (int i=0; i < WIDTH; i=i+1) begin
            new_I_out1[i] <= I_inputs[i] * norm_I_input;// - 
            new_I_out2[i] <= Q_inputs[i] * norm_Q_input;
            new_Q_out1[i] <= Q_inputs[i] * norm_I_input;// + 
            new_Q_out2[i] <= I_inputs[i] * norm_Q_input;
        end
    end    
endmodule










