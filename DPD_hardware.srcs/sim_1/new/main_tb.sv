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
logic signed [INPUTS_SIZE+LAYER_FIRST_ACT_QUANTIZER-1:LAYER_FIRST_ACT_QUANTIZER] I;
logic signed [INPUTS_SIZE+LAYER_FIRST_ACT_QUANTIZER-1:LAYER_FIRST_ACT_QUANTIZER] Q;
logic signed [INPUTS_SIZE+LAYER_LAST_ACT_QUANTIZER-1:LAYER_LAST_ACT_QUANTIZER] I_out;
logic signed [INPUTS_SIZE+LAYER_LAST_ACT_QUANTIZER-1:LAYER_LAST_ACT_QUANTIZER] Q_out;
real I_float;
real Q_float;
real I_out_float_file;
real Q_out_float_file;
//real FEx_I_float;
//real FEx_Q_float;
//real FEx_abs_low_float;
//real FEx_abs_high_float;


logic signed [INPUTS_SIZE+LAYER_FIRST_ACT_QUANTIZER-1:LAYER_FIRST_ACT_QUANTIZER] I_out_file = 0;
logic signed [INPUTS_SIZE+LAYER_FIRST_ACT_QUANTIZER-1:LAYER_FIRST_ACT_QUANTIZER] Q_out_file = 0;
//logic signed [INPUTS_SIZE+LAYER_FIRST_ACT_QUANTIZER-1:LAYER_FIRST_ACT_QUANTIZER] I_FEx;
//logic signed [INPUTS_SIZE+LAYER_FIRST_ACT_QUANTIZER-1:LAYER_FIRST_ACT_QUANTIZER] Q_FEx;
//logic signed [INPUTS_SIZE+LAYER_FIRST_ACT_QUANTIZER-1:LAYER_FIRST_ACT_QUANTIZER] FEx_I_out;
//logic signed [INPUTS_SIZE+LAYER_FIRST_ACT_QUANTIZER-1:LAYER_FIRST_ACT_QUANTIZER] FEx_Q_out;
//logic signed [INPUTS_SIZE+LAYER_FIRST_ACT_QUANTIZER-1:LAYER_FIRST_ACT_QUANTIZER] abs_low_FEx;
//logic signed [INPUTS_SIZE+LAYER_FIRST_ACT_QUANTIZER-1:LAYER_FIRST_ACT_QUANTIZER] abs_high_FEx;
//logic signed [INPUTS_SIZE+LAYER_FIRST_ACT_QUANTIZER-1:LAYER_FIRST_ACT_QUANTIZER] FEx_abs_low_out;
//logic signed [INPUTS_SIZE+LAYER_FIRST_ACT_QUANTIZER-1:LAYER_FIRST_ACT_QUANTIZER] FEx_abs_high_out;

main main (.I(I),.Q(Q),.I_out(I_out),.Q_out(Q_out),.clk(clk));
//feature_extraction #(.INPUTS_SIZE(INPUTS_SIZE+ADDED_PRECISION),.ADDED_PRECISION(ADDED_PRECISION))
//            feature_extraction (.I(I),.Q(Q),.I_out(FEx_I_out),.Q_out(FEx_Q_out),.abs_low_out(FEx_abs_low_out),.abs_high_out(FEx_abs_high_out),.clk(clk));
      

integer input_file;
integer output_file;
//integer FEx_file;
integer line_num = 0;

string text;

initial begin
    input_file = $fopen("DPD_test_in.csv", "r");
    output_file = $fopen("DPD_test_out.csv", "r");
//    FEx_file = $fopen("DPD_FEx_out.csv", "r");
//    if (input_file == 0)
//        $fatal("Error, could not open: DPD_test_in.csv");
//    if (output_file == 0)
//        $fatal("Error, could not open: DPD_test_out.csv");
//    if (FEx_file == 0)
//        $fatal("Error, could not open: DPD_FEx_out.csv");
//    for (int x=0; x<7; x=x+1) begin
//        $fgets(text, FEx_file); // why is this line needed to get floats?
//        $fscanf(FEx_file, "%d,%f,%f,%f,%f", line_num+1, FEx_I_float, FEx_Q_float, FEx_abs_low_float, FEx_abs_high_float);
//        FEx_I_float = FEx_I_float*$pow(2, -LAYER_FIRST_WEIGHT_QUANTIZER);
//        FEx_Q_float = FEx_Q_float*$pow(2, -LAYER_FIRST_WEIGHT_QUANTIZER);
//        FEx_abs_low_float = FEx_abs_low_float*$pow(2, -LAYER_FIRST_WEIGHT_QUANTIZER);
//        FEx_abs_high_float = FEx_abs_high_float*$pow(2, -LAYER_FIRST_WEIGHT_QUANTIZER);
//        I_FEx = FEx_I_float;
//        Q_FEx = FEx_Q_float;
//        abs_low_FEx = FEx_abs_low_float;
//        abs_high_FEx = FEx_abs_high_float;
//    end
    while (!$feof(input_file) && !$feof(output_file)) begin
        line_num++;
        clk = 1;
        $fgets(text, input_file); // why is this line needed to get floats?
        $fscanf(input_file, "%d,%f,%f", line_num, I_float, Q_float);
        I_float = I_float*$pow(2, -LAYER_FIRST_WEIGHT_QUANTIZER);
        Q_float = Q_float*$pow(2, -LAYER_FIRST_WEIGHT_QUANTIZER);
        I = I_float;
        Q = Q_float;
        if (line_num > 19 + 2*PHASE_NORMALIZATION) begin
            $fgets(text, output_file); // why is this line needed to get floats?
            $fscanf(output_file, "%d,%f,%f", line_num-1, I_out_float_file, Q_out_float_file);
            I_out_float_file = I_out_float_file*$pow(2, -LAYER_FIRST_WEIGHT_QUANTIZER);
            Q_out_float_file = Q_out_float_file*$pow(2, -LAYER_FIRST_WEIGHT_QUANTIZER);
            I_out_file = I_out_float_file;
            Q_out_file = Q_out_float_file;
        end
//        $fgets(text, FEx_file); // why is this line needed to get floats?
//        $fscanf(FEx_file, "%d,%f,%f,%f,%f", line_num+6, FEx_I_float, FEx_Q_float, FEx_abs_low_float, FEx_abs_high_float);
//        FEx_I_float = FEx_I_float*$pow(2, -LAYER_FIRST_WEIGHT_QUANTIZER);
//        FEx_Q_float = FEx_Q_float*$pow(2, -LAYER_FIRST_WEIGHT_QUANTIZER);
//        FEx_abs_low_float = FEx_abs_low_float*$pow(2, -LAYER_FIRST_WEIGHT_QUANTIZER);
//        FEx_abs_high_float = FEx_abs_high_float*$pow(2, -LAYER_FIRST_WEIGHT_QUANTIZER);
//        I_FEx = FEx_I_float;
//        Q_FEx = FEx_Q_float;
//        abs_low_FEx = FEx_abs_low_float;
//        abs_high_FEx = FEx_abs_high_float;
        #2.5;
        clk = 0;
//        if ((I_FEx != FEx_I_out) || (Q_FEx != FEx_Q_out) || (abs_low_FEx != FEx_abs_low_out) || (abs_high_FEx != FEx_abs_high_out))
//            $error("Incorrect output of feature extraction layer");
        #2.5;
        
    end
end
    
endmodule
