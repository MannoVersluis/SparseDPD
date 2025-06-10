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
                            parameter string FEATURE_EXTRACTION = "1_3_INV"
    )(
    // all input values will be in range -1 to 1, 0 bit is sign bit, will update inputs every clk
    input logic signed [0:1-INPUTS_SIZE] I,
    input logic signed[0:1-INPUTS_SIZE] Q,
    input logic clk,
    output logic [0:1-INPUTS_SIZE] I_out,
    output logic [0:1-INPUTS_SIZE] Q_out,
    output logic [0:1-INPUTS_SIZE] abs_low_out,
    output logic [0:1-INPUTS_SIZE] abs_high_out,
    output logic [0:1-INPUTS_SIZE] norm_I_out, // next I input, used to determine complex complement for next cycle
    output logic [0:1-INPUTS_SIZE] norm_Q_out  // next Q input, used to determine complex complement for next cycle
    );
    
    if (FEATURE_EXTRACTION == "1_3_INV") begin
        feature_extraction_amp1_3_inv_sqrt #(.INPUTS_SIZE(INPUTS_SIZE),
                                    .LAYER_FIRST_ACT_QUANTIZER(LAYER_FIRST_ACT_QUANTIZER))
            feature_extraction (.I(I),
                                .Q(Q),
                                .I_out(I_out),
                                .Q_out(Q_out),
                                .abs_out(abs_low_out),
                                .abs3_out(abs_high_out),
                                .clk(clk),
                                .norm_I_out(norm_I_out),
                                .norm_Q_out(norm_Q_out)
                            );
    end
endmodule

module feature_extraction_amp1_3_inv_sqrt#(parameter INPUTS_SIZE = 12, // left shift input before quantization, corrected at FEx output
                                            parameter LAYER_FIRST_ACT_QUANTIZER = -11
                                    )(
    // all input values will be in range -1 to 1, 0 bit is sign bit, will update inputs every clk
    input logic signed [0:1-INPUTS_SIZE] I,
    input logic signed [0:1-INPUTS_SIZE] Q,
    input logic clk,
    output logic signed [0:1-INPUTS_SIZE] I_out,
    output logic signed [0:1-INPUTS_SIZE] Q_out,
    output logic [0:1-INPUTS_SIZE] abs_out,
    output logic [0:1-INPUTS_SIZE] abs3_out,
    output logic signed [0:1-INPUTS_SIZE] norm_I_out, // next I input, used to determine complex complement for next cycle
    output logic signed [0:1-INPUTS_SIZE] norm_Q_out  // next Q input, used to determine complex complement for next cycle
    
    );
    
    localparam int DELAY_STORAGE_SIZE = 7; // how many clock cyles-1 bits are stored while inv_sqrt is calculated
    localparam int SQRT_EXTRA_IN_BITS = 1; // input to inv sqrt module is INPUTS_SIZE + SQRT_EXTRA_IN_BITS bits
    localparam int SQRT_EXTRA_OUT_BITS = 4; // output of inv sqrt module is INPUTS_SIZE + SQRT_EXTRA_OUT_BITS + SQRT_EXTRA_IN_BITS bits
    
    logic [-2:1-2*INPUTS_SIZE] abs2_2 [DELAY_STORAGE_SIZE-1:0];
    logic signed [0:1-INPUTS_SIZE] I_2 [DELAY_STORAGE_SIZE-1:0];
    logic signed [0:1-INPUTS_SIZE] Q_2 [DELAY_STORAGE_SIZE-1:0];
    logic [$clog2(INPUTS_SIZE):0] shift [DELAY_STORAGE_SIZE-1:0];
    
    logic [0:1-2*INPUTS_SIZE] abs2_tmp;
    logic [0:1-SQRT_EXTRA_IN_BITS-SQRT_EXTRA_OUT_BITS-INPUTS_SIZE] inv_abs_tmp;
    logic [$clog2(INPUTS_SIZE):0] new_shift;
    logic [0:1-2*INPUTS_SIZE] abs2_sqrt_in;
    
    logic [0:1-2*INPUTS_SIZE-INPUTS_SIZE/2-INPUTS_SIZE%2-SQRT_EXTRA_OUT_BITS-SQRT_EXTRA_IN_BITS] abs_3;
    logic [0:1-2*INPUTS_SIZE] abs2_3;
    logic signed [0:1-INPUTS_SIZE] I_3;
    logic signed [0:1-INPUTS_SIZE] Q_3;
    logic signed [0:1-2*INPUTS_SIZE-SQRT_EXTRA_OUT_BITS-SQRT_EXTRA_IN_BITS] norm_I_3;
    logic signed [0:1-2*INPUTS_SIZE-SQRT_EXTRA_OUT_BITS-SQRT_EXTRA_IN_BITS] norm_Q_3;
    
    logic [0:1-2*INPUTS_SIZE-INPUTS_SIZE/2-INPUTS_SIZE%2-SQRT_EXTRA_OUT_BITS-SQRT_EXTRA_IN_BITS] abs_4;
    logic [0:1-2*INPUTS_SIZE] abs2_4;
    logic signed [0:1-INPUTS_SIZE] I_4;
    logic signed [0:1-INPUTS_SIZE] Q_4;
    logic signed [0:1-2*INPUTS_SIZE-SQRT_EXTRA_OUT_BITS-SQRT_EXTRA_IN_BITS] norm_I_4;
    logic signed [0:1-2*INPUTS_SIZE-SQRT_EXTRA_OUT_BITS-SQRT_EXTRA_IN_BITS] norm_Q_4;
    
    logic [0:1-INPUTS_SIZE] abs_5;
    logic [0:1-3*INPUTS_SIZE] abs3_5;
    logic signed [0:1-INPUTS_SIZE] I_5;
    logic signed [0:1-INPUTS_SIZE] Q_5;
    logic signed [0:1-INPUTS_SIZE] norm_I_5;
    logic signed [0:1-INPUTS_SIZE] norm_Q_5;    
    
    // has a delay of INPUTS_SIZE/2 + INPUTS_SIZE%2 + 1 rising edges
    approx_inv_sqrt #(.INPUTS_SIZE(INPUTS_SIZE+SQRT_EXTRA_IN_BITS),
                        .EXTRA_OUT_BITS(SQRT_EXTRA_OUT_BITS))
                sqrt    (.abs2(abs2_sqrt_in[-INPUTS_SIZE+SQRT_EXTRA_IN_BITS -:INPUTS_SIZE+SQRT_EXTRA_IN_BITS]),
                        .clk(clk),
                        .abs(inv_abs_tmp));
                        
    always_comb begin
        new_shift = 0;
        for (int i=2; i<INPUTS_SIZE-SQRT_EXTRA_IN_BITS; i=i+1) begin
            if (abs2_2[0][i+SQRT_EXTRA_IN_BITS-1-INPUTS_SIZE] == 1'b1) begin
                new_shift = i;
            end
        end
        new_shift = (new_shift >> 1);
        abs2_tmp = (I*I) + (Q*Q);
    end
                        
    always_ff @(posedge clk) begin: abs2_stage // abs2 value of I and Q,
        abs2_2 <= {abs2_2[DELAY_STORAGE_SIZE-2:0], abs2_tmp[-2:1-2*INPUTS_SIZE]};
        I_2 <= {I_2[DELAY_STORAGE_SIZE-2:0], I};
        Q_2 <= {Q_2[DELAY_STORAGE_SIZE-2:0], Q};
        shift <= {shift[DELAY_STORAGE_SIZE-2:0], new_shift};
        abs2_sqrt_in <= abs2_2[0] >> (2*new_shift); // fix extra delay here
    end
    
    
    always_ff @(posedge clk) begin: abs_stage
        abs_3 <= (abs2_2[DELAY_STORAGE_SIZE-1]*inv_abs_tmp);
        abs2_3 <= abs2_2[DELAY_STORAGE_SIZE-1];
        I_3 <= I_2[DELAY_STORAGE_SIZE-1];
        Q_3 <= Q_2[DELAY_STORAGE_SIZE-1];
        norm_I_3 <= I_2[DELAY_STORAGE_SIZE-1]* $signed({1'b0, inv_abs_tmp});
        norm_Q_3 <= Q_2[DELAY_STORAGE_SIZE-1]* $signed({1'b0, inv_abs_tmp});
    end
    
    always_ff @(posedge clk) begin: shift_stage
        abs_4 <= abs_3 >> shift[DELAY_STORAGE_SIZE-1];
        abs2_4 <= abs2_3;
        I_4 <= I_3;
        Q_4 <= Q_3;
        norm_I_4 <= (norm_I_3 << (INPUTS_SIZE - shift[DELAY_STORAGE_SIZE-1]));
        norm_Q_4 <= (norm_Q_3 << (INPUTS_SIZE - shift[DELAY_STORAGE_SIZE-1]));
    end
    
    always_ff @(posedge clk) begin: abs3_stage
        abs_5 <= abs_4[1-2-INPUTS_SIZE/2-INPUTS_SIZE%2 -:INPUTS_SIZE] + abs_4[1-2-INPUTS_SIZE/2-INPUTS_SIZE%2-INPUTS_SIZE];
        abs3_5 <= abs2_4 * abs_4[1-2-INPUTS_SIZE/2-INPUTS_SIZE%2 -:INPUTS_SIZE];
        I_5 <= I_4;
        Q_5 <= Q_4;
        
        if (norm_I_4[0] != I_4[0]) // detects overflow now or after addition
            norm_I_5 <= {I_4[0], {INPUTS_SIZE-1{norm_I_4[0]}}};
        else if (norm_I_4[0:-INPUTS_SIZE] == {1'b0, {INPUTS_SIZE{1'b1}}})
            norm_I_5 <= {1'b0, {INPUTS_SIZE-1{1'b1}}};
        else
            norm_I_5 <= norm_I_4[0:1-INPUTS_SIZE] + norm_I_4[-INPUTS_SIZE];
        if (norm_Q_4[0] != Q_4[0]) // detects overflow now or after addition
            norm_Q_5 <= {Q_4[0], {INPUTS_SIZE-1{norm_Q_4[0]}}};
        else if (norm_Q_4[0:-INPUTS_SIZE] == {1'b0, {INPUTS_SIZE{1'b1}}})
            norm_Q_5 <= {1'b0, {INPUTS_SIZE-1{1'b1}}};
        else
            norm_Q_5 <= norm_Q_4[0:1-INPUTS_SIZE] + norm_Q_4[-INPUTS_SIZE];
    end
    
    assign I_out = I_5;
    assign Q_out = Q_5;
    assign abs_out = abs_5;
    assign abs3_out = abs3_5[-2*INPUTS_SIZE - 2*LAYER_FIRST_ACT_QUANTIZER:1-3*INPUTS_SIZE - 2*LAYER_FIRST_ACT_QUANTIZER] +
        abs3_5[-3*INPUTS_SIZE - 2*LAYER_FIRST_ACT_QUANTIZER];
    
    assign norm_I_out = norm_I_5;
    assign norm_Q_out = norm_Q_5;
    
    
    

endmodule
