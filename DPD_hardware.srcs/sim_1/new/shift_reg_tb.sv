`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2024 05:23:30 PM
// Design Name: 
// Module Name: shift_reg_tb
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


module shift_reg_tb();
parameter INPUT_SIZE = 8;
parameter INPUT_AMOUNT = 4;
parameter SHIFT_LENGTH = 8;

logic clk;
logic [INPUT_SIZE-1:0] in [INPUT_AMOUNT-1:0];
logic [INPUT_SIZE-1:0] storage [SHIFT_LENGTH-1:0][INPUT_AMOUNT-1:0] = '{SHIFT_LENGTH{'{INPUT_AMOUNT{'b0}}}};
logic [INPUT_SIZE-1:0] out [SHIFT_LENGTH-1:0][INPUT_AMOUNT-1:0];
int val;

shift_reg #(.INPUT_SIZE(INPUT_SIZE),
            .INPUT_AMOUNT(INPUT_AMOUNT),
            .SHIFT_LENGTH(SHIFT_LENGTH))
    shift_reg (.in(in),
                .out(out),
                .clk(clk));

initial begin
    clk = 0;
    for (int x=0; x<50; x=x+1) begin
        clk = ~clk;
        for (int y=0; y<INPUT_AMOUNT; y=y+1)
            in[y] = $random;
        for (int x=0; x<SHIFT_LENGTH-1;x=x+1) begin
            storage[x] = storage[x+1];
        end
        storage[SHIFT_LENGTH-1] = in;
        #5;
        clk = ~clk;
        for (int x=0; x<SHIFT_LENGTH; x=x+1) begin
            for (int y=0; y<INPUT_AMOUNT; y=y+1)
                if (out[x][y] != storage[x][y])
                    $error("Incorrect output data, time=%0t, out=%0h, out_test=%0h, index=%d, %d", $time, out[INPUT_AMOUNT*y+x], storage[x][y], x, y);
        end
        #5;
    end
end
endmodule
