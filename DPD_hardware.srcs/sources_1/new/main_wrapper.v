`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2025 12:48:43 PM
// Design Name: 
// Module Name: main_wrapper
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

module main_wrapper #(
    parameter ADDR_WIDTH = 1,
    parameter C_AXIS_TDATA_WIDTH = 32
    )(
    input wire [C_AXIS_TDATA_WIDTH-1:0] s_inp_axis_tdata,
    input wire s_inp_axis_tlast, s_inp_axis_tvalid, m_out_axis_tready,
    input wire [(C_AXIS_TDATA_WIDTH/8)-1:0] s_inp_axis_tstrb,
    input wire clk,
    output wire [C_AXIS_TDATA_WIDTH-1:0] m_out_axis_tdata,
    output wire s_inp_axis_tready, m_out_axis_tlast, m_out_axis_tvalid,
    output wire [(C_AXIS_TDATA_WIDTH/8)-1:0] m_out_axis_tstrb,
    input wire resetn
    );
    
    main_IO #(.ADDR_WIDTH(ADDR_WIDTH),
              .C_AXIS_TDATA_WIDTH(C_AXIS_TDATA_WIDTH))
        main_IO (
        .clk(clk),
        .s00_axis_tdata(s_inp_axis_tdata),
        .s00_axis_tlast(s_inp_axis_tlast),
        .s00_axis_tvalid(s_inp_axis_tvalid),
        .s00_axis_tready(s_inp_axis_tready),
        .s00_axis_tstrb(s_inp_axis_tstrb),
        .m00_axis_tdata(m_out_axis_tdata),
        .m00_axis_tlast(m_out_axis_tlast),
        .m00_axis_tvalid(m_out_axis_tvalid),
        .m00_axis_tready(m_out_axis_tready),
        .m00_axis_tstrb(m_out_axis_tstrb),
        .resetn(resetn)
    );
    
endmodule
