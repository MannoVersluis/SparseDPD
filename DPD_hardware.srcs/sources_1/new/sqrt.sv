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

module approx_inv_sqrt #(parameter INPUTS_SIZE = 15,
                            parameter EXTRA_OUT_BITS = 4 // can be at most INPUTS_SIZE-1
    )(
    input logic [0:1-INPUTS_SIZE] abs2, // truncate the lsb half
    input clk,
    output logic [0:1-INPUTS_SIZE-EXTRA_OUT_BITS] abs
    );
    
    localparam APPROX_BITS = 5; // how many bits of the inv sqrt will be stored in luts
    localparam int MAX_BITS = INPUTS_SIZE+2; // should be at least INPUTS_SIZE, operations will take at most the MAX_BITS msb's as an input
    
    localparam logic [0:$rtoi($pow(2, $itor(INPUTS_SIZE)))-1][3*(INPUTS_SIZE/2+APPROX_BITS)-2-1:0] APPROX_LUT_1 = APPROX_CALC_1();
    function logic [0:$rtoi($pow(2, $itor(INPUTS_SIZE)))-1][3*(INPUTS_SIZE/2+APPROX_BITS)-2-1:0] APPROX_CALC_1();
        for(int i=0;i<$rtoi($pow(2, $itor(INPUTS_SIZE))); i++) begin
            logic [APPROX_BITS-1:-1] tmp;
            logic [3*(INPUTS_SIZE/2+APPROX_BITS)-2-1:0] tmp2;
            tmp = $rtoi($pow(2, $itor(APPROX_BITS+$clog2(i+1)/2))/$sqrt($itor(i)));
            tmp2 = ((tmp[APPROX_BITS-1:0] + tmp[-1])*(tmp[APPROX_BITS-1:0] + tmp[-1])*(tmp[APPROX_BITS-1:0] + tmp[-1])) << 3*(INPUTS_SIZE/2-$clog2(i+1)/2);
            APPROX_CALC_1[i] = tmp2 >> (2*(INPUTS_SIZE/2+APPROX_BITS)-1 - MAX_BITS);
//            APPROX_CALC_1()[i] = tmp2 >> (3*(INPUTS_SIZE/2+APPROX_BITS)-2 - (MAX_BITS+APPROX_BITS+INPUTS_SIZE/2-1))
        end
    endfunction
    
    localparam logic [0:$rtoi($pow(2, $itor(INPUTS_SIZE)))-1][INPUTS_SIZE/2+APPROX_BITS+1-1:0] APPROX_LUT_2 = APPROX_CALC_2();
    function logic [0:$rtoi($pow(2, $itor(INPUTS_SIZE)))-1][INPUTS_SIZE/2+APPROX_BITS+1-1:0] APPROX_CALC_2();
        for(int i=0;i<$rtoi($pow(2, $itor(INPUTS_SIZE))); i++) begin
            logic [APPROX_BITS+2-1:-1] tmp;
            tmp = $rtoi($pow(2, $itor(APPROX_BITS+$clog2(i+1)/2))/$sqrt($itor(i)));
            APPROX_CALC_2[i] = (3*(tmp[APPROX_BITS-1:0] + tmp[-1])) << (INPUTS_SIZE/2-$clog2(i+1)/2);
        end
    endfunction
    
    
    logic [INPUTS_SIZE/2+APPROX_BITS+1-1:0] approx_1;
    logic [MAX_BITS+APPROX_BITS+INPUTS_SIZE/2-2:0] approx3_1;
    logic [0:1-INPUTS_SIZE] abs2_1;
    
    logic [MAX_BITS+APPROX_BITS+INPUTS_SIZE/2-1:0] valapp_2; // since (abs2_1*approx3_1) has max value for amp2=1,
        // valapp3 has #bits_used_from_approx_3_1 + 1 bits stored
        // (since the msb of shifted approx_1 is shifted, so for amp2=1, approx_1<<(<val>) = 3*(abs2_1*approx3_1) = 3*approx3_1)
    logic [INPUTS_SIZE/2+APPROX_BITS-1:0] approx_2;
    logic [0:1-INPUTS_SIZE] abs2_2;
    
    logic [MAX_BITS-1:0] approx_3;
    logic [MAX_BITS+(INPUTS_SIZE-1)/2-1:0] valapp_3;
    
    logic [MAX_BITS-1:0] approx_4;
    logic [2*MAX_BITS-(INPUTS_SIZE-1)/2-1:0] valapp_4;
    
    logic [2*MAX_BITS-2:0] valapp_5;
    
    // approximates 1/sqrt(a) by using 0.5x(3-ax^2), x = guess, a = abs2
    always_ff @(posedge clk) begin
        abs2_1 <= abs2;
        approx_1 <= APPROX_LUT_2[abs2]; // reads (the APPROX_BITS msb's of x)*3 from memory
        approx3_1 <= APPROX_LUT_1[abs2]; // reads (the APPROX_BITS msb's of x)**3 from memory
        
        valapp_2 <= (approx_1 << (MAX_BITS - 1)) - (abs2_1*approx3_1);
        abs2_2 <= abs2_1; 
        approx_2 <= approx_1;
        
        valapp_3 <= abs2_2 * valapp_2[MAX_BITS+APPROX_BITS+INPUTS_SIZE/2-1 -:MAX_BITS];
        approx_3 <= valapp_2[MAX_BITS+APPROX_BITS+INPUTS_SIZE/2-1 -:MAX_BITS];
        
        valapp_4 <= (2'b11 << (2*MAX_BITS-1-(INPUTS_SIZE-1)/2-1)) - approx_3 * valapp_3[MAX_BITS+(INPUTS_SIZE-1)/2-1 -: MAX_BITS]; //18 // test if remove 20-23
        approx_4 <= approx_3;
        
        valapp_5 <= (approx_4 * valapp_4[2*MAX_BITS-(INPUTS_SIZE-1)/2-1 -:MAX_BITS]) >> 1;
    end
    
    assign abs = valapp_5[2*MAX_BITS-3 -:INPUTS_SIZE+EXTRA_OUT_BITS] + valapp_5[2*MAX_BITS-3-INPUTS_SIZE-EXTRA_OUT_BITS];
    
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
