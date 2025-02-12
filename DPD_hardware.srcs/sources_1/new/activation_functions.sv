`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2024 09:45:59 AM
// Design Name: 
// Module Name: activation_functions
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
module activation_functions #(parameter OUTPUTS_SIZE = 8, //bits of input values
                                parameter AMOUNT = 16,
                                parameter string ACTIVATION_FUNCTION = "RELU"
                )(
    input logic signed [0:1-OUTPUTS_SIZE] inputs [AMOUNT-1:0],
    output logic signed [0:1-OUTPUTS_SIZE] outputs [AMOUNT-1:0]
    );
    
    if (ACTIVATION_FUNCTION == "RELU")
        for (genvar x=0; x<AMOUNT; x=x+1)
            RELU #(.OUTPUTS_SIZE(OUTPUTS_SIZE))
                RELU (.inputs(inputs[x]),.outputs(outputs[x]));
    
    
endmodule

module RELU #(parameter OUTPUTS_SIZE = 8, //bits of input values
                parameter MIN_BIT_OUTPUTS = -7
                )(
    input logic signed [0:1-OUTPUTS_SIZE] inputs,
    output logic signed [0:1-OUTPUTS_SIZE] outputs
    );
    
    
    assign outputs = (inputs[0]==0) ? inputs : 'b0;
        
endmodule