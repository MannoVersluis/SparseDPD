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
                    parameter MIN_BIT_INPUTS = -13, //lowest bit of the inputs
                    parameter TREE_TYPE = 1
                    )(
    input logic signed [MIN_BIT_INPUTS+INPUTS_SIZE-1:MIN_BIT_INPUTS] inputs [INPUTS_AMOUNT-1:0],
    input clk,
    output wire signed [MIN_BIT_INPUTS+INPUTS_SIZE-1:MIN_BIT_INPUTS] output_sum
    );
    
    generate
        if (TREE_TYPE == 0) begin
            adder_tree #(.INPUTS_SIZE(INPUTS_SIZE),.INPUTS_AMOUNT(INPUTS_AMOUNT),.MIN_BIT_INPUTS(MIN_BIT_INPUTS))
                tree_layer (.inputs(inputs),.output_sum(output_sum),.clk(clk));
        end else if (TREE_TYPE == 1) begin
            csa_adder_tree_recursive #(.INPUTS_SIZE(INPUTS_SIZE),.INPUTS_AMOUNT(INPUTS_AMOUNT),.MIN_BIT_INPUTS(MIN_BIT_INPUTS))
                csa_adder_tree (.inputs(inputs),.output_sum(output_sum),.clk(clk));
        end else begin
            $fatal("No valid tree type given");
        end
    endgenerate
        
endmodule

module adder_tree #(parameter INPUTS_SIZE = 14, // amount of bits of input values
                    parameter INPUTS_AMOUNT = 16, // number of input values
                    parameter MIN_BIT_INPUTS = -13 //lowest bit of the inputs
                    )(
    input logic signed [MIN_BIT_INPUTS+INPUTS_SIZE-1:MIN_BIT_INPUTS] inputs [INPUTS_AMOUNT-1:0],
    input clk,
    output wire [MIN_BIT_INPUTS+INPUTS_SIZE-1:MIN_BIT_INPUTS] output_sum
    );
    
    logic signed [MIN_BIT_INPUTS+INPUTS_SIZE-1:MIN_BIT_INPUTS] add_tmp [INPUTS_AMOUNT/2+INPUTS_AMOUNT%2-1:0];
    logic signed [MIN_BIT_INPUTS+INPUTS_SIZE-1:MIN_BIT_INPUTS] new_output_sum;
    
    integer i;
    genvar j;
    
    assign output_sum = new_output_sum;
    
    if (INPUTS_AMOUNT == 2)
        assign new_output_sum = add_tmp[0];
    else
        adder_tree #(.INPUTS_SIZE(INPUTS_SIZE),.INPUTS_AMOUNT(INPUTS_AMOUNT/2+INPUTS_AMOUNT%2),.MIN_BIT_INPUTS(MIN_BIT_INPUTS))
            tree_layer (.inputs(add_tmp),.output_sum(new_output_sum),.clk(clk));
    
    always @*
    begin
        for (i=0; i < INPUTS_AMOUNT/2; i=i+1)
            add_tmp[i] = inputs[2*i] + inputs[2*i+1];
        if (INPUTS_AMOUNT%2 == 1)
            add_tmp[INPUTS_AMOUNT/2] = inputs[INPUTS_AMOUNT-1];
    end

endmodule

//module csa_adder_tree #(parameter INPUTS_SIZE = 14, // amount of bits of input values
//                        parameter INPUTS_AMOUNT = 16, // number of input values
//                        parameter MIN_BIT_INPUTS = -13 //lowest bit of the inputs
//                    )(
//    input logic signed [MIN_BIT_INPUTS+INPUTS_SIZE-1:MIN_BIT_INPUTS] inputs [INPUTS_AMOUNT-1:0],
//    input clk,
//    output wire [MIN_BIT_INPUTS+INPUTS_SIZE-1:MIN_BIT_INPUTS] output_sum
//    );
    
//    csa_adder_tree_recursive #(.INPUTS_SIZE(INPUTS_SIZE),.INPUTS_AMOUNT(INPUTS_AMOUNT),.MIN_BIT_INPUTS(MIN_BIT_INPUTS))
//        recursive_csa_adder_tree (.inputs(inputs),.output_sum(output_sum),.clk(clk));
    
//endmodule

module csa_adder_tree_recursive #(parameter INPUTS_SIZE = 18, // amount of bits of input values
                                parameter INPUTS_AMOUNT = 16, // number of input values
                                parameter MIN_BIT_INPUTS = -13 //lowest bit of the inputs
                                )(
    input logic signed [MIN_BIT_INPUTS+INPUTS_SIZE-1:MIN_BIT_INPUTS] inputs [INPUTS_AMOUNT-1:0],
    input clk,
    output wire [MIN_BIT_INPUTS+INPUTS_SIZE-1:MIN_BIT_INPUTS] output_sum
    );
    
    genvar k, j;
    
    if (INPUTS_AMOUNT == 2) begin
        logic signed [MIN_BIT_INPUTS+INPUTS_SIZE-1:MIN_BIT_INPUTS] new_inputs [INPUTS_AMOUNT-1:0];
        always_ff @(posedge clk) begin
            new_inputs <= inputs;
        end
        assign output_sum = new_inputs[0] + new_inputs[1]; // if there are only 2 numbers left, add them together, add single bits as well
    end else begin
        logic signed [MIN_BIT_INPUTS+INPUTS_SIZE-1:MIN_BIT_INPUTS] add_tmp [((INPUTS_AMOUNT/3)*2)+INPUTS_AMOUNT%3-1:0]; // stores the outputs of the layer of the CSA tree

        csa_adder_tree_recursive #(.INPUTS_SIZE(INPUTS_SIZE),.INPUTS_AMOUNT(((INPUTS_AMOUNT/3)*2)+INPUTS_AMOUNT%3),.MIN_BIT_INPUTS(MIN_BIT_INPUTS))
            recursive_csa_adder_tree (.inputs(add_tmp),.output_sum(output_sum),.clk(clk));
        for (j=0; j<INPUTS_AMOUNT/3; j=j+1) begin // for every bit location, uses a 3 input CSA on the bits 3 at a time
            csa_inputs #(.INPUTS_SIZE(INPUTS_SIZE),.MIN_BIT_INPUTS(MIN_BIT_INPUTS))
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

module csa_inputs #(parameter INPUTS_SIZE = 18, // amount of bits of input values
                    parameter MIN_BIT_INPUTS = -13 //lowest bit of the inputs
                    )(
    input logic signed [MIN_BIT_INPUTS+INPUTS_SIZE-1:MIN_BIT_INPUTS] inputs [2:0],
    output wire [MIN_BIT_INPUTS+INPUTS_SIZE-1:MIN_BIT_INPUTS] output_low,
    output wire [MIN_BIT_INPUTS+INPUTS_SIZE-1:MIN_BIT_INPUTS] output_high
    );

    logic [MIN_BIT_INPUTS+INPUTS_SIZE-1:MIN_BIT_INPUTS+1] new_output_high;
    
    assign output_high[MIN_BIT_INPUTS+INPUTS_SIZE-1:MIN_BIT_INPUTS+1] = new_output_high;
    assign output_high[MIN_BIT_INPUTS] = 1'b0;
    
    genvar i;

    for (i=MIN_BIT_INPUTS;i<MIN_BIT_INPUTS+INPUTS_SIZE;i=i+1) begin
        if (i==MIN_BIT_INPUTS+INPUTS_SIZE-1) begin
            assign output_low[i] = inputs[0][i] ^ inputs[1][i] ^ inputs[2][i];            
        end else begin
            assign new_output_high[i+1] = (inputs[0][i] && inputs[1][i]) || (inputs[2][i] && inputs[0][i]) || (inputs[2][i] && inputs[1][i]);
            assign output_low[i] = (inputs[0][i] && inputs[1][i] && inputs[2][i]) || ((inputs[0][i] || inputs[1][i] || inputs[2][i]) && !new_output_high[i+1]);
        end
    end

endmodule





