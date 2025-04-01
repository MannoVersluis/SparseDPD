`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2024 05:03:27 PM
// Design Name: 
// Module Name: shift_reg
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


module shift_reg #(parameter INPUT_SIZE = 12,
                    parameter INPUT_AMOUNT = 4,
                    parameter SHIFT_LENGTH = 8
                    )(
    input logic signed [INPUT_SIZE-1:0] in [INPUT_AMOUNT-1:0],
    input logic clk,
    output logic signed [INPUT_SIZE-1:0] out [SHIFT_LENGTH-1:0][INPUT_AMOUNT-1:0]
    );
    
    logic signed [INPUT_SIZE-1:0] storage [SHIFT_LENGTH-1:0][INPUT_AMOUNT-1:0];
    
    always_ff @(posedge clk) begin: shift_reg
        storage[SHIFT_LENGTH-2:0] <= storage[SHIFT_LENGTH-1:1];
        storage[SHIFT_LENGTH-1] <= in;
    end
    
    assign out = storage;
    
endmodule

module shift_reg_mimo #(parameter INPUT_SIZE = 12,
                    parameter INPUT_AMOUNT = 4,
                    parameter SHIFT_LENGTH = 8,
                    parameter PARALLEL_IMP = 3
                    )(
    input logic signed [INPUT_SIZE-1:0] in [PARALLEL_IMP-1:0][INPUT_AMOUNT-1:0],
    input logic clk,
    output logic signed [INPUT_SIZE-1:0] out [PARALLEL_IMP-1:0][SHIFT_LENGTH-1:0][INPUT_AMOUNT-1:0]
    );
    
    logic signed [INPUT_SIZE-1:0] storage [SHIFT_LENGTH-1+PARALLEL_IMP-1:0][INPUT_AMOUNT-1:0];
    
    always_ff @(posedge clk) begin: shift_reg
        storage[SHIFT_LENGTH-2:0] <= storage[SHIFT_LENGTH-1+PARALLEL_IMP-1:PARALLEL_IMP];
        storage[SHIFT_LENGTH-1+PARALLEL_IMP-1 -: PARALLEL_IMP] <= in[PARALLEL_IMP-1:0];
    end
    
    for (genvar i=0; i<PARALLEL_IMP; i=i+1)
        assign out[i] = storage[i +: SHIFT_LENGTH];
    
endmodule
