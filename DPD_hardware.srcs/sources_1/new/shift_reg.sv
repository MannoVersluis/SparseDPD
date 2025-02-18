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
