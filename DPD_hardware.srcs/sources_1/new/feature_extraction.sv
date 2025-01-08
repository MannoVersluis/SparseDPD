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
import parameter_weights_pack::*;

module feature_extraction#(parameter INPUTS_SIZE,
                            parameter ADDED_PRECISION // left shift input before quantization, corrected at FEx output
                                    )(
    // all input values will be in range -1 to 1, 0 bit is sign bit, will update inputs every clk
    input logic [0:1-INPUTS_SIZE] I,
    input logic [0:1-INPUTS_SIZE] Q,
    input logic clk,
    output wire [0:1-INPUTS_SIZE] I_out,
    output wire [0:1-INPUTS_SIZE] Q_out,
    output wire [0:1-INPUTS_SIZE] abs_low_out,
    output wire [0:1-INPUTS_SIZE] abs_high_out
    );
    
    if (FEATURE_EXTRACTION == "1_3") begin
        feature_extraction_amp1_3 #(.INPUTS_SIZE(INPUTS_SIZE),.ADDED_PRECISION(ADDED_PRECISION))
            feature_extraction (.I(I),.Q(Q),.I_out(I_out),.Q_out(Q_out),.abs1_out(abs_low_out),.abs3_out(abs_high_out),.clk(clk));        
    end else if (FEATURE_EXTRACTION == "2_4") begin
        feature_extraction_amp2_4 #(.INPUTS_SIZE(INPUTS_SIZE),.ADDED_PRECISION(ADDED_PRECISION))
            feature_extraction (.I(I),.Q(Q),.I_out(I_out),.Q_out(Q_out),.abs2_out(abs_low_out),.abs4_out(abs_high_out),.clk(clk));
    end
endmodule

module feature_extraction_amp1_3#(parameter INPUTS_SIZE,
                            parameter ADDED_PRECISION // left shift input before quantization, corrected at FEx output
                                    )(
    // all input values will be in range -1 to 1, 0 bit is sign bit, will update inputs every clk
    input logic [0:1-INPUTS_SIZE] I,
    input logic [0:1-INPUTS_SIZE] Q,
    input logic clk,
    output wire [0:1-INPUTS_SIZE] I_out,
    output wire [0:1-INPUTS_SIZE] Q_out,
    output wire [0:1-INPUTS_SIZE] abs_out,
    output wire [0:1-INPUTS_SIZE] abs3_out
    );
endmodule

module feature_extraction_amp2_4 #(parameter INPUTS_SIZE,
                            parameter ADDED_PRECISION // left shift input before quantization, corrected at FEx output (will decrease output size by value)
                                    )(
    // all input values will be in range -1 to 1, 0 bit is sign bit, will update inputs every clk
    input logic signed [0:1-INPUTS_SIZE] I,
    input logic signed [0:1-INPUTS_SIZE] Q,
    input clk,
    output wire [0:1-INPUTS_SIZE+ADDED_PRECISION] I_out,    
    output wire [0:1-INPUTS_SIZE+ADDED_PRECISION] Q_out,
    output wire [0:1-INPUTS_SIZE+ADDED_PRECISION] abs2_out,
    output wire [0:1-INPUTS_SIZE+ADDED_PRECISION] abs4_out
    );
    
    logic signed [0:1-2*INPUTS_SIZE] I2_1=0;
    logic signed [0:1-2*INPUTS_SIZE] Q2_1=0;
    logic signed [0:1-INPUTS_SIZE+ADDED_PRECISION] I_1=0;
    logic signed [0:1-INPUTS_SIZE+ADDED_PRECISION] Q_1=0;
    
    logic signed [0:1-2*INPUTS_SIZE] abs2_2=0;
    logic signed [0:1-INPUTS_SIZE+ADDED_PRECISION] I_2=0;
    logic signed [0:1-INPUTS_SIZE+ADDED_PRECISION] Q_2=0;
    
    logic signed [0:1-INPUTS_SIZE+ADDED_PRECISION] abs2_3=0;
    logic signed [0:1-4*INPUTS_SIZE] abs4_3=0;
    logic signed [0:1-INPUTS_SIZE+ADDED_PRECISION] I_3=0;
    logic signed [0:1-INPUTS_SIZE+ADDED_PRECISION] Q_3=0;
    
    assign I_out = I_3;
    assign Q_out = Q_3;
    assign abs2_out = abs2_3;
    assign abs4_out[0:1-INPUTS_SIZE+ADDED_PRECISION] = abs4_3[-2*ADDED_PRECISION-LAYER_FIRST_WEIGHT_QUANTIZER*3-3*INPUTS_SIZE:1-ADDED_PRECISION-LAYER_FIRST_WEIGHT_QUANTIZER*3-4*INPUTS_SIZE] +
        abs4_3[-ADDED_PRECISION-LAYER_FIRST_WEIGHT_QUANTIZER*3-4*INPUTS_SIZE];
    
    always_ff @(posedge clk) begin: abs4_stage // abs value of I and Q
        abs4_3 = abs2_2*abs2_2;
        abs2_3[0:1-INPUTS_SIZE+ADDED_PRECISION] = abs2_2[-2*ADDED_PRECISION-LAYER_FIRST_WEIGHT_QUANTIZER-INPUTS_SIZE:1-ADDED_PRECISION-LAYER_FIRST_WEIGHT_QUANTIZER-2*INPUTS_SIZE] +
            abs2_2[-ADDED_PRECISION-LAYER_FIRST_WEIGHT_QUANTIZER-2*INPUTS_SIZE];
        I_3 = I_2;
        Q_3 = Q_2;
    end
    always_ff @(posedge clk) begin: abs2_stage // abs2 value of I and Q
        abs2_2 = I2_1+Q2_1;
        I_2 = I_1;
        Q_2 = Q_1;
    end
    always_ff @(posedge clk) begin: IQ2_stage // abs2 value of I and Q
        I2_1 = (I*I);
        Q2_1 = (Q*Q);
        I_1 = I[0:1-INPUTS_SIZE+ADDED_PRECISION];
        Q_1 = Q[0:1-INPUTS_SIZE+ADDED_PRECISION];
    end
endmodule
