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


module fc_layer_tb();
    parameter PREV_WIDTH = 3; // amount of neurons in the previous layer
    parameter WIDTH = 1; // amount of neurons in the FC layer
    parameter WEIGHTS_SIZE = 12; //bits of weight values
    parameter INPUTS_SIZE = 12; //bits of input values
    parameter OUTPUTS_SIZE = 12; //bits of input values
    parameter MIN_BIT_INPUTS = -11; //lowest bit of the inputs
    parameter MIN_BIT_WEIGHTS = -11; //lowest bit of the weights
    parameter MIN_BIT_OUTPUTS = -11; //lowest bit of the outputs
    parameter TREE_TYPE = 1; // what adder tree used
    parameter CLOG2_PREV_WIDTH = $clog2(PREV_WIDTH);
    
    logic signed [MIN_BIT_WEIGHTS+WEIGHTS_SIZE-1:MIN_BIT_WEIGHTS] weights [WIDTH-1:0][PREV_WIDTH-1:0];
    logic signed [WIDTH-1:0][PREV_WIDTH-1:0][MIN_BIT_WEIGHTS+WEIGHTS_SIZE-1:MIN_BIT_WEIGHTS] weights2;
    logic signed [MIN_BIT_WEIGHTS+WEIGHTS_SIZE-1:MIN_BIT_WEIGHTS] bias [WIDTH-1:0];
    logic signed [MIN_BIT_WEIGHTS+WEIGHTS_SIZE-1:MIN_BIT_WEIGHTS] bias2 [WIDTH-1:0];
    logic signed [MIN_BIT_INPUTS+INPUTS_SIZE-1:MIN_BIT_INPUTS] inputs [PREV_WIDTH-1:0];
    logic signed [PREV_WIDTH-1:0][MIN_BIT_INPUTS+INPUTS_SIZE-1:MIN_BIT_INPUTS] inputs2;
    logic signed [PREV_WIDTH-1:0][MIN_BIT_INPUTS+INPUTS_SIZE+MIN_BIT_WEIGHTS+WEIGHTS_SIZE-1:MIN_BIT_INPUTS+MIN_BIT_WEIGHTS] mult_tmp;
    logic signed [MIN_BIT_OUTPUTS+OUTPUTS_SIZE-1:MIN_BIT_OUTPUTS] outputs [WIDTH-1:0];
    logic signed [WIDTH-1:0][$clog2(PREV_WIDTH)+MIN_BIT_INPUTS+INPUTS_SIZE+MIN_BIT_WEIGHTS+WEIGHTS_SIZE-1:MIN_BIT_INPUTS+MIN_BIT_WEIGHTS] sum;
    logic signed [WIDTH-1:0][MIN_BIT_OUTPUTS+OUTPUTS_SIZE-1:MIN_BIT_OUTPUTS] sum2;
    
    fc_layer #(.PREV_WIDTH(PREV_WIDTH),.WIDTH(WIDTH),.WEIGHTS_SIZE(WEIGHTS_SIZE),.INPUTS_SIZE(INPUTS_SIZE),.OUTPUTS_SIZE(OUTPUTS_SIZE),
                .MIN_BIT_INPUTS(MIN_BIT_INPUTS),.MIN_BIT_WEIGHTS(MIN_BIT_WEIGHTS),.MIN_BIT_OUTPUTS(MIN_BIT_OUTPUTS),.TREE_TYPE(TREE_TYPE))
        FC_LAYER (.inputs(inputs),.outputs(outputs),.weights(weights),.bias(bias));
        
    parameter SUM_MAX = ($clog2(PREV_WIDTH)+MIN_BIT_INPUTS+INPUTS_SIZE+MIN_BIT_WEIGHTS+WEIGHTS_SIZE-1 < MIN_BIT_OUTPUTS+OUTPUTS_SIZE-1) ? 
                            $clog2(PREV_WIDTH)+MIN_BIT_INPUTS+INPUTS_SIZE+MIN_BIT_WEIGHTS+WEIGHTS_SIZE-1 : MIN_BIT_OUTPUTS+OUTPUTS_SIZE-1;
    parameter SUM_MIN = (MIN_BIT_INPUTS+MIN_BIT_WEIGHTS < MIN_BIT_OUTPUTS) ? MIN_BIT_OUTPUTS : MIN_BIT_INPUTS+MIN_BIT_WEIGHTS;
    
    initial begin
        for (int i=0;i<50;i=i+1) begin
            for (int j=0; j<PREV_WIDTH; j=j+1) begin
                inputs[j] = $random;
                inputs2[j] = inputs[j];
                bias[j] = $random;
                bias2[j] = bias[j];
                for (int k=0; k<WIDTH; k=k+1) begin
                    weights[k][j] = $random;
                    weights2[k][j] = weights[k][j];
                end
            end
            sum = '{WIDTH{'b0}};
            sum2 = '{WIDTH{'b0}};
            #5;
            for (int i=0; i<WIDTH; i=i+1) begin
                sum[i][$clog2(PREV_WIDTH)+MIN_BIT_INPUTS+INPUTS_SIZE+MIN_BIT_WEIGHTS+WEIGHTS_SIZE-1:MIN_BIT_WEIGHTS+WEIGHTS_SIZE] = '{$clog2(PREV_WIDTH)+MIN_BIT_INPUTS+INPUTS_SIZE{bias2[i][MIN_BIT_WEIGHTS+WEIGHTS_SIZE-1]}};
                sum[i][MIN_BIT_WEIGHTS+WEIGHTS_SIZE-1:MIN_BIT_WEIGHTS] = bias2[i];
                for (int j=0; j<PREV_WIDTH; j=j+1) begin
                    mult_tmp[j] = inputs2[j] * weights2[i][j];
                    sum[i] = sum[i] + {{CLOG2_PREV_WIDTH{mult_tmp[j][MIN_BIT_INPUTS+INPUTS_SIZE+MIN_BIT_WEIGHTS+WEIGHTS_SIZE-1]}}, mult_tmp[j]};
                end
            end
            for (int i=0; i<WIDTH; i=i+1) begin
                for (int j=SUM_MIN; j<=SUM_MAX; j=j+1) begin
                    sum2[i][j] = sum[i][j];
                end
                for (int j=SUM_MAX+1; j<MIN_BIT_OUTPUTS+OUTPUTS_SIZE; j=j+1) begin
                    sum2[i][i] = sum[i][$clog2(PREV_WIDTH)+MIN_BIT_INPUTS+INPUTS_SIZE+MIN_BIT_WEIGHTS+WEIGHTS_SIZE-1];
                end
            end
            for (int i=0;i<WIDTH;i=i+1) begin
                if (sum2[i] != outputs[i]) begin
                    $error("Incorrect output data, time=%0t in=%0h, out=%0h, index=%0d.", $time, sum2[i], outputs[i], i);
                end
            end
            #5;
        end
    end
endmodule
