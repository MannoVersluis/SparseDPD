`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/22/2025 11:31:17 AM
// Design Name: 
// Module Name: phase_norm_denorm_tb
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


module phase_norm_denorm_tb();
    parameter int INPUTS_SIZE = 12;
    parameter int LAYER_FIRST_ACT_QUANTIZER = 1-INPUTS_SIZE;
    parameter int RANGE = $pow(2, INPUTS_SIZE)-1;
    parameter WIDTH = 2;

    logic signed [0:1-INPUTS_SIZE] I [WIDTH:0] = '{WIDTH+1{0}};
    logic signed [0:1-INPUTS_SIZE] Q [WIDTH:0] = '{WIDTH+1{0}};
    logic signed [0:1-INPUTS_SIZE] norm_I_out [WIDTH-1:0];
    logic signed [0:1-INPUTS_SIZE] norm_Q_out [WIDTH-1:0];
    logic signed [0:1-INPUTS_SIZE] denorm_I_out [WIDTH-1:0];
    logic signed [0:1-INPUTS_SIZE] denorm_Q_out [WIDTH-1:0];
    logic signed [0:1-INPUTS_SIZE] norm_I;
    logic signed [0:1-INPUTS_SIZE] norm_Q;
    logic signed [0:1-INPUTS_SIZE] denorm_I;
    logic signed [0:1-INPUTS_SIZE] denorm_Q;
    logic clk;
    
    real I_real;
    real Q_real;
    real angle;
    real inv_abs;
    real norm_I_real;
    real norm_Q_real;
    int norm_I_int;
    int norm_Q_int;
    int mag;
    
    phase_normalization #(.WIDTH(WIDTH),.INPUTS_SIZE(INPUTS_SIZE))
        norm (.I_inputs(I[WIDTH-1:0]),.Q_inputs(Q[WIDTH-1:0]),.clk(clk),.I_out(norm_I_out),.Q_out(norm_Q_out),.norm_I_input(norm_I),.norm_Q_input(norm_Q));
    
    phase_denormalization #(.WIDTH(WIDTH),.INPUTS_SIZE(INPUTS_SIZE))
        denorm (.I_inputs(norm_I_out),.Q_inputs(norm_Q_out),.clk(clk),.I_out(denorm_I_out),.Q_out(denorm_Q_out),.norm_I_input(denorm_I),.norm_Q_input(denorm_Q));
    
    always #5 clk = ~clk;
    
    always_ff @(posedge clk) begin: abs2_stage // abs2 value of I and Q,
        I[WIDTH:1]          <= I[WIDTH-1:0];
        Q[WIDTH:1]          <= Q[WIDTH-1:0];
        norm_I_int          <= norm_I;
        norm_Q_int          <= norm_Q;
        denorm_I            <= norm_I;
        denorm_Q            <= norm_Q;
    end
    
    initial begin
        clk = 0;
        for (int i=0;i<500;i=i+1) begin
            #5;
            #5;
            angle = $random;
            mag = $signed($urandom_range(0, RANGE)) - $pow(2, INPUTS_SIZE-1);
            I_real = $floor($cos(angle)*mag);
            Q_real = $floor($sin(angle)*mag);
            I[0] = I_real;
            Q[0] = Q_real;
            inv_abs = 1.0 / $sqrt(I_real*I_real + Q_real*Q_real);
            norm_I_real = I_real * inv_abs;
            norm_Q_real = Q_real * inv_abs;
            norm_I = norm_I_real*$pow(2, -LAYER_FIRST_ACT_QUANTIZER);
            norm_Q = norm_Q_real*$pow(2, -LAYER_FIRST_ACT_QUANTIZER);
            
//            for (int i=0; i<WIDTH; i=i+1) begin
//                if (norm_I_out[i] != (I[i+1]*norm_I + Q[I+1]*norm_Q))
//                    $error("Incorrect output data, time=%0t I_out=%0h, I_test=0%h", $time, norm_I_out[i], (I[i+1]*norm_I + Q[I+1]*norm_Q));
//                if (norm_Q_out[i] != (Q[i+1]*norm_I - I[I+1]*norm_Q))
//                    $error("Incorrect output data, time=%0t I_out=%0h, I_test=0%h", $time, norm_Q_out[i], (Q[i+1]*norm_I - I[I+1]*norm_Q));
//            end
        end
    end
    
    
endmodule
