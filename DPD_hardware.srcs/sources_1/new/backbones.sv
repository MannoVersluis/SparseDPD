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
                parameter MIN_BIT_INPUTS = -11 // the lowest bit of the inputs
                // index BACKBONE_LAYERS+2 is the lowest bit of the outputs, I and Q
                )(
    input logic signed [INPUTS_SIZE+MIN_BIT_INPUTS[0]-1:MIN_BIT_INPUTS[0]] inputs [0:LAYER_SIZES[LAYER_ORDER[0]]-1],
    input logic clk,
    output logic signed [INPUTS_SIZE+MIN_BIT_INPUTS[BACKBONE_LAYERS+1]-1:MIN_BIT_INPUTS[BACKBONE_LAYERS+1]] I_out,
    output logic signed [INPUTS_SIZE+MIN_BIT_INPUTS[BACKBONE_LAYERS+1]-1:MIN_BIT_INPUTS[BACKBONE_LAYERS+1]] Q_out
    );

    // call macro create variables
    
    logic signed [INPUTS_SIZE-1:0] layer_outputs [BACKBONE_LAYERS:1][0:1-LAYER_SIZES[1]];
//    logic signed [INPUTS_SIZE-1:0] new_layer_outputs [BACKBONE_LAYERS:1][0:1-LAYER_SIZES[1]];
    logic signed [INPUTS_SIZE-1:0] layer_inputs [BACKBONE_LAYERS:1][0:1-LAYER_SIZES[1]];
    logic signed [INPUTS_SIZE-1:0] new_layer_inputs [BACKBONE_LAYERS:1][0:1-LAYER_SIZES[1]];
    logic signed [INPUTS_SIZE-1:0] last_layer_outputs [LAYER_SIZES[BACKBONE_LAYERS+1]-1:0];
//    logic signed [INPUTS_SIZE-1:0] new_last_layer_outputs [LAYER_SIZES[BACKBONE_LAYERS+1]-1:0];
   
    assign I_out = last_layer_outputs[1];
    assign Q_out = last_layer_outputs[0];
   
    always_ff @(posedge clk) begin
//        layer_outputs <= new_layer_outputs;  
//        last_layer_outputs <= new_last_layer_outputs;
        layer_inputs <= new_layer_inputs; 
    end
   
    if (LAYER_TYPES[1] == "INT_LINEAR") begin // fully cocnnected layer
        fc_layer #(.PREV_WIDTH(LAYER_SIZES[0]),.WIDTH(LAYER_SIZES[1]),.WEIGHTS_SIZE(WEIGHTS_SIZE[1]),
            .INPUTS_SIZE(INPUTS_SIZE),.OUTPUTS_SIZE(INPUTS_SIZE),.MIN_BIT_INPUTS(MIN_BIT_INPUTS),
            .MIN_BIT_WEIGHTS(LAYER_FIRST_WEIGHT_QUANTIZER),.MIN_BIT_OUTPUTS(MIN_BIT_INPUTS),.TREE_TYPE(ADDER_TREE[LAYER_ORDER[1]]))
            first_layer (.inputs(inputs),.outputs(layer_outputs[1]),
            .weights(LAYER_FIRST_WEIGHT),.bias(LAYER_FIRST_BIAS),.clk(clk));
    end
    if (BACKBONE_LAYERS != 1) begin
        for (genvar x=2; x<BACKBONE_LAYERS+1; x=x+1) begin
            activation_functions #(.OUTPUTS_SIZE(INPUTS_SIZE),.MIN_BIT_OUTPUTS(MIN_BIT_INPUTS),.AMOUNT(LAYER_SIZES[LAYER_ORDER[x-1]]),
                .ACTIVATION_FUNCTION(ACTIVATION_FUNCTION[x-1]))
                activation (.inputs(layer_outputs[x-1]),.outputs(new_layer_inputs[x-1]));
                
            // add new model layers here
            if (LAYER_TYPES[x] == "INT_LINEAR") begin // fully connected layer
                fc_layer #(.PREV_WIDTH(LAYER_SIZES[x-1]),.WIDTH(LAYER_SIZES[x]),.WEIGHTS_SIZE(WEIGHTS_SIZE[x]),
                    .INPUTS_SIZE(INPUTS_SIZE),.OUTPUTS_SIZE(INPUTS_SIZE),.MIN_BIT_INPUTS(MIN_BIT_INPUTS),
                    .MIN_BIT_WEIGHTS(LAYER_MID_WEIGHT_QUANTIZER[x-2]),.MIN_BIT_OUTPUTS(MIN_BIT_INPUTS),.TREE_TYPE(ADDER_TREE[LAYER_ORDER[x]]))
                    mid_layer (.inputs(layer_inputs[x-1]),.outputs(layer_outputs[x]),
                    .weights(LAYER_MID_WEIGHT[x-2]),.bias(LAYER_MID_BIAS[x-2]),.clk(clk));
            end
        end
    end
    activation_functions #(.OUTPUTS_SIZE(INPUTS_SIZE),.MIN_BIT_OUTPUTS(MIN_BIT_INPUTS),.AMOUNT(LAYER_SIZES[LAYER_ORDER[BACKBONE_LAYERS]]),
        .ACTIVATION_FUNCTION(ACTIVATION_FUNCTION[BACKBONE_LAYERS]))
        last_activation (.inputs(layer_outputs[BACKBONE_LAYERS]),.outputs(new_layer_inputs[BACKBONE_LAYERS]));
        
    if (DENSE == 0) begin // if no dense connection between the FEx layer and the output layer
        if (LAYER_TYPES[BACKBONE_LAYERS+1] == "INT_LINEAR") begin // fully connected layer
            fc_layer #(.PREV_WIDTH(LAYER_SIZES[BACKBONE_LAYERS]),.WIDTH(LAYER_SIZES[BACKBONE_LAYERS+1]),
                .WEIGHTS_SIZE(WEIGHTS_SIZE[LAYER_ORDER[BACKBONE_LAYERS+1]]),.INPUTS_SIZE(INPUTS_SIZE),.OUTPUTS_SIZE(INPUTS_SIZE),
                .MIN_BIT_INPUTS(MIN_BIT_INPUTS),.MIN_BIT_WEIGHTS(LAYER_LAST_WEIGHT_QUANTIZER),
                .MIN_BIT_OUTPUTS(MIN_BIT_INPUTS),
                .TREE_TYPE(ADDER_TREE[LAYER_ORDER[BACKBONE_LAYERS+1]]))
                last_layer (.inputs(layer_inputs[BACKBONE_LAYERS]),.outputs(last_layer_outputs),
                .weights(LAYER_LAST_WEIGHT),.bias(LAYER_LAST_BIAS),.clk(clk));
        end
    end
    else if (DENSE == 1) begin // if the output of the FEx layer is also sent to the input of the output layer
        logic signed [INPUTS_SIZE+MIN_BIT_INPUTS[0]-1:MIN_BIT_INPUTS[0]] delay_inputs [0:3*(BACKBONE_LAYERS+1)-2][0:LAYER_SIZES[LAYER_ORDER[0]]-1];
        always @(posedge clk) begin // delaying previous input signal for the dense connection with the output layer
            delay_inputs[0] <= inputs;
            delay_inputs[1:3*(BACKBONE_LAYERS+1)-2] <= delay_inputs[0:3*(BACKBONE_LAYERS+1)-2-1];
        end
        
        if (LAYER_TYPES[BACKBONE_LAYERS+1] == "INT_LINEAR") begin // fully connected layer
            fc_layer #(.PREV_WIDTH(LAYER_SIZES[BACKBONE_LAYERS]+LAYER_SIZES[0]),.WIDTH(LAYER_SIZES[BACKBONE_LAYERS+1]),
                .WEIGHTS_SIZE(WEIGHTS_SIZE[LAYER_ORDER[BACKBONE_LAYERS+1]]),.INPUTS_SIZE(INPUTS_SIZE),.OUTPUTS_SIZE(INPUTS_SIZE),
                .MIN_BIT_INPUTS(MIN_BIT_INPUTS),.MIN_BIT_WEIGHTS(LAYER_LAST_WEIGHT_QUANTIZER),
                .MIN_BIT_OUTPUTS(MIN_BIT_INPUTS),
                .TREE_TYPE(ADDER_TREE[LAYER_ORDER[BACKBONE_LAYERS+1]]))
                last_layer (.inputs({layer_inputs[BACKBONE_LAYERS], delay_inputs[3*(BACKBONE_LAYERS+1)-2]}),.outputs(last_layer_outputs),
                .weights(LAYER_LAST_WEIGHT),.bias(LAYER_LAST_BIAS),.clk(clk));
        end
    end
endmodule
