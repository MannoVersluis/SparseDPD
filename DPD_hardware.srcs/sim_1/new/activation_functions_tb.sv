`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2024 02:06:09 PM
// Design Name: 
// Module Name: adder_tree_tb
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

module activation_function_tb();

    parameter OUTPUTS_SIZE = 8;
    parameter MIN_BIT_OUTPUTS = -7;

    logic signed [OUTPUTS_SIZE+MIN_BIT_OUTPUTS-1:MIN_BIT_OUTPUTS] in;
    logic signed [OUTPUTS_SIZE+MIN_BIT_OUTPUTS-1:MIN_BIT_OUTPUTS] out;
    
    RELU #(.OUTPUTS_SIZE(OUTPUTS_SIZE),.MIN_BIT_OUTPUTS(MIN_BIT_OUTPUTS))
        test_relu (.inputs(in),.outputs(out));
    
    initial begin
        for (int i=0; i<50;i=i+1) begin
            in = $random;
            #5;
            if ((in <=0 && out != 0) || (in>0 && out != in)) begin
                $error("Incorrect output data, time=%0t in=%0h, out=%0h.", $time, in, out);
            end
            #5;
        end
    end
endmodule
