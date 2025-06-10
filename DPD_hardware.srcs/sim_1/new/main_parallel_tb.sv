`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2024 07:27:34 PM
// Design Name: 
// Module Name: main_tb
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

module main_parallel_tb();

parameter PARALLEL_IMP = 1;


logic clk;
logic signed [0:1-INPUTS_SIZE] I [PARALLEL_IMP-1:0];
logic signed [0:1-INPUTS_SIZE] Q [PARALLEL_IMP-1:0];
logic signed [1:1-2*INPUTS_SIZE] I_out [PARALLEL_IMP-1:0];
logic signed [1:1-2*INPUTS_SIZE] Q_out [PARALLEL_IMP-1:0];
logic signed [1:1-2*INPUTS_SIZE] I_out_file [PARALLEL_IMP-1:0];
logic signed [1:1-2*INPUTS_SIZE] Q_out_file [PARALLEL_IMP-1:0];
real I_float [PARALLEL_IMP-1:0];
real Q_float [PARALLEL_IMP-1:0];
real I_out_float_file [PARALLEL_IMP-1:0];
real Q_out_float_file [PARALLEL_IMP-1:0];

main_parallel #(.PARALLEL_IMP(PARALLEL_IMP)) main (.I(I),.Q(Q),.I_out(I_out),.Q_out(Q_out),.clk(clk));

integer input_file;
integer output_file;
integer line_num = 0;
integer i;

string text;

initial begin
    input_file = $fopen("DPD_test_in.csv", "r");
    output_file = $fopen("DPD_test_out.csv", "r");
    $fgets(text, output_file); // why is this line needed to get floats?
    while (!$feof(input_file) && !$feof(output_file)) begin
        line_num++;
        clk = 1;
        for (i=0; i<PARALLEL_IMP; i=i+1) begin
            $fgets(text, input_file); // why is this line needed to get floats?
            $fscanf(input_file, "%d,%f,%f", line_num, I_float[i], Q_float[i]);
            I_float[i] = I_float[i]*$pow(2, -LAYER_FIRST_WEIGHT_QUANTIZER);
            Q_float[i] = Q_float[i]*$pow(2, -LAYER_FIRST_WEIGHT_QUANTIZER);
            I[i] = I_float[i];
            Q[i] = Q_float[i];
            if (line_num > (14 + 3*PHASE_NORMALIZATION + 4*BACKBONE_LAYERS)*PARALLEL_IMP) begin
                $fgets(text, output_file); // why is this line needed to get floats?
                $fscanf(output_file, "%d,%f,%f", line_num, I_out_float_file[i], Q_out_float_file[i]);
                I_out_float_file[i] = I_out_float_file[i]*$pow(2, -2*LAYER_FIRST_WEIGHT_QUANTIZER);
                Q_out_float_file[i] = Q_out_float_file[i]*$pow(2, -2*LAYER_FIRST_WEIGHT_QUANTIZER);
                I_out_file[i] = I_out_float_file[i];
                Q_out_file[i] = Q_out_float_file[i];
            end
        end
        #2.5;
        clk = 0;
        for (i=0; i<PARALLEL_IMP; i=i+1) begin
            if (I_out[i] != I_out_file[i] || Q_out[i] != Q_out_file[i]) begin
                $error("Incorrect output data, time=%0t, I_out=%0h, I_out_file=%0h, Q_out=%0f, Q_out_file=%0f, i=%0d", $time, I_out[i], I_out_file[i], Q_out[i], Q_out_file[i], i);
            end
        end
        #2.5;
        
    end
end
    
endmodule
