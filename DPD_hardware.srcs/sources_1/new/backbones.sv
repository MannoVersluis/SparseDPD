`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2024 09:28:10 PM
// Design Name: 
// Module Name: backbones
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
import parameter_weights_pack::*;

module backbones #(
                parameter [BACKBONE_LAYERS+1:1] MIN_BIT_INPUTS = '{-11}, // the lowest bit of the inputs
                parameter MIN_BIT_OUTPUTS = -11, // the lowest bit of the outputs, I and Q
                parameter [BACKBONE_LAYERS+1:1] MIN_BIT_WEIGHTS = '{-11} // the lowest bit of the weights
                )(
    input logic signed [INPUTS_SIZE[0]+MIN_BIT_INPUTS[0]-1:MIN_BIT_INPUTS[0]] inputs [LAYER_SIZES[0]-1:0],
    output logic signed [OUTPUTS_SIZE+MIN_BIT_OUTPUTS-1:MIN_BIT_OUTPUTS] I_out,
    output logic signed [OUTPUTS_SIZE+MIN_BIT_OUTPUTS-1:MIN_BIT_OUTPUTS] Q_out
    );
    
    
    
    
endmodule

module base_backbone #(
                parameter [BACKBONE_LAYERS+1:1] MIN_BIT_INPUTS = '{-11}, // the lowest bit of the inputs
                parameter MIN_BIT_OUTPUTS = -11, // the lowest bit of the outputs, I and Q
                parameter [BACKBONE_LAYERS+1:1] MIN_BIT_WEIGHTS = '{-11} // the lowest bit of the weights
                )(
    input logic signed [INPUTS_SIZE[0]+MIN_BIT_INPUTS[0]-1:MIN_BIT_INPUTS[0]] inputs [LAYER_SIZES[0]-1:0],
    output logic signed [OUTPUTS_SIZE+MIN_BIT_OUTPUTS-1:MIN_BIT_OUTPUTS] I_out,
    output logic signed [OUTPUTS_SIZE+MIN_BIT_OUTPUTS-1:MIN_BIT_OUTPUTS] Q_out
    );
    
    for (genvar x=0; x<BACKBONE_LAYERS+1; x=x+1) begin
        // add new model layers here
        if (LAYER_TYPES[LAYER_ORDER[0]] == "INT_LINEAR") begin // fully connected layer
        end
    end
endmodule
