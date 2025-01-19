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
//import parameter_weights_pack::*;

module feature_extraction#(parameter INPUTS_SIZE = 12,
                            parameter LAYER_FIRST_ACT_QUANTIZER = -11,
                            parameter string FEATURE_EXTRACTION = "1_3"
    )(
    // all input values will be in range -1 to 1, 0 bit is sign bit, will update inputs every clk
    input logic signed [0:1-INPUTS_SIZE] I,
    input logic signed[0:1-INPUTS_SIZE] Q,
    input logic clk,
    output wire [0:1-INPUTS_SIZE] I_out,
    output wire [0:1-INPUTS_SIZE] Q_out,
    output wire [0:1-INPUTS_SIZE] abs_low_out,
    output wire [0:1-INPUTS_SIZE] abs_high_out
    );
    
    if (FEATURE_EXTRACTION == "1_3") begin
        feature_extraction_amp1_3 #(.INPUTS_SIZE(INPUTS_SIZE),
                                    .LAYER_FIRST_ACT_QUANTIZER(LAYER_FIRST_ACT_QUANTIZER))
            feature_extraction (.I(I),.Q(Q),.I_out(I_out),.Q_out(Q_out),.abs_out(abs_low_out),.abs3_out(abs_high_out),.clk(clk));        
    end else if (FEATURE_EXTRACTION == "2_4") begin
        feature_extraction_amp2_4 #(.INPUTS_SIZE(INPUTS_SIZE),
                                    .LAYER_FIRST_ACT_QUANTIZER(LAYER_FIRST_ACT_QUANTIZER))
            feature_extraction (.I(I),.Q(Q),.I_out(I_out),.Q_out(Q_out),.abs2_out(abs_low_out),.abs4_out(abs_high_out),.clk(clk));
    end
endmodule

// is not perfectly accurate for abs3, due to rounding abs to nearest integer
module feature_extraction_amp1_3#(parameter INPUTS_SIZE = 12, // left shift input before quantization, corrected at FEx output
                                    parameter LAYER_FIRST_ACT_QUANTIZER = -11
                                    )(
    // all input values will be in range -1 to 1, 0 bit is sign bit, will update inputs every clk
    input logic signed [0:1-INPUTS_SIZE] I,
    input logic signed [0:1-INPUTS_SIZE] Q,
    input logic clk,
    output logic signed [0:1-INPUTS_SIZE] I_out,
    output logic signed [0:1-INPUTS_SIZE] Q_out,
    output logic signed [0:1-INPUTS_SIZE] abs_out,
    output logic signed [0:1-INPUTS_SIZE] abs3_out
    );
    
    logic [0:1-2*INPUTS_SIZE] abs2_2 [INPUTS_SIZE+1:0] = '{INPUTS_SIZE+2{0}};
    logic signed [0:1-INPUTS_SIZE] I_2 [INPUTS_SIZE+1:0] = '{INPUTS_SIZE+2{0}};
    logic signed [0:1-INPUTS_SIZE] Q_2 [INPUTS_SIZE+1:0] = '{INPUTS_SIZE+2{0}};
    
    logic [0:1-2*INPUTS_SIZE] abs2_tmp;
    logic [0:1-INPUTS_SIZE] abs_tmp;
    
    logic [0:1-INPUTS_SIZE] abs_3 = 0;
    logic [0:1-3*INPUTS_SIZE] abs3_3 = 0;
    logic signed [0:1-INPUTS_SIZE] I_3 = 0;
    logic signed [0:1-INPUTS_SIZE] Q_3 = 0;
    
    // has a delay of INPUTS_SIZE/2 + INPUTS_SIZE%2 + 1 rising edges
    nonrestoring_sqrt #(.INPUTS_SIZE(2*INPUTS_SIZE))
                sqrt    (.abs2(abs2_2[0]),
                        .clk(clk),
                        .abs(abs_tmp));
                        
    assign abs2_tmp = (I*I) + (Q*Q);
                        
    always_ff @(posedge clk) begin: abs2_stage // abs2 value of I and Q,
        abs2_2 <= {abs2_2[INPUTS_SIZE:0], abs2_tmp};
        I_2 <= {I_2[INPUTS_SIZE:0], I};
        Q_2 <= {Q_2[INPUTS_SIZE:0], Q};
    end
    
    always_ff @(posedge clk) begin: abs_stage
        abs_3 <= abs_tmp;
        abs3_3 <= abs2_2[INPUTS_SIZE+1]*abs_tmp;
        I_3 <= I_2[INPUTS_SIZE+1];
        Q_3 <= Q_2[INPUTS_SIZE+1];
    end
    
    assign I_out = I_3;
    assign Q_out = Q_3;
    assign abs_out = abs_3;
    assign abs3_out[0:1-INPUTS_SIZE] = abs3_3[-2*INPUTS_SIZE - 2*LAYER_FIRST_ACT_QUANTIZER:1-3*INPUTS_SIZE - 2*LAYER_FIRST_ACT_QUANTIZER] +
        abs3_3[-3*INPUTS_SIZE - 2*LAYER_FIRST_ACT_QUANTIZER];

endmodule

module feature_extraction_amp2_4 #(parameter INPUTS_SIZE = 12, // left shift input before quantization, corrected at FEx output (will decrease output size by value)
                                    parameter LAYER_FIRST_ACT_QUANTIZER = -11
                                    )(
    // all input values will be in range -1 to 1, 0 bit is sign bit, will update inputs every clk
    input logic signed [0:1-INPUTS_SIZE] I,
    input logic signed [0:1-INPUTS_SIZE] Q,
    input clk,
    output wire [0:1-INPUTS_SIZE] I_out,    
    output wire [0:1-INPUTS_SIZE] Q_out,
    output wire [0:1-INPUTS_SIZE] abs2_out,
    output wire [0:1-INPUTS_SIZE] abs4_out
    );
    
//    logic signed [0:1-2*INPUTS_SIZE] I2_1=0;
//    logic signed [0:1-2*INPUTS_SIZE] Q2_1=0;
//    logic signed [0:1-INPUTS_SIZE] I_1=0;
//    logic signed [0:1-INPUTS_SIZE] Q_1=0;
    
    logic signed [0:1-2*INPUTS_SIZE] abs2_2=0;
    logic signed [0:1-INPUTS_SIZE] I_2=0;
    logic signed [0:1-INPUTS_SIZE] Q_2=0;
    
    logic signed [0:1-2*INPUTS_SIZE] abs2_3=0;
    logic signed [-INPUTS_SIZE:1-4*INPUTS_SIZE] abs4_3=0;
    logic signed [0:1-3*INPUTS_SIZE] abs4_32=0;
    logic signed [0:1-INPUTS_SIZE] I_3=0;
    logic signed [0:1-INPUTS_SIZE] Q_3=0;
    
    logic signed [0:1-INPUTS_SIZE] abs2_4=0;
    logic signed [-LAYER_FIRST_ACT_QUANTIZER*3-3*INPUTS_SIZE:1-4*INPUTS_SIZE] abs4_4=0;
    logic signed [0:1-INPUTS_SIZE] I_4=0;
    logic signed [0:1-INPUTS_SIZE] Q_4=0;
    
    assign I_out = I_4;
    assign Q_out = Q_4;
    assign abs2_out = abs2_4;
    assign abs4_out[0:1-INPUTS_SIZE] = abs4_4[-LAYER_FIRST_ACT_QUANTIZER*3-3*INPUTS_SIZE:1-LAYER_FIRST_ACT_QUANTIZER*3-4*INPUTS_SIZE] +
        abs4_4[-LAYER_FIRST_ACT_QUANTIZER*3-4*INPUTS_SIZE];
        
    
    always_ff @(posedge clk) begin: abs4_stage2 // abs value of I and Q
        abs4_4 <= (abs4_32 << 12) + abs4_3;
        abs2_4[0:1-INPUTS_SIZE] <= abs2_3[-LAYER_FIRST_ACT_QUANTIZER-INPUTS_SIZE:1-LAYER_FIRST_ACT_QUANTIZER-2*INPUTS_SIZE] +
            abs2_3[-LAYER_FIRST_ACT_QUANTIZER-2*INPUTS_SIZE];
        I_4 <= I_3;
        Q_4 <= Q_3;
    end
    always_ff @(posedge clk) begin: abs4_stage // abs value of I and Q
        abs4_3 <= abs2_2*abs2_2[1-INPUTS_SIZE:1-2*INPUTS_SIZE];
        abs4_32 <= abs2_2*abs2_2[0:1-INPUTS_SIZE];
        abs2_3 <= abs2_2;
        I_3 <= I_2;
        Q_3 <= Q_2;
    end
    always_ff @(posedge clk) begin: abs2_stage // abs2 value of I and Q
        abs2_2 = (I*I) + (Q*Q);
        I_2 <= I;
        Q_2 <= Q;
    end
//    always_ff @(posedge clk) begin: IQ2_stage // abs2 value of I and Q
//        I2_1 <= (I*I);
//        Q2_1 <= (Q*Q);
//        I_1 <= I[0:1-INPUTS_SIZE];
//        Q_1 <= Q[0:1-INPUTS_SIZE];
//    end
endmodule
