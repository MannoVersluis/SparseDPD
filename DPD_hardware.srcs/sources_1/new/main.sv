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

module main #(parameter ADDED_PRECISION = 0)(
    input logic signed [INPUTS_SIZE+LAYER_FIRST_ACT_QUANTIZER-1:LAYER_FIRST_ACT_QUANTIZER-ADDED_PRECISION] I,
    input logic signed [INPUTS_SIZE+LAYER_FIRST_ACT_QUANTIZER-1:LAYER_FIRST_ACT_QUANTIZER-ADDED_PRECISION] Q,
    input clk,
    output wire [INPUTS_SIZE+LAYER_LAST_ACT_QUANTIZER-1:LAYER_LAST_ACT_QUANTIZER-ADDED_PRECISION] I_out,
    output wire [INPUTS_SIZE+LAYER_LAST_ACT_QUANTIZER-1:LAYER_LAST_ACT_QUANTIZER-ADDED_PRECISION] Q_out
    );
    
    localparam MIN_BIT_INPUTS = LAYER_FIRST_ACT_QUANTIZER;
    
    logic signed [MIN_BIT_INPUTS+INPUTS_SIZE-1:MIN_BIT_INPUTS] FEx_I;
    logic signed [MIN_BIT_INPUTS+INPUTS_SIZE-1:MIN_BIT_INPUTS] FEx_Q;
    logic signed [MIN_BIT_INPUTS+INPUTS_SIZE-1:MIN_BIT_INPUTS] FEx_abs_low;
    logic signed [MIN_BIT_INPUTS+INPUTS_SIZE-1:MIN_BIT_INPUTS] FEx_abs_high;
    
    feature_extraction #(.INPUTS_SIZE(INPUTS_SIZE+ADDED_PRECISION),.ADDED_PRECISION(ADDED_PRECISION))
            feature_extraction (.I(I),.Q(Q),.I_out(FEx_I),.Q_out(FEx_Q),.abs_low_out(FEx_abs_low),.abs_high_out(FEx_abs_high),.clk(clk));
            
    logic signed [INPUTS_SIZE-1:0] shift_reg_out [0:LAYER_SIZES[LAYER_ORDER[0]]-1];
    
    shift_reg #(.INPUT_SIZE(INPUTS_SIZE),.INPUT_AMOUNT(LAYER_SIZES[LAYER_ORDER[0]]/PARALLEL_INPUTS),.SHIFT_LENGTH(PARALLEL_INPUTS))
        shift_register (.clk(clk),.in({FEx_I, FEx_Q, FEx_abs_low, FEx_abs_high}),.out(shift_reg_out));
            
    logic signed [INPUTS_SIZE+MIN_BIT_INPUTS[LAYER_ORDER[0]]-1:MIN_BIT_INPUTS[LAYER_ORDER[0]]] backbone_inputs [0:LAYER_SIZES[LAYER_ORDER[0]]-1];
    logic signed [INPUTS_SIZE+MIN_BIT_INPUTS-2:MIN_BIT_INPUTS-1] backbone_I_out;
    logic signed [INPUTS_SIZE+MIN_BIT_INPUTS-2:MIN_BIT_INPUTS-1] backbone_Q_out;
    
    assign backbone_inputs = shift_reg_out;
    
    backbones #(.MIN_BIT_INPUTS(MIN_BIT_INPUTS))
        backbones (.inputs(backbone_inputs),.I_out(backbone_I_out),.Q_out(backbone_Q_out));
        
    assign I_out = backbone_I_out;
    assign Q_out = backbone_Q_out;
   
endmodule
