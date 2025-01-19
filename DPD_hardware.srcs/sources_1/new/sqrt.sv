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

// has a delay of INPUTS_SIZE/2 + INPUTS_SIZE%2 + 1 rising edges
module nonrestoring_sqrt #(parameter INPUTS_SIZE = 12
    )(
    input logic signed [0:1-INPUTS_SIZE] abs2, // truncate the lsb half
    input clk,
    output logic signed [0:1-INPUTS_SIZE/2-INPUTS_SIZE%2] abs
    );
    localparam ITERATION = 1;
    
    logic [0:1-INPUTS_SIZE] new_abs2;
    
    always_ff @(posedge clk) begin
        new_abs2 <= abs2 - (1 << (INPUTS_SIZE + INPUTS_SIZE%2 - 2));
    end
    
    logic [0:1-ITERATION] new_root_digits;
    logic [1:1-INPUTS_SIZE] new_abs2_2;
    
    always_ff @(posedge clk) begin    
        new_abs2_2 <= {new_abs2, 1'b0} + ({!new_abs2[0], 3'b011} << (INPUTS_SIZE + INPUTS_SIZE%2 - 2 - ITERATION));
        new_root_digits <= !new_abs2[0];
    end
    
    nonrestoring_sqrt_recursive #(.INPUTS_SIZE(INPUTS_SIZE),
                                    .ITERATION(2))
                        first   (.abs2(new_abs2_2),
                                    .root_digits(new_root_digits),
                                    .clk(clk),
                                    .abs(abs));
    
endmodule

module nonrestoring_sqrt_recursive #(parameter INPUTS_SIZE = 12,
                                        parameter ITERATION = 2
    )(
    input logic signed [1:1-INPUTS_SIZE] abs2,  // truncate the lsb half, added msb to keep track of sign (msb starts as 0)
    input logic [0:2-ITERATION] root_digits,
    input clk,
    output logic signed [0:1-INPUTS_SIZE/2-INPUTS_SIZE%2] abs
    );
    
    logic [0:1-ITERATION] new_root_digits;
    logic [1:1-INPUTS_SIZE] new_abs2;
    
    
    
    always_ff @(posedge clk) begin
        if (ITERATION != INPUTS_SIZE/2+INPUTS_SIZE%2) begin
            new_abs2 <= (abs2 << 1) + ({{ITERATION{!abs2[1]}}^root_digits, 3'b011} << (INPUTS_SIZE + INPUTS_SIZE%2 - 2 - ITERATION));
            new_root_digits <= {root_digits, !abs2[1]};
        end
        else begin
            abs <= {root_digits[0:2-ITERATION], !abs2[1]} + 
                ($signed((abs2 << 1) + ({{ITERATION{!abs2[1]}}^root_digits, 3'b011} << (INPUTS_SIZE + INPUTS_SIZE%2 - 2 - ITERATION))) >= 0);
        end
    end
    
    if (ITERATION != INPUTS_SIZE/2+INPUTS_SIZE%2) begin
        nonrestoring_sqrt_recursive #(.INPUTS_SIZE(INPUTS_SIZE),
                                        .ITERATION(ITERATION+1))
                            sqrt   (.abs2(new_abs2), // shift left by 1, lsb=0
                                        .root_digits(new_root_digits),
                                        .clk(clk),
                                        .abs(abs));
    end
endmodule


// #TODO get this to work
module nonrestoring_inv_sqrt #(parameter INPUTS_SIZE = 12
    )(
    input logic signed [0:1-INPUTS_SIZE] abs2, // truncate the lsb half
    input clk,
    output logic signed [0:1-INPUTS_SIZE/2-INPUTS_SIZE%2] abs
    );
    localparam ITERATION = 1;
    
    logic [0:1-INPUTS_SIZE] new_abs2;
    
    always_ff @(posedge clk) begin
        new_abs2 <= abs2 - (1 << (INPUTS_SIZE + INPUTS_SIZE%2 - 2));
    end
    
    logic [0:1-ITERATION] new_root_digits;
    logic [1:1-INPUTS_SIZE] new_abs2_2;
    
    always_ff @(posedge clk) begin    
        new_abs2_2 <= {new_abs2, 1'b0} + ({!new_abs2[0], 3'b011} << (INPUTS_SIZE + INPUTS_SIZE%2 - 2 - ITERATION));
        new_root_digits <= !new_abs2[0];
    end
    
    nonrestoring_inv_sqrt_recursive #(.INPUTS_SIZE(INPUTS_SIZE),
                                        .ITERATION(2))
                            first   (.abs2(new_abs2_2),
                                    .root_digits(new_root_digits),
                                    .clk(clk),
                                    .abs(abs));
    
endmodule

module nonrestoring_inv_sqrt_recursive #(parameter INPUTS_SIZE = 12,
                                        parameter ITERATION = 2
    )(
    input logic signed [1:1-INPUTS_SIZE] abs2,  // truncate the lsb half, added msb to keep track of sign (msb starts as 0)
    input logic [0:2-ITERATION] root_digits,
    input clk,
    output logic signed [0:1-INPUTS_SIZE/2-INPUTS_SIZE%2] abs
    );
    
    logic [0:1-ITERATION] new_root_digits;
    logic [1:1-INPUTS_SIZE] new_abs2;
    
    
    
    always_ff @(posedge clk) begin
        if (ITERATION != INPUTS_SIZE/2+INPUTS_SIZE%2) begin
            new_abs2 <= (abs2 << 1) + ({{ITERATION{!abs2[1]}}^root_digits, 3'b011} << (INPUTS_SIZE + INPUTS_SIZE%2 - 2 - ITERATION));
            new_root_digits <= {root_digits, !abs2[1]};
        end
        else begin
            abs <= {root_digits[0:2-ITERATION], !abs2[1]} + 
                ($signed((abs2 << 1) + ({{ITERATION{!abs2[1]}}^root_digits, 3'b011} << (INPUTS_SIZE + INPUTS_SIZE%2 - 2 - ITERATION))) >= 0);
        end
    end
    
    if (ITERATION != INPUTS_SIZE/2+INPUTS_SIZE%2) begin
        nonrestoring_inv_sqrt_recursive #(.INPUTS_SIZE(INPUTS_SIZE),
                                            .ITERATION(ITERATION+1))
                                sqrt    (.abs2(new_abs2), // shift left by 1, lsb=0
                                        .root_digits(new_root_digits),
                                        .clk(clk),
                                        .abs(abs));
    end
endmodule

// #TODO get this to work
module approx_inv_sqrt #(parameter INPUTS_SIZE = 12
    )(
    input logic [0:1-INPUTS_SIZE] abs2, // truncate the lsb half
    input clk,
    output logic [0:1-INPUTS_SIZE] abs
    );
    
    localparam APPROX_BITS = 4;
    
    localparam logic [0:$rtoi($pow(2, $itor(INPUTS_SIZE)))-1][INPUTS_SIZE/2+APPROX_BITS-1:0] APPROX_LUT = APPROX_CALC();
    function logic [0:$rtoi($pow(2, $itor(INPUTS_SIZE)))-1][INPUTS_SIZE/2+APPROX_BITS-1:0] APPROX_CALC();
        for(int i=0;i<$rtoi($pow(2, $itor(INPUTS_SIZE))); i++) begin
            logic [APPROX_BITS-1:-1] tmp;
            tmp = $rtoi($pow(2, $itor(APPROX_BITS+$clog2(i+1)/2))/$sqrt($itor(i)));
            APPROX_CALC[i] = (tmp[APPROX_BITS-1:0] + tmp[-1]) << (INPUTS_SIZE/2-$clog2(i+1)/2);
        end
    endfunction
    
    localparam int MAX_BITS = 12;
    
    logic [INPUTS_SIZE/2+APPROX_BITS-1:0] approx_1;
    logic [0:1-INPUTS_SIZE] abs2_1;
    
    logic [INPUTS_SIZE-INPUTS_SIZE%2+APPROX_BITS-1:0] valapp_2;
    logic [INPUTS_SIZE/2+APPROX_BITS-1:0] approx_2;
    logic [0:1-INPUTS_SIZE] abs2_2;
    
    logic [2*APPROX_BITS+INPUTS_SIZE-INPUTS_SIZE%2-1:0] valapp_3;
    logic [INPUTS_SIZE/2+APPROX_BITS-1:0] approx_3;
    logic [0:1-INPUTS_SIZE] abs2_3;
    
    logic [MAX_BITS+INPUTS_SIZE/2+APPROX_BITS-1-1:0] valapp_4;
    logic [0:1-INPUTS_SIZE] abs2_4;
    
    logic [MAX_BITS-1:0] approx_5;
    logic [MAX_BITS+(INPUTS_SIZE-1)/2-1:0] valapp_5;
    
    logic [MAX_BITS-1:0] approx_6;
    logic [2*MAX_BITS-(INPUTS_SIZE-1)/2-1:0] valapp_6;
    
    logic [2*MAX_BITS-2:0] valapp_7;
    
   
    always_ff @(posedge clk) begin
        abs2_1 <= abs2;
        approx_1 <= APPROX_LUT[abs2];
        
        // bit shift by APPROX_BITS + INPUTS_SIZE/2 - 1, max_val = (INPUTS_SIZE+1)/2
        valapp_2 <= abs2_1*approx_1;
        abs2_2 <= abs2_1; 
        approx_2 <= approx_1;
        
        // the . is at the 2*APPROX_BITS + INPUTS_SIZE - INPUTS_SIZE%2 - 2 position
        valapp_3 <= (2'b11 << (2*APPROX_BITS + INPUTS_SIZE - INPUTS_SIZE%2 - 2)) - (valapp_2 * approx_2);
        abs2_3 <= abs2_2; 
        approx_3 <= approx_2;
        
        // INPUTS_SIZE/2+APPROX_BITS-1 + MAX_BITS - 1
        valapp_4 <= (approx_3 * valapp_3[2*APPROX_BITS+INPUTS_SIZE-INPUTS_SIZE%2-1 -:MAX_BITS]) >> 1;
        abs2_4 <= abs2_3; 
        
        valapp_5 <= abs2_4 * valapp_4[MAX_BITS+INPUTS_SIZE/2+APPROX_BITS-2-1 -:MAX_BITS];
        approx_5 <= valapp_4[MAX_BITS+INPUTS_SIZE/2+APPROX_BITS-2-1 -:MAX_BITS];
        
        // shift by (INPUTS_SIZE-1)/2+1+MAX_BITS-1 since msb of input is empty so max val for x/sqrt(x) is ... bits (2 had msb alone at valapp_4)
        // 12+12-1-(INPUTS_SIZE-1)/2
        // check (INPUTS_SIZE-1)/2-1 for input lengths
        valapp_6 <= (2'b11 << (2*MAX_BITS-1-(INPUTS_SIZE-1)/2-1)) - approx_5 * valapp_5[MAX_BITS+(INPUTS_SIZE-1)/2-1 -: MAX_BITS]; //18 // test if remove 20-23
        approx_6 <= approx_5;
        
        valapp_7 <= (approx_6 * valapp_6[2*MAX_BITS-(INPUTS_SIZE-1)/2-1 -:MAX_BITS]) >> 1;
        
        
    end
   
   
//    for (genvar i=0; i<2^12;i=i+1) begin
//    assign approx_1 = APPROX_LUT[abs2];
//////    end
    assign abs = valapp_7[2*MAX_BITS-3 -:INPUTS_SIZE] + valapp_7[2*MAX_BITS-3-INPUTS_SIZE];
//            approx = $pow(2, 4)/$sqrt($itor(i));
    
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
