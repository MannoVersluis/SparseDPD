`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/13/2025 09:20:29 AM
// Design Name: 
// Module Name: sqrt
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

// has a delay of INPUTS_SIZE/2 + 1 rising edges
module nonrestoring_sqrt #(parameter INPUTS_SIZE
    )(
    input logic signed [0:1-INPUTS_SIZE] abs2, // truncate the lsb half
    input clk,
    output logic signed [0:1-INPUTS_SIZE] abs
    );
    
    logic [0:1-INPUTS_SIZE] new_abs2;
    
    always_ff @(posedge clk) begin
        new_abs2 <= abs2 - (1 << (INPUTS_SIZE - 2));
    end
    
    nonrestoring_sqrt_recursive #(.INPUTS_SIZE(INPUTS_SIZE),
                                    .ITERATION(1))
                        first   (.abs2({new_abs2[0], new_abs2}),
                                    .root_digits(1'b1),
                                    .clk(clk),
                                    .abs(abs));
    
endmodule

module nonrestoring_sqrt_recursive #(parameter INPUTS_SIZE,
                                        parameter ITERATION
    )(
    input logic signed [1:1-INPUTS_SIZE] abs2,  // truncate the lsb half, added msb to keep track of sign (msb starts as 0)
    input logic [0:1-ITERATION] root_digits,
    input clk,
    output logic signed [0:1-INPUTS_SIZE] abs
    );
    
    logic [0:-ITERATION] new_root_digits;
    logic [1:1-INPUTS_SIZE] new_abs2;
    
    
    
    always_ff @(posedge clk) begin        
        if (ITERATION == 1) begin
            new_abs2 <= {abs2[0:1-INPUTS_SIZE], 1'b0} + ({!abs2[1], 3'b011} << (INPUTS_SIZE - 2 - ITERATION));
            new_root_digits <= {!abs2[1], 1'b1};
        end
        else begin
            new_abs2 <= (abs2 << 1) + ({{ITERATION{!abs2[1]}}^root_digits[0:2-ITERATION], 3'b011} << (INPUTS_SIZE - 2 - ITERATION));
            new_root_digits <= {root_digits[0:2-ITERATION], !abs2[1], 1'b1};
        end
    end
    
    if (ITERATION != INPUTS_SIZE/2) begin
        nonrestoring_sqrt_recursive #(.INPUTS_SIZE(INPUTS_SIZE),
                                        .ITERATION(ITERATION+1))
                            sqrt   (.abs2(new_abs2), // shift left by 1, lsb=0
                                        .root_digits(new_root_digits),
                                        .clk(clk),
                                        .abs(abs));
    end
    else begin
        assign abs = {1'b0, new_root_digits[0:1-ITERATION]} + !new_abs2[1];
    end    
endmodule


// not accurate enough
//module CORDIC_sqrt#(parameter INPUTS_SIZE
//    )(
//    input logic signed [0:1-INPUTS_SIZE] I,
//    input logic signed[0:1-INPUTS_SIZE] Q,
//    input clk,
//    output logic signed [0:1-INPUTS_SIZE] abs
//    );
    
//    localparam [0:-31] K_INV = 607252935;
//    localparam [0:1-INPUTS_SIZE] K_INV_SHORT = K_INV[0:-INPUTS_SIZE];
    
    
//    logic [0:-INPUTS_SIZE] abs_out;
//    logic [0:-INPUTS_SIZE] new_abs_out;
//    logic [0:-1-2*INPUTS_SIZE] abs_tmp;
    
//    CORDIC_sqrt_recursive #(.INPUTS_SIZE(INPUTS_SIZE+1),
//                            .ITERATION(0),
//                            .MAX_ITERATION((INPUTS_SIZE+1)/2+1)) // For absolute values, CORDIC x output seems to converge in ceil(bits/2)+2 iterations.
//                    recurse (.I({I[0], I}),
//                            .Q({Q[0], Q}),
//                            .clk(clk),
//                            .abs(abs_out));
    
//    always_ff @(posedge clk) begin
//        new_abs_out <= abs_out;
//        abs_tmp <= new_abs_out * K_INV_SHORT;
//    end
    
//    assign abs = abs_tmp[-3:-2-INPUTS_SIZE];
    
    
    
//endmodule

//module CORDIC_sqrt_recursive#(parameter INPUTS_SIZE,
//                                parameter ITERATION,
//                                parameter MAX_ITERATION
//    )(
//    input logic signed [0:1-INPUTS_SIZE] I,
//    input logic signed[0:1-INPUTS_SIZE] Q,
//    input clk,
//    output logic signed [0:1-INPUTS_SIZE] abs
//    );
    
//    logic signed [0:1-INPUTS_SIZE] new_I;
//    logic signed [0:1-INPUTS_SIZE] new_Q;
//    logic signed [0:1-INPUTS_SIZE] shift_I;
//    logic signed [0:1-INPUTS_SIZE] shift_Q;
//    logic sign;
    
//    assign sign = I[0]^Q[0];
   
//    if (ITERATION != MAX_ITERATION) begin
//        always_ff @(posedge clk) begin
//            if (ITERATION == 0) begin
//                shift_I <= ((Q ^ {INPUTS_SIZE{sign}}) + sign);
//                shift_Q <= ((I ^ {INPUTS_SIZE{sign}}) + sign);
//                new_I <= I + ((Q ^ {INPUTS_SIZE{sign}}) + sign);
//                new_Q <= Q - ((I ^ {INPUTS_SIZE{sign}}) + sign);
//            end
//            else begin
//                shift_I <= ((({{ITERATION{Q[0]}}, Q[0:1-INPUTS_SIZE+ITERATION]}) ^ {INPUTS_SIZE{sign}}) + sign);
//                shift_Q <= ((({{ITERATION{I[0]}}, I[0:1-INPUTS_SIZE+ITERATION]}) ^ {INPUTS_SIZE{sign}}) + sign);
//                new_I <= I + ((({{ITERATION{Q[0]}}, Q[0:1-INPUTS_SIZE+ITERATION]}) ^ {INPUTS_SIZE{sign}}) + sign);
//                new_Q <= Q - ((({{ITERATION{I[0]}}, I[0:1-INPUTS_SIZE+ITERATION]}) ^ {INPUTS_SIZE{sign}}) + sign);
//            end
//        end
//    end
    
//    if (ITERATION != MAX_ITERATION) begin
//        CORDIC_sqrt_recursive #(.INPUTS_SIZE(INPUTS_SIZE),
//                                .ITERATION(ITERATION + 1),
//                                .MAX_ITERATION(MAX_ITERATION)) // For absolute values, CORDIC x output seems to converge in ceil(bits/2)+2 iterations.
//                        recurse (.I(new_I),
//                                .Q(new_Q),
//                                .clk(clk),
//                                .abs(abs));
//    end
//    else begin
//        assign abs = I - ({{ITERATION{Q[0]}}, Q[0:1-INPUTS_SIZE+ITERATION]} ^ sign) + sign;
//    end
    
//endmodule
