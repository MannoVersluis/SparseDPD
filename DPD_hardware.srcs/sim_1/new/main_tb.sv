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

module main_tb();


logic clk;
logic signed [0:1-INPUTS_SIZE] I;
logic signed [0:1-INPUTS_SIZE] Q;
logic signed [1:1-2*INPUTS_SIZE] I_out;
logic signed [1:1-2*INPUTS_SIZE] Q_out;
logic signed [1:1-2*INPUTS_SIZE] I_out_file = 0;
logic signed [1:1-2*INPUTS_SIZE] Q_out_file = 0;
real I_float;
real Q_float;
real I_out_float_file;
real Q_out_float_file;

main main (.I(I),.Q(Q),.I_out(I_out),.Q_out(Q_out),.clk(clk));

integer input_file;
integer output_file;
integer line_num = 0;

string text;

initial begin
    input_file = $fopen("DPD_test_in.csv", "r");
    output_file = $fopen("DPD_test_out.csv", "r");
    while (!$feof(input_file) && !$feof(output_file)) begin
        line_num++;
        clk = 1;
        $fgets(text, input_file); // why is this line needed to get floats?
        $fscanf(input_file, "%d,%f,%f", line_num, I_float, Q_float);
        I_float = I_float*$pow(2, -LAYER_FIRST_WEIGHT_QUANTIZER);
        Q_float = Q_float*$pow(2, -LAYER_FIRST_WEIGHT_QUANTIZER);
        I = I_float;
        Q = Q_float;
        if (line_num > 16 + 3*PHASE_NORMALIZATION) begin
            $fgets(text, output_file); // why is this line needed to get floats?
            $fscanf(output_file, "%d,%f,%f", line_num-1, I_out_float_file, Q_out_float_file);
            I_out_float_file = I_out_float_file*$pow(2, -2*LAYER_FIRST_WEIGHT_QUANTIZER);
            Q_out_float_file = Q_out_float_file*$pow(2, -2*LAYER_FIRST_WEIGHT_QUANTIZER);
            I_out_file = I_out_float_file;
            Q_out_file = Q_out_float_file;
        end
        #2.5;
        clk = 0;
            if (I_out != I_out_file || Q_out != Q_out_file) begin
                $error("Incorrect output data, time=%0t, I_out=%0h, I_out_file=%0h, Q_out=%0f, Q_out_file=%0f", $time, I_out, I_out_file, Q_out, Q_out_file);
            end
        #2.5;
        
    end
end
    
endmodule
