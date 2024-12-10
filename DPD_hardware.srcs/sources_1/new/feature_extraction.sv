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


module feature_extraction #(parameter INPUTS_SIZE,
                            parameter OUTPUTS_SIZE)(
    // all input values will be in range -1 to 1, 0 bit is sign bit, will update inputs every clk
    input logic [0:1-INPUTS_SIZE] I,
    input logic [0:1-INPUTS_SIZE] Q,
    input clk,
    output wire [0:1-OUTPUTS_SIZE] I_out,
    output wire [0:1-OUTPUTS_SIZE] Q_out,
    output wire [0:1-OUTPUTS_SIZE] abs2_out,
    output wire [0:1-OUTPUTS_SIZE] abs4_out
    );
    
    logic [-1:2-2*INPUTS_SIZE] abs2_2;
    logic [0:1-INPUTS_SIZE] I_2;
    logic [0:1-INPUTS_SIZE] Q_2;
    
    logic [-1:-OUTPUTS_SIZE] abs2_3;
    logic [-1:-OUTPUTS_SIZE] abs4_3;
    logic [0:1-OUTPUTS_SIZE] I_3;
    logic [0:1-OUTPUTS_SIZE] Q_3;
    
    assign I_out = I_3;
    assign Q_out = I_3;
    assign abs2_out = abs2_3;
    assign abs4_out = abs4_3;
    
    always_ff @(posedge clk) begin: abs2_stage // abs2 value of I and Q
        abs2_2[-1:2-2*INPUTS_SIZE] = (I[-1:1-INPUTS_SIZE]*I[-1:1-INPUTS_SIZE]) + (Q[-1:1-INPUTS_SIZE]*Q[-1:1-INPUTS_SIZE]);
        I_2 = I;
        Q_2 = Q;
    end
    always_ff @(posedge clk) begin: abs_stage // abs value of I and Q
        abs4_3 = abs2_2*abs2_2;
        abs2_3 = abs2_2[-1:-INPUTS_SIZE];
        I_3 = I_2;
        Q_3 = Q_2;
    end
endmodule
