`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2025 04:42:39 PM
// Design Name: 
// Module Name: main_parallel
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


module main_parallel #(parameter PARALLEL_IMP = 3
)(
    // with multiple parallel inputs, the highest index is the newest value
    input logic signed [0:1-INPUTS_SIZE] I [PARALLEL_IMP-1:0],
    input logic signed [0:1-INPUTS_SIZE] Q [PARALLEL_IMP-1:0],
    input clk,
    output logic signed [1:1-2*INPUTS_SIZE] I_out [PARALLEL_IMP-1:0],
    output logic signed [1:1-2*INPUTS_SIZE] Q_out [PARALLEL_IMP-1:0]
    );
    
    localparam MIN_BIT_INPUTS = LAYER_FIRST_ACT_QUANTIZER;
    
    
    logic signed [0:1-INPUTS_SIZE] FEx_I [PARALLEL_IMP-1:0];
    logic signed [0:1-INPUTS_SIZE] FEx_Q [PARALLEL_IMP-1:0];
    logic signed [0:1-INPUTS_SIZE] FEx_abs_low [PARALLEL_IMP-1:0];
    logic signed [0:1-INPUTS_SIZE] FEx_abs_high [PARALLEL_IMP-1:0];
    logic signed [0:1-INPUTS_SIZE] norm_I [PARALLEL_IMP-1:0];
    logic signed [0:1-INPUTS_SIZE] norm_Q [PARALLEL_IMP-1:0];
    
    for (genvar i=0; i<PARALLEL_IMP; i=i+1) begin
        feature_extraction #(.INPUTS_SIZE(INPUTS_SIZE),
                                    .LAYER_FIRST_ACT_QUANTIZER(LAYER_FIRST_ACT_QUANTIZER),
                                    .FEATURE_EXTRACTION(FEATURE_EXTRACTION))
                feature_extraction (.I(I[i]),
                                    .Q(Q[i]),
                                    .I_out(FEx_I[i]),
                                    .Q_out(FEx_Q[i]),
                                    .abs_low_out(FEx_abs_low[i]),
                                    .abs_high_out(FEx_abs_high[i]),
                                    .clk(clk),
                                    .norm_I_out(norm_I[i]),
                                    .norm_Q_out(norm_Q[i]));
    end
            
    logic signed [INPUTS_SIZE-1:0] tmp_shift_reg_out [PARALLEL_IMP-1:0][0:PARALLEL_INPUTS-1][0:LAYER_SIZES[0]/PARALLEL_INPUTS-1];
    logic signed [INPUTS_SIZE-1:0] tmp_shift_reg_in [PARALLEL_IMP-1:0][0:LAYER_SIZES[0]/PARALLEL_INPUTS-1];
    logic signed [0:1-INPUTS_SIZE] delayed_norm_I [PARALLEL_IMP-1:0];
    logic signed [0:1-INPUTS_SIZE] delayed_norm_Q [PARALLEL_IMP-1:0];
    
    for (genvar i=0; i<PARALLEL_IMP; i=i+1) begin
        assign tmp_shift_reg_in[i] = {FEx_I[i], FEx_Q[i], FEx_abs_low[i], FEx_abs_high[i]};
    end
    
    always_ff @(posedge clk) begin
        for (int i=0; i<PARALLEL_IMP; i=i+1) begin
            delayed_norm_I[i] <= norm_I[i];
            delayed_norm_Q[i] <= norm_Q[i];
        end
    end
    
    shift_reg_mimo #(.INPUT_SIZE(INPUTS_SIZE),
                        .INPUT_AMOUNT(LAYER_SIZES[0]/PARALLEL_INPUTS),
                        .SHIFT_LENGTH(PARALLEL_INPUTS),
                        .PARALLEL_IMP(PARALLEL_IMP))
        shift_register (.clk(clk),
                        .in(tmp_shift_reg_in),
                        .out(tmp_shift_reg_out));
                        
    
    
       
    for (genvar i=0; i<PARALLEL_IMP; i=i+1) begin
        logic signed [INPUTS_SIZE-1:0] shift_reg_out [0:PARALLEL_INPUTS-1][0:LAYER_SIZES[0]/PARALLEL_INPUTS-1];
        assign shift_reg_out = tmp_shift_reg_out[i];
        
        logic signed [INPUTS_SIZE-1:0] backbone_in [0:LAYER_SIZES[0]-1];
    
        // phase normalization        
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
                    .norm_I_input(delayed_norm_I[i]),
                    .norm_Q_input(delayed_norm_Q[i]));
                    
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
        
        // phase recovery
        logic signed [1:1-2*INPUTS_SIZE] denorm_I_out [0:0];
        logic signed [1:1-2*INPUTS_SIZE] denorm_Q_out [0:0];
        logic signed [0:1-INPUTS_SIZE] delayed_norm_I_2[0:4*(BACKBONE_LAYERS+1)+1]; // update this is pipeline length changed
        logic signed [0:1-INPUTS_SIZE] delayed_norm_Q_2[0:4*(BACKBONE_LAYERS+1)+1]; // update this is pipeline length changed
        
        always @(posedge clk) begin
            delayed_norm_I_2 <= {delayed_norm_I[i], delayed_norm_I_2[0:4*(BACKBONE_LAYERS+1)]};
            delayed_norm_Q_2 <= {delayed_norm_Q[i], delayed_norm_Q_2[0:4*(BACKBONE_LAYERS+1)]};
        end
        
        phase_denormalization #(.WIDTH(1),
                                .INPUTS_SIZE(INPUTS_SIZE))
            denorm (.I_inputs(backbone_I_out),
                    .Q_inputs(backbone_Q_out),
                    .clk(clk),
                    .I_out(denorm_I_out),
                    .Q_out(denorm_Q_out),
                    .norm_I_input(delayed_norm_I_2[4*(BACKBONE_LAYERS+1)+1]),
                    .norm_Q_input(delayed_norm_Q_2[4*(BACKBONE_LAYERS+1)+1]));
        
        assign I_out[i] = denorm_I_out[0];
        assign Q_out[i] = denorm_Q_out[0];
    end
endmodule
