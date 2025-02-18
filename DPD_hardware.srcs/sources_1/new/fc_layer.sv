`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2024 11:07:01 AM
// Design Name: 
// Module Name: feature_extraction
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

//#TODO: solve output rounding for sum of inputs



 // make fc_layer obtain weights from parameters and add bias to it
module fc_layer #(parameter PREV_WIDTH = 16, // amount of neurons in the previous layer
                    parameter WIDTH = 16, // amount of neurons in the FC layer
                    parameter WEIGHTS_SIZE = 12, //bits of weight values
                    parameter INPUTS_SIZE = 12, //bits of input values
                    parameter MIN_BIT_INPUTS = -11, //lowest bit of the inputs
                    parameter MIN_BIT_WEIGHTS = -11, //lowest bit of the weights
                    parameter TREE_TYPE = 1, // what adder tree used
                    parameter LAST = 0 // is this the last layer? for truncating and clamping, 1 for true, 0 for false
                )(
//    input logic signed [MIN_BIT_INPUTS+INPUTS_SIZE-1:MIN_BIT_INPUTS] inputs [0:PREV_WIDTH-1],
//    input logic signed [MIN_BIT_WEIGHTS+WEIGHTS_SIZE-1:MIN_BIT_WEIGHTS] weights [0:WIDTH-1][0:PREV_WIDTH-1],
//    input logic signed [MIN_BIT_WEIGHTS+WEIGHTS_SIZE-1:MIN_BIT_WEIGHTS] bias [0:WIDTH-1],
//    input logic clk,
//    output logic signed [MIN_BIT_OUTPUTS+OUTPUTS_SIZE-1:MIN_BIT_OUTPUTS] outputs [0:WIDTH-1]
    input logic signed [0:1-INPUTS_SIZE] inputs [0:PREV_WIDTH-1],
    input logic signed [0:1-WEIGHTS_SIZE] weights [0:WIDTH-1][0:PREV_WIDTH-1],
    input logic signed [0:1-WEIGHTS_SIZE] bias [0:WIDTH-1],
    input logic clk,
    output logic signed [LAST:1-INPUTS_SIZE] outputs [0:WIDTH-1]
    );
    
    genvar i;
    
    generate
        for (i=0; i<WIDTH; i=i+1)
            fc_node #(.PREV_WIDTH(PREV_WIDTH),
                        .WEIGHTS_SIZE(WEIGHTS_SIZE),
                        .INPUTS_SIZE(INPUTS_SIZE),
                        .MIN_BIT_INPUTS(MIN_BIT_INPUTS),
                        .MIN_BIT_WEIGHTS(MIN_BIT_WEIGHTS),
                        .TREE_TYPE(TREE_TYPE),
                        .LAST(LAST))
                fc_node (.inputs(inputs),
                            .outputs(outputs[i]),
                            .weights(weights[i]),
                            .bias(bias[i]),
                            .clk(clk));
    endgenerate
    
endmodule



module fc_node #(parameter PREV_WIDTH = 16, //amount of neurons in the previous layer
                    parameter WEIGHTS_SIZE = 8, //bits of weight values
                    parameter INPUTS_SIZE = 8, //bits of input values
                    parameter MIN_BIT_INPUTS = -7, //lowest bit of the inputs
                    parameter MIN_BIT_WEIGHTS = -7, //lowest bit of the weights
                    parameter TREE_TYPE = 1, // what adder tree used
                    parameter LAST = 0 // is this the last layer? for truncating and clamping, 1 for true, 0 for false
                    )(
//    input logic signed [MIN_BIT_INPUTS+INPUTS_SIZE-1:MIN_BIT_INPUTS] inputs [0:PREV_WIDTH-1],
//    input logic signed [MIN_BIT_WEIGHTS+WEIGHTS_SIZE-1:MIN_BIT_WEIGHTS] weights [0:PREV_WIDTH-1],
//    input logic signed [MIN_BIT_WEIGHTS+WEIGHTS_SIZE-1:MIN_BIT_WEIGHTS] bias,
//    input logic clk,
//    output logic signed [MIN_BIT_OUTPUTS+OUTPUTS_SIZE-1:MIN_BIT_OUTPUTS] outputs
    input logic signed [0:1-INPUTS_SIZE] inputs [0:PREV_WIDTH-1],
    input logic signed [0:1-WEIGHTS_SIZE] weights [0:PREV_WIDTH-1],
    input logic signed [0:1-WEIGHTS_SIZE] bias,
    input logic clk,
    output logic signed [LAST:1-INPUTS_SIZE] outputs
    );                                
    
//    logic signed [MIN_BIT_INPUTS+INPUTS_SIZE+MIN_BIT_WEIGHTS+WEIGHTS_SIZE-2:MIN_BIT_INPUTS+MIN_BIT_WEIGHTS-1] mult_out [PREV_WIDTH:0];
//    logic signed [MIN_BIT_INPUTS+INPUTS_SIZE+MIN_BIT_WEIGHTS+WEIGHTS_SIZE-2:MIN_BIT_INPUTS+MIN_BIT_WEIGHTS-1] new_mult_out [PREV_WIDTH:0];
//    logic signed [MIN_BIT_INPUTS+INPUTS_SIZE+MIN_BIT_WEIGHTS+WEIGHTS_SIZE-2:MIN_BIT_INPUTS+MIN_BIT_WEIGHTS-1] new_outputs;
    logic signed [0:1-INPUTS_SIZE-WEIGHTS_SIZE] new_mult_out [PREV_WIDTH-1:0];
    logic signed [1:1-INPUTS_SIZE-WEIGHTS_SIZE] new_tree_in [PREV_WIDTH:0];
    logic signed [1:1-INPUTS_SIZE-WEIGHTS_SIZE] tree_in [PREV_WIDTH:0];
    logic signed [1:1-INPUTS_SIZE-WEIGHTS_SIZE] new_outputs;
    
    if (MIN_BIT_INPUTS+WEIGHTS_SIZE > 0)
        assign new_tree_in[PREV_WIDTH][1:1-WEIGHTS_SIZE-MIN_BIT_INPUTS] = {MIN_BIT_INPUTS+WEIGHTS_SIZE+1{bias[0]}};
    assign new_tree_in[PREV_WIDTH][0-WEIGHTS_SIZE-MIN_BIT_INPUTS -:WEIGHTS_SIZE] = bias;
    assign new_tree_in[PREV_WIDTH][0-2*WEIGHTS_SIZE-MIN_BIT_INPUTS:1-INPUTS_SIZE-WEIGHTS_SIZE] = 'b0;
    
    
    adder_trees #(.INPUTS_SIZE(INPUTS_SIZE+WEIGHTS_SIZE+1),
                    .INPUTS_AMOUNT(PREV_WIDTH+1),
                    .TREE_TYPE(TREE_TYPE))
        tree_layer (.inputs(tree_in),
                    .output_sum(new_outputs),
                    .clk(clk));
    
    always @*
    begin
        for (int i=0; i < PREV_WIDTH; i=i+1) begin
            new_mult_out[i] = inputs[i] * weights[i];
            new_tree_in[i] = {new_mult_out[i][0], new_mult_out[i]}; // the tree in is 1 bit bigger than the mult to prevent overflow of the result
        end
    end
    
    always_ff @(posedge clk) begin
        tree_in <= new_tree_in;
        
        if (MIN_BIT_WEIGHTS+WEIGHTS_SIZE < LAST) begin // if new_outputs needs to be right shifted and sign extended to get correct outputs
            outputs[LAST -:LAST-MIN_BIT_WEIGHTS-WEIGHTS_SIZE] = {LAST-MIN_BIT_WEIGHTS-WEIGHTS_SIZE{new_outputs[0]}};
            outputs[-MIN_BIT_WEIGHTS-WEIGHTS_SIZE:1-INPUTS_SIZE] <= new_outputs[0 -:INPUTS_SIZE-MIN_BIT_WEIGHTS-WEIGHTS_SIZE] + new_outputs[-INPUTS_SIZE-MIN_BIT_WEIGHTS-WEIGHTS_SIZE];
        end
        else if (MIN_BIT_WEIGHTS >= 0) begin // if new_outputs needs to be left shifted to get correct outputs (no rounding bits available)
            outputs[0:1-INPUTS_SIZE+MIN_BIT_WEIGHTS] <= new_outputs[1-INPUTS_SIZE-WEIGHTS_SIZE +:INPUTS_SIZE-MIN_BIT_WEIGHTS];
            if (MIN_BIT_WEIGHTS > 0)
                outputs[1-INPUTS_SIZE +:MIN_BIT_WEIGHTS] = 'b0;
        end
        else begin // if new_outputs needs to be right shifted to get correct outputs
            if ((LAST == 0) && (new_outputs[0] != new_outputs[-1] || new_outputs[1] != new_outputs[0])) begin // in case of overflow (since new_outputs has range 2:-2 and outputs 1:-1) clamp result
                outputs[0] <= new_outputs[1];
                outputs[-1:1-INPUTS_SIZE] <= {INPUTS_SIZE-1{!new_outputs[1]}};
            end
            else begin
                outputs <= new_outputs[1-INPUTS_SIZE-WEIGHTS_SIZE-MIN_BIT_WEIGHTS +:INPUTS_SIZE+LAST] + new_outputs[-INPUTS_SIZE-WEIGHTS_SIZE-MIN_BIT_WEIGHTS];
            end
        end
    end
    
    

endmodule




