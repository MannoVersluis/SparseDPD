`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2024 09:45:59 AM
// Design Name: 
// Module Name: adder_trees
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

// the CSA adder tree is faster than the other adder tree
module adder_trees #(parameter INPUTS_SIZE = 14, // amount of bits of input values
                    parameter INPUTS_AMOUNT = 16, // number of input values
                    parameter TREE_TYPE = 1
                    )(
    input logic signed [0:1-INPUTS_SIZE] inputs [INPUTS_AMOUNT-1:0],
    input clk,
    output wire signed [0:1-INPUTS_SIZE] output_sum
    );
    
    generate
        if (TREE_TYPE == 1) begin
            csa_adder_tree_recursive #(.INPUTS_SIZE(INPUTS_SIZE),
                                        .INPUTS_AMOUNT(INPUTS_AMOUNT))
                csa_adder_tree (.inputs(inputs),
                                .output_sum(output_sum),
                                .clk(clk));
        end else begin
            $fatal("No valid tree type given");
        end
    endgenerate
        
endmodule

module csa_adder_tree_recursive #(parameter INPUTS_SIZE = 24, // amount of bits of input values
                                parameter INPUTS_AMOUNT = 16 // number of input values
                                )(
    input logic signed [0:1-INPUTS_SIZE] inputs [INPUTS_AMOUNT-1:0],
    input clk,
    output wire [0:1-INPUTS_SIZE] output_sum
    );
    
    genvar k, j;
    
    if (INPUTS_AMOUNT <= 2) begin
        logic signed [0:1-INPUTS_SIZE] new_inputs [INPUTS_AMOUNT-1:0];
        always_ff @(posedge clk) begin
            new_inputs <= inputs;
        end
        if (INPUTS_AMOUNT == 2)
            assign output_sum = new_inputs[0] + new_inputs[1]; // if there are only 2 numbers left, add them together, add single bits as well
        else
            assign output_sum = new_inputs[0];
    end else begin
        logic signed [0:1-INPUTS_SIZE] add_tmp [((INPUTS_AMOUNT/3)*2)+INPUTS_AMOUNT%3-1:0]; // stores the outputs of the layer of the CSA tree

        csa_adder_tree_recursive #(.INPUTS_SIZE(INPUTS_SIZE),
                                    .INPUTS_AMOUNT(((INPUTS_AMOUNT/3)*2)+INPUTS_AMOUNT%3))
            recursive_csa_adder_tree (.inputs(add_tmp),
                                        .output_sum(output_sum),
                                        .clk(clk));
                                        
        for (j=0; j<INPUTS_AMOUNT/3; j=j+1) begin // for every bit location, uses a 3 input CSA on the bits 3 at a time
            csa_inputs #(.INPUTS_SIZE(INPUTS_SIZE))
                csa (.inputs(inputs[3*j+2:3*j]),
                        .output_low(add_tmp[2*j]), // append the results in the first free row after the carry out of the previous column
                        .output_high(add_tmp[2*j+1])); // append the carry of the csa to the next column
        end
        if (INPUTS_AMOUNT%3 == 1) begin // if x%3==1 bit left in column
            assign add_tmp[((INPUTS_AMOUNT/3)*2)+INPUTS_AMOUNT%3-1] = inputs[INPUTS_AMOUNT-1];
        end else if (INPUTS_AMOUNT%3 == 2) begin // if x%3==2 bits left in column
            assign add_tmp[((INPUTS_AMOUNT/3)*2)+INPUTS_AMOUNT%3-1] = inputs[INPUTS_AMOUNT-1];
            assign add_tmp[((INPUTS_AMOUNT/3)*2)+INPUTS_AMOUNT%3-2] = inputs[INPUTS_AMOUNT-2];
        end
    end

endmodule

module csa_inputs #(parameter INPUTS_SIZE = 18 // amount of bits of input values
                    )(
    input logic signed [0:1-INPUTS_SIZE] inputs [2:0],
    output wire [0:1-INPUTS_SIZE] output_low,
    output wire [0:1-INPUTS_SIZE] output_high
    );

    logic [0:2-INPUTS_SIZE] new_output_high;
    
    assign output_high[0:2-INPUTS_SIZE] = new_output_high;
    assign output_high[1-INPUTS_SIZE] = 1'b0;
    
    genvar i;
    for (i=1-INPUTS_SIZE;i<1;i=i+1) begin
        if (i==0) begin
            assign output_low[i] = inputs[0][i] ^ inputs[1][i] ^ inputs[2][i];            
        end else begin
            assign new_output_high[i+1] = (inputs[0][i] && inputs[1][i]) || (inputs[2][i] && inputs[0][i]) || (inputs[2][i] && inputs[1][i]);
            assign output_low[i] = (inputs[0][i] && inputs[1][i] && inputs[2][i]) || ((inputs[0][i] || inputs[1][i] || inputs[2][i]) && !new_output_high[i+1]);
        end
    end

endmodule





