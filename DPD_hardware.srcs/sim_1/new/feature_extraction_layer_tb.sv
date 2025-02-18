`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2024 11:47:24 AM
// Design Name: 
// Module Name: activation_layer_tb
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


module activation_layer_tb();
    parameter int INPUTS_SIZE = 12;
    parameter int LAYER_FIRST_ACT_QUANTIZER = 1-INPUTS_SIZE;
    parameter string FEATURE_EXTRACTION = "1_3_INV";
    parameter int RANGE = $pow(2, INPUTS_SIZE)-1;
    parameter PHASE_NORM = 1;

//    logic signed [0:1-INPUTS_SIZE] I_in;
//    logic signed [0:1-INPUTS_SIZE] Q_in;

    parameter int DELAY = 9; // how many clock cyles-1 bits are stored while inv_sqrt is calculated
    
    logic signed [0:1-INPUTS_SIZE] I [DELAY-1:0] = '{DELAY{0}};
    logic signed [0:1-INPUTS_SIZE] Q [DELAY-1:0] = '{DELAY{0}};
    logic [0:1-2*INPUTS_SIZE] abs_low [DELAY-1:0] = '{DELAY{0}};
    logic [0:1-4*INPUTS_SIZE] abs_high [DELAY-1:0] = '{DELAY{0}};
    
    logic signed [0:1-INPUTS_SIZE] I_out;
    logic signed [0:1-INPUTS_SIZE] Q_out;
    logic [0:1-INPUTS_SIZE] abs_low_out;
    logic [0:1-INPUTS_SIZE] abs_high_out;
    logic [0:1-INPUTS_SIZE] norm_I_out;
    logic [0:1-INPUTS_SIZE] norm_Q_out;
    
    real I_real;
    real Q_real;
    real angle;
    real abs2;
    int mag;
    
    logic clk;
    
    feature_extraction #(.INPUTS_SIZE(INPUTS_SIZE),
                            .LAYER_FIRST_ACT_QUANTIZER(LAYER_FIRST_ACT_QUANTIZER),
//                            .FEATURE_EXTRACTION(FEATURE_EXTRACTION),
                            .PHASE_NORM(PHASE_NORM))
        feature_extraction (.I(I[0]),
                            .Q(Q[0]),
                            .I_out(I_out),
                            .Q_out(Q_out),
                            .abs_low_out(abs_low_out),
                            .abs_high_out(abs_high_out),
                            .clk(clk),
                            .norm_I_out(norm_I_out),
                            .norm_Q_out(norm_Q_out));
    
    always #5 clk = ~clk;
    
    always_ff @(posedge clk) begin: abs2_stage // abs2 value of I and Q,
        I[DELAY-1:1]        <= I[DELAY-2:0];
        Q[DELAY-1:1]        <= Q[DELAY-2:0];
        abs_low[DELAY-1:1]  <= abs_low[DELAY-2:0];
        abs_high[DELAY-1:1] <= abs_high[DELAY-2:0];
    end
    
    initial begin
        clk = 1;
        for (int i=0;i<500;i=i+1) begin
//            int_I = $signed($urandom_range(0, 127)) - 128;
//            int_Q = $signed($urandom_range(0, 127)) - 128;
            #10
            angle = $random;
            mag = $signed($urandom_range(0, RANGE)) - $pow(2, INPUTS_SIZE-1);
            I_real = $floor($cos(angle)*mag);
            Q_real = $floor($sin(angle)*mag);
            I[0] = I_real;
            Q[0] = Q_real;
            if (FEATURE_EXTRACTION == "1_3" | FEATURE_EXTRACTION == "1_3_INV") begin
                abs2 = I_real*I_real + Q_real*Q_real;
                abs_low[0] = $sqrt(abs2);
                abs_high[0] = $pow($sqrt(abs2), 3);
                if ((I[DELAY-1] != I_out) || (Q[DELAY-1] != Q_out) || (abs_low[DELAY-1] != abs_low_out))// || (((abs_high[DELAY-1] >> -2*LAYER_FIRST_ACT_QUANTIZER)+(abs_high[DELAY-1][-4*INPUTS_SIZE-2*LAYER_FIRST_ACT_QUANTIZER]) != abs_high_out)))
                    $error("Incorrect output data, time=%0t I_in=%0h, Q_in=%0h, I_out=0%h, Q_out=0%h, abs_low=0%h, abs_low_out=0%h, abs_high=0%h, abs_high_out=0%h", $time, I[DELAY-1], Q[DELAY-1], I_out, Q_out, abs_low[DELAY-1], abs_low_out, ((abs_high[DELAY-1] >> -2*LAYER_FIRST_ACT_QUANTIZER)+(abs_high[DELAY-1][-4*INPUTS_SIZE-2*LAYER_FIRST_ACT_QUANTIZER])), abs_high_out);
            end
            else if (FEATURE_EXTRACTION == "2_4") begin
                if ((I[DELAY-1] != I_out) || (Q[DELAY-1] != Q_out) || ((abs_low[DELAY-1] >> -LAYER_FIRST_ACT_QUANTIZER)  != abs_low_out) || (((abs_high[DELAY-1] >> -3*LAYER_FIRST_ACT_QUANTIZER)+abs_high[DELAY-1][-LAYER_FIRST_ACT_QUANTIZER*3-4*INPUTS_SIZE]) != abs_high_out))
                    $error("Incorrect output data, time=%0t I_in=%0h, Q_in=%0h, I_out=0%h, Q_out=0%h, abs_low=0%h, abs_low_out=0%h, abs_high=0%h, abs_high_out=0%h", $time, I[DELAY-1], Q[DELAY-1], I_out, Q_out, abs_low[DELAY-1], abs_low_out, (abs_high[DELAY-1] >> -3*LAYER_FIRST_ACT_QUANTIZER)+abs_high[DELAY-1][-LAYER_FIRST_ACT_QUANTIZER*3-4*INPUTS_SIZE], abs_high_out);
            end
        end
    end
endmodule
