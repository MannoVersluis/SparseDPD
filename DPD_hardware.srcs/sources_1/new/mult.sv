`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/13/2025 11:32:16 AM
// Design Name: 
// Module Name: mult
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

// can do 1+ multiplications in parallel without DSP units and add them up using a CSA adder tree
module csa_mult #(parameter INPUTS_AMOUNT = 16,
                    parameter INPUTS_SIZE = 12, //bits of input values
                    parameter WEIGHTS_SIZE = 12, //bits of weight values
                    parameter MIN_BIT_INPUTS = -11,
                    parameter MIN_BIT_WEIGHTS = -11,
                    parameter signed [WEIGHTS_SIZE-1:0] weights [0:INPUTS_AMOUNT-1],
                    parameter LAST = 0 // set to 1 if no truncation or clamping, 0 otherwise
                    )(
    input logic signed [INPUTS_SIZE-1:0] inputs [0:INPUTS_AMOUNT-1],
    input logic signed [1:1-INPUTS_SIZE-WEIGHTS_SIZE] bias,
    input logic clk,
    output logic signed [LAST:1-INPUTS_SIZE-WEIGHTS_SIZE] outputs
    );
    
    logic signed [1:1-INPUTS_SIZE-WEIGHTS_SIZE] tree_in [0:INPUTS_AMOUNT*WEIGHTS_SIZE];
    
//    typedef int shift_arr [0:1][0:INPUTS_AMOUNT*WEIGHTS_SIZE-1]; // needed to assign int array to localparam
//    localparam shift_arr tree_shift = SHIFT_CALC(); 
//    function shift_arr SHIFT_CALC();
//        for(int x=0; x<INPUTS_AMOUNT*WEIGHTS_SIZE; x=x+1) begin
//            SHIFT_CALC[0][x] = x/INPUTS_AMOUNT;
//            SHIFT_CALC[1][x] = x/INPUTS_AMOUNT;
//        end
//    endfunction
    localparam logic [1:1-INPUTS_SIZE-WEIGHTS_SIZE] wool_add = (1'b1 << (INPUTS_SIZE-1)) + (1'b1 << (WEIGHTS_SIZE-1));
    assign tree_in[INPUTS_AMOUNT*WEIGHTS_SIZE] = bias;
    
    always_comb begin // baugh wooley
        for (int x=0; x<INPUTS_AMOUNT; x=x+1) begin
            for (int y=0; y<WEIGHTS_SIZE; y=y+1) begin
                if (y == WEIGHTS_SIZE-1) begin
                    if (weights[x][y] == 1'b1)
                        tree_in[INPUTS_AMOUNT*y+x] = {inputs[x][INPUTS_SIZE-1], ~inputs[x][INPUTS_SIZE-2:0]} << y;
                    else
                        tree_in[INPUTS_AMOUNT*y+x] = {INPUTS_SIZE-1{1'b1}} << y;
                end
                else if (y==0 && INPUTS_SIZE != WEIGHTS_SIZE) begin
                    if (weights[x][y] == 1'b1)
                        tree_in[INPUTS_AMOUNT*y+x] = ({!inputs[x][INPUTS_SIZE-1], inputs[x][INPUTS_SIZE-2:0]} + wool_add) << y;
                    else
                        tree_in[INPUTS_AMOUNT*y+x] = (1'b1 << (y + INPUTS_SIZE-1)) + (wool_add << y);                    
                end
                else begin
                    if (weights[x][y] == 1'b1)
                        tree_in[INPUTS_AMOUNT*y+x] = {!inputs[x][INPUTS_SIZE-1], inputs[x][INPUTS_SIZE-2:0]} << y;
                    else
                        tree_in[INPUTS_AMOUNT*y+x] = 1'b1 << (y + INPUTS_SIZE-1);
                end
            end
            if (INPUTS_SIZE == WEIGHTS_SIZE)
                tree_in[x][1-WEIGHTS_SIZE] = 1'b1;
            tree_in[x][1:0] = {2{1'b1}};
        end
    end
    
    
    adder_trees #(.INPUTS_SIZE(INPUTS_SIZE+WEIGHTS_SIZE+1),
                    .INPUTS_AMOUNT(INPUTS_AMOUNT*WEIGHTS_SIZE+1),
                    .TREE_TYPE(1))
        tree_layer (.inputs(tree_in),
                    .output_sum(outputs),
                    .clk(clk));
    
endmodule

//module csa_shift_adder_tree_recursive #(parameter INPUTS_SIZE = 12,
////                                        parameter SAME_SHIFT = 16,
//                                        parameter INPUTS_AMOUNT = 192,
//                                        parameter TREE_SHIFT
//                                        )(
//    input logic signed [0:1-2*INPUTS_SIZE] inputs [0:INPUTS_AMOUNT-1],
//    input logic clk,
//    output logic signed [0:1-2*INPUTS_SIZE] outputs
//    );
    
//    logic signed [0:1-INPUTS_SIZE] add_tmp [0:INPUTS_AMOUNT-INPUTS_AMOUNT/3-1];
//    logic signed [0:1-INPUTS_SIZE] add_tmp2 [0:INPUTS_AMOUNT-INPUTS_AMOUNT/3-1];
    
//    typedef int shift_arr [0:1][0:INPUTS_AMOUNT-INPUTS_AMOUNT/3-1]; // needed to assign int array to localparam
//    typedef int csa_arr [0:1][0:2]; // needed to assign int array to localparam
//    typedef int min_max_val [0:1]; // needed to assign int array to localparam
//    localparam shift_arr tree_shift_tmp = SHIFT_CALC(); 
//    function shift_arr SHIFT_CALC();
//        for (int x=0; x<INPUTS_AMOUNT/3; x=x+1) begin
//            automatic min_max_val MIN_MAX_BIT = MIN_MAX_CALC(TREE_SHIFT[3*x+:2]);
//            // insert min max bits
//        end
//    endfunction
    
//    function min_max_val MIN_MAX_CALC(csa_arr inputs);
//        automatic int MIN_BIT = inputs[0][0];
//        automatic int MAX_BIT = inputs[1][0];
//        for (int x=1; x<2; x=x+1) begin
//            if (inputs[0][x] < MIN_BIT)
//                MIN_BIT = inputs[0][x];
//            if (inputs[1][x] > MAX_BIT)
//                MAX_BIT = inputs[1][x];
//        end
//        MIN_MAX_CALC[0] = MIN_BIT;
//        MIN_MAX_CALC[1] = MAX_BIT;
//    endfunction
    
//    for (genvar x=0; x<INPUTS_AMOUNT/3; x=x+1) begin
//        localparam min_max_val MIN_MAX_BIT = MIN_MAX_CALC(TREE_SHIFT[3*x+:2]);
//        logic signed [MIN_MAX_BIT[0]:MIN_MAX_BIT[1]] new_inputs [2:0];
//        for (genvar y=0; y<2; y=y+1) begin
//            assign new_inputs[y] = {{TREE_SHIFT[1][3*x+y]-MIN_MAX_BIT[1]{inputs[y][0]}}, inputs[y], {TREE_SHIFT[0][3*x+y]-MIN_MAX_BIT[0]{1'b0}}};
//        end
//        csa_inputs #(.INPUTS_SIZE(INPUTS_SIZE))
//            csa (.inputs(inputs[x:x+2]),
//                    .output_low(add_tmp[2*x]),
//                    .output_high(add_tmp[2*x+1]));
//    end
//endmodule

// ensure all inputs cover the same bit range using sign extension and zero padding lsb's
//module csa_format #(parameter INPUTS_SISE = 12,
//                    parameter TREE_SHIFT // only the 3 relevant tree_shift min/max values (min is lsb index, max is msb index)
//                    )(
//    input logic signed [0:1-2*INPUTS_SIZE] inputs [2:0],
//    output logic signed [0:1-2*INPUTS_SIZE] output_low,
//    output logic signed [0:1-2*INPUTS_SIZE] output_high
//    );
    
//    localparam MIN_BIT = TREE_SHIFT[0].min();
//    localparam MAX_BIT = TREE_SHIFT[1].max();
    
//    logic signed [MAX_BIT:MIN_BIT] new_inputs [2:0];
    
//    for (genvar x=0; x<2; x=x+1) begin
//        assign new_inputs[x] = {{TREE_SHIFT[1][x]-MAX_BIT{inputs[x][0]}}, inputs[x], {TREE_SHIFT[0][x]-MIN_BIT{1'b0}}};
//    end
//endmodule