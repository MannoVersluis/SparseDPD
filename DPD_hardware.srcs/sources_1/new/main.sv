`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2024 07:10:33 PM
// Design Name: 
// Module Name: main
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

module main (
    input logic signed [0:1-INPUTS_SIZE] I,
    input logic signed [0:1-INPUTS_SIZE] Q,
    input clk,
    output logic signed [0:1-2*INPUTS_SIZE] I_out,
    output logic signed [0:1-2*INPUTS_SIZE] Q_out
    );
        
    localparam MIN_BIT_INPUTS = LAYER_FIRST_ACT_QUANTIZER;
    
    
    logic signed [0:1-INPUTS_SIZE] FEx_I;
    logic signed [0:1-INPUTS_SIZE] FEx_Q;
    logic signed [0:1-INPUTS_SIZE] FEx_abs_low;
    logic signed [0:1-INPUTS_SIZE] FEx_abs_high;
    logic signed [0:1-INPUTS_SIZE] norm_I;
    logic signed [0:1-INPUTS_SIZE] norm_Q;
    
    
    feature_extraction #(.INPUTS_SIZE(INPUTS_SIZE),
                                .LAYER_FIRST_ACT_QUANTIZER(LAYER_FIRST_ACT_QUANTIZER),
                                .FEATURE_EXTRACTION(FEATURE_EXTRACTION),
                                .PHASE_NORM(PHASE_NORMALIZATION))
            feature_extraction (.I(I),
                                .Q(Q),
                                .I_out(FEx_I),
                                .Q_out(FEx_Q),
                                .abs_low_out(FEx_abs_low),
                                .abs_high_out(FEx_abs_high),
                                .clk(clk),
                                .norm_I_out(norm_I),
                                .norm_Q_out(norm_Q));
            
    logic signed [INPUTS_SIZE-1:0] shift_reg_out [0:PARALLEL_INPUTS-1][0:LAYER_SIZES[0]/PARALLEL_INPUTS-1];
    
    shift_reg #(.INPUT_SIZE(INPUTS_SIZE),.INPUT_AMOUNT(LAYER_SIZES[0]/PARALLEL_INPUTS),.SHIFT_LENGTH(PARALLEL_INPUTS-1))
        shift_register (.clk(clk),.in({FEx_I, FEx_Q, FEx_abs_low, FEx_abs_high}),.out(shift_reg_out[1:PARALLEL_INPUTS-1]));
       
    assign shift_reg_out[0] = {FEx_I, FEx_Q, FEx_abs_low, FEx_abs_high};
    
    logic signed [INPUTS_SIZE-1:0] backbone_in [0:LAYER_SIZES[0]-1];
    
    if (PHASE_NORMALIZATION == 1) begin // if with phase normalization        
        logic signed [INPUTS_SIZE-1:0] shift_reg_I_out [0:PARALLEL_INPUTS-1];
        logic signed [INPUTS_SIZE-1:0] shift_reg_Q_out [0:PARALLEL_INPUTS-1];
        logic signed [INPUTS_SIZE-1:0] shift_reg_abs_low_out [0:PARALLEL_INPUTS-1];
        logic signed [INPUTS_SIZE-1:0] shift_reg_abs_high_out [0:PARALLEL_INPUTS-1];
        
        for (genvar x = 0; x<PARALLEL_INPUTS; x=x+1) begin
            assign shift_reg_I_out[x] = shift_reg_out[x][0];
            assign shift_reg_Q_out[x] = shift_reg_out[x][1];
        end
        
        always_ff @(posedge clk) begin // gives a 1 cycle delay for phase normalization
            for (int x = 0; x<PARALLEL_INPUTS; x=x+1) begin
                shift_reg_abs_low_out[x] <= shift_reg_out[x][2];
                shift_reg_abs_high_out[x] <= shift_reg_out[x][3];
            end
        end
                    
        logic signed [0:1-INPUTS_SIZE] norm_I_out [0:PARALLEL_INPUTS-1];
        logic signed [0:1-INPUTS_SIZE] norm_Q_out [0:PARALLEL_INPUTS-1];
        
        phase_normalization #(.WIDTH(PARALLEL_INPUTS-1),.INPUTS_SIZE(INPUTS_SIZE))
            norm (.I_inputs(shift_reg_I_out[1:PARALLEL_INPUTS-1]),
                    .Q_inputs(shift_reg_Q_out[1:PARALLEL_INPUTS-1]),
                    .clk(clk),
                    .I_out(norm_I_out[1:PARALLEL_INPUTS-1]),
                    .Q_out(norm_Q_out[1:PARALLEL_INPUTS-1]),
                    .norm_I_input(norm_I),
                    .norm_Q_input(norm_Q));
                    
        always_ff @(posedge clk) begin
            norm_I_out[0] <= shift_reg_abs_low_out[0]; // same value as abs_low
            norm_Q_out[0] <= 0;
            for (int x=0; x<PARALLEL_INPUTS; x=x+1) begin
                backbone_in[x+2*PARALLEL_INPUTS] <= shift_reg_abs_low_out[PARALLEL_INPUTS-1-x];
                backbone_in[x+3*PARALLEL_INPUTS] <= shift_reg_abs_high_out[PARALLEL_INPUTS-1-x];
            end
        end
        for (genvar x=0; x<PARALLEL_INPUTS; x=x+1) begin
            assign backbone_in[x] = norm_I_out[PARALLEL_INPUTS-1-x];
            assign backbone_in[x+PARALLEL_INPUTS] = norm_Q_out[PARALLEL_INPUTS-1-x];
        end 
    end
    else begin // if without phase normalization
        for (genvar x=0; x<LAYER_SIZES[0]; x=x+1) begin // #TODO optimize always 0 Q away
            assign backbone_in[x] = shift_reg_out[PARALLEL_INPUTS-1-x%PARALLEL_INPUTS][x/PARALLEL_INPUTS];
        end
    end
    
    logic signed [1:1-INPUTS_SIZE] backbone_I_out [0:0];
    logic signed [1:1-INPUTS_SIZE] backbone_Q_out [0:0];
    logic signed [1:1-INPUTS_SIZE] new_backbone_I_out;
    logic signed [1:1-INPUTS_SIZE] new_backbone_Q_out;
    
    backbones #(.MIN_BIT_INPUTS(MIN_BIT_INPUTS))
        backbones (.inputs(backbone_in),
                    .I_out(new_backbone_I_out),
                    .Q_out(new_backbone_Q_out),
                    .clk(clk));
        
    
    always_ff @(posedge clk) begin
        backbone_I_out[0] <= new_backbone_I_out;
        backbone_Q_out[0] <= new_backbone_Q_out;
    end
    
    if (PHASE_NORMALIZATION == 1) begin // phase recovery
        logic signed [1:1-2*INPUTS_SIZE] denorm_I_out [0:0];
        logic signed [1:1-2*INPUTS_SIZE] denorm_Q_out [0:0];
        logic signed [0:1-INPUTS_SIZE] delayed_norm_I[0:3*(BACKBONE_LAYERS+1)+4]; // update this is pipeline length changed
        logic signed [0:1-INPUTS_SIZE] delayed_norm_Q[0:3*(BACKBONE_LAYERS+1)+4]; // update this is pipeline length changed
        
        always @(posedge clk) begin
            delayed_norm_I <= {norm_I, delayed_norm_I[0:3*(BACKBONE_LAYERS+1)+3]};
            delayed_norm_Q <= {norm_Q, delayed_norm_Q[0:3*(BACKBONE_LAYERS+1)+3]};
        end
        
        phase_denormalization #(.WIDTH(1),
                                .INPUTS_SIZE(INPUTS_SIZE))
            denorm (.I_inputs(backbone_I_out),
                    .Q_inputs(backbone_Q_out),
                    .clk(clk),
                    .I_out(denorm_I_out),
                    .Q_out(denorm_Q_out),
                    .norm_I_input(delayed_norm_I[3*(BACKBONE_LAYERS+1)+4]),
                    .norm_Q_input(delayed_norm_Q[3*(BACKBONE_LAYERS+1)+4]));
        
        assign I_out = denorm_I_out[0];
        assign Q_out = denorm_Q_out[0];
    end
    else begin
        assign I_out = backbone_I_out[0];
        assign Q_out = backbone_Q_out[0]; 
    end
    
    
    
   
endmodule
