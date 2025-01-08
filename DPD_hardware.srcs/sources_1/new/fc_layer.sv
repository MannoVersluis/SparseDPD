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
                    parameter OUTPUTS_SIZE = 12, //bits of output values
//                    parameter BIAS_SIZE = 12, //bits of bias values
                    parameter MIN_BIT_INPUTS = -11, //lowest bit of the inputs
                    parameter MIN_BIT_WEIGHTS = -11, //lowest bit of the weights
                    parameter MIN_BIT_OUTPUTS = -11, //lowest bit of the outputs
//                    parameter MIN_BIT_BIAS = -11, //lowest bit of the bias
                    parameter TREE_TYPE = 1 // what adder tree used
                )(
    input logic signed [MIN_BIT_INPUTS+INPUTS_SIZE-1:MIN_BIT_INPUTS] inputs [0:PREV_WIDTH-1],
    input logic signed [MIN_BIT_WEIGHTS+WEIGHTS_SIZE-1:MIN_BIT_WEIGHTS] weights [0:WIDTH-1][0:PREV_WIDTH-1],
    input logic signed [MIN_BIT_WEIGHTS+WEIGHTS_SIZE-1:MIN_BIT_WEIGHTS] bias [0:WIDTH-1],
    output wire [MIN_BIT_OUTPUTS+OUTPUTS_SIZE-1:MIN_BIT_OUTPUTS] outputs [0:WIDTH-1]
    );
    
    genvar i;
    
    generate
        for (i=0; i<WIDTH; i=i+1)
            fc_node #(.PREV_WIDTH(PREV_WIDTH),.WEIGHTS_SIZE(WEIGHTS_SIZE),.INPUTS_SIZE(INPUTS_SIZE),.OUTPUTS_SIZE(OUTPUTS_SIZE),
            .MIN_BIT_INPUTS(MIN_BIT_INPUTS),.MIN_BIT_WEIGHTS(MIN_BIT_WEIGHTS),.MIN_BIT_OUTPUTS(MIN_BIT_OUTPUTS),.TREE_TYPE(TREE_TYPE))
                fc_node (.inputs(inputs),.outputs(outputs[i][MIN_BIT_OUTPUTS+OUTPUTS_SIZE-1:MIN_BIT_OUTPUTS]),
                        .weights(weights[i]),.bias(bias[i]));
    endgenerate
    
endmodule



module fc_node #(parameter PREV_WIDTH = 16, //amount of neurons in the previous layer
                    parameter WEIGHTS_SIZE = 8, //bits of weight values
                    parameter INPUTS_SIZE = 8, //bits of input values
                    parameter OUTPUTS_SIZE = 16, //bits of input values
                    parameter MIN_BIT_INPUTS = -7, //lowest bit of the inputs
                    parameter MIN_BIT_WEIGHTS = -7, //lowest bit of the weights
                    parameter MIN_BIT_OUTPUTS = -13, //lowest bit of the outputs
                    parameter TREE_TYPE = 1 // what adder tree used
                    )(
    input logic signed [MIN_BIT_INPUTS+INPUTS_SIZE-1:MIN_BIT_INPUTS] inputs [0:PREV_WIDTH-1],
    input logic signed [MIN_BIT_WEIGHTS+WEIGHTS_SIZE-1:MIN_BIT_WEIGHTS] weights [0:PREV_WIDTH-1],
    input logic signed [MIN_BIT_WEIGHTS+WEIGHTS_SIZE-1:MIN_BIT_WEIGHTS] bias,
    output wire [MIN_BIT_OUTPUTS+OUTPUTS_SIZE-1:MIN_BIT_OUTPUTS] outputs
    );                                
    
    localparam MAX_OUT_BIT = (MIN_BIT_INPUTS+INPUTS_SIZE+MIN_BIT_WEIGHTS+WEIGHTS_SIZE-1 < MIN_BIT_OUTPUTS+OUTPUTS_SIZE-1) ? 
                    MIN_BIT_INPUTS+INPUTS_SIZE+MIN_BIT_WEIGHTS+WEIGHTS_SIZE-1 : MIN_BIT_OUTPUTS+OUTPUTS_SIZE-1;
    localparam MIN_OUT_BIT = (MIN_BIT_INPUTS+MIN_BIT_WEIGHTS > MIN_BIT_OUTPUTS) ? 
                    MIN_BIT_INPUTS+MIN_BIT_WEIGHTS : MIN_BIT_OUTPUTS;
    
    integer i;
    genvar j;
    
    logic signed [MIN_BIT_INPUTS+INPUTS_SIZE+MIN_BIT_WEIGHTS+WEIGHTS_SIZE-2:MIN_BIT_INPUTS+MIN_BIT_WEIGHTS-1] mult_out [PREV_WIDTH:0];
    logic signed [MIN_BIT_INPUTS+INPUTS_SIZE+MIN_BIT_WEIGHTS+WEIGHTS_SIZE-2:MIN_BIT_INPUTS+MIN_BIT_WEIGHTS-1] new_outputs;
    
    assign mult_out[PREV_WIDTH][MIN_BIT_INPUTS+INPUTS_SIZE+MIN_BIT_WEIGHTS+WEIGHTS_SIZE-2:WEIGHTS_SIZE+MIN_BIT_INPUTS-1] = '{bias[MIN_BIT_WEIGHTS+WEIGHTS_SIZE-1]};
    assign mult_out[PREV_WIDTH][WEIGHTS_SIZE+MIN_BIT_INPUTS-2:MIN_BIT_INPUTS-1] = bias;
    assign mult_out[PREV_WIDTH][MIN_BIT_INPUTS-2:MIN_BIT_INPUTS+MIN_BIT_WEIGHTS-1] = 'b0;
    
    // assign other mult_out bits to 0
    assign outputs[MAX_OUT_BIT:MIN_OUT_BIT] = new_outputs[MIN_BIT_INPUTS+INPUTS_SIZE-2:MIN_BIT_INPUTS-1] + new_outputs[MIN_BIT_INPUTS-2];
    if (MIN_BIT_INPUTS+INPUTS_SIZE+MIN_BIT_WEIGHTS+WEIGHTS_SIZE-1 < MIN_BIT_OUTPUTS+OUTPUTS_SIZE-1)
        assign outputs[MIN_BIT_OUTPUTS+OUTPUTS_SIZE-1:MAX_OUT_BIT+1] = new_outputs[MAX_OUT_BIT];
    if (MIN_BIT_INPUTS+MIN_BIT_WEIGHTS > MIN_BIT_OUTPUTS)
        assign outputs[MIN_OUT_BIT-1:MIN_BIT_OUTPUTS] = 'b0;
    
    adder_trees #(.INPUTS_SIZE(INPUTS_SIZE+WEIGHTS_SIZE),.INPUTS_AMOUNT(PREV_WIDTH+1),.MIN_BIT_INPUTS(MIN_BIT_INPUTS+MIN_BIT_WEIGHTS),
                .TREE_TYPE(TREE_TYPE))
        tree_layer (.inputs(mult_out),.output_sum(new_outputs));
    
    always @*
    begin
        for (i=0; i < PREV_WIDTH; i=i+1)
            mult_out[i] = inputs[i] * weights[i];
    end
    
    

endmodule




