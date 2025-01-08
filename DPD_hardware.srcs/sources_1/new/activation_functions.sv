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
                                parameter MIN_BIT_OUTPUTS = -7,
                                parameter AMOUNT = 16,
                                parameter string ACTIVATION_FUNCTION = "RELU"
                )(
    input logic signed [OUTPUTS_SIZE+MIN_BIT_OUTPUTS-1:MIN_BIT_OUTPUTS] inputs [AMOUNT-1:0],
    output logic signed [OUTPUTS_SIZE+MIN_BIT_OUTPUTS-1:MIN_BIT_OUTPUTS] outputs [AMOUNT-1:0]
    );
    
    if (ACTIVATION_FUNCTION == "RELU")
        for (genvar x=0; x<AMOUNT; x=x+1)
            RELU #(.OUTPUTS_SIZE(OUTPUTS_SIZE),.MIN_BIT_OUTPUTS(MIN_BIT_OUTPUTS))
                RELU (.inputs(inputs[x]),.outputs(outputs[x]));
    
    
endmodule

module RELU #(parameter OUTPUTS_SIZE = 8, //bits of input values
                parameter MIN_BIT_OUTPUTS = -7
                )(
    input logic [OUTPUTS_SIZE+MIN_BIT_OUTPUTS-1:MIN_BIT_OUTPUTS] inputs,
    output wire [OUTPUTS_SIZE+MIN_BIT_OUTPUTS-1:MIN_BIT_OUTPUTS] outputs
    );
    
    
    assign outputs = (inputs[0]==0) ? inputs : 'b0;
        
endmodule