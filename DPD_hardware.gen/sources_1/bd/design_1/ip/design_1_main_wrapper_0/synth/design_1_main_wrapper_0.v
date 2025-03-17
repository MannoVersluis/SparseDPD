// (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// (c) Copyright 2022-2025 Advanced Micro Devices, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:main_wrapper:1.0
// IP Revision: 1

(* X_CORE_INFO = "main_wrapper,Vivado 2024.2" *)
(* CHECK_LICENSE_TYPE = "design_1_main_wrapper_0,main_wrapper,{}" *)
(* CORE_GENERATION_INFO = "design_1_main_wrapper_0,main_wrapper,{x_ipProduct=Vivado 2024.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=main_wrapper,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,ADDR_WIDTH=1,C_AXIS_TDATA_WIDTH=32}" *)
(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_1_main_wrapper_0 (
  s_inp_axis_tdata,
  s_inp_axis_tlast,
  s_inp_axis_tvalid,
  m_out_axis_tready,
  s_inp_axis_tstrb,
  clk,
  m_out_axis_tdata,
  s_inp_axis_tready,
  m_out_axis_tlast,
  m_out_axis_tvalid,
  m_out_axis_tstrb,
  resetn
);

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_inp_axis TDATA" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_inp_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 60606064, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0" *)
input wire [31 : 0] s_inp_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_inp_axis TLAST" *)
input wire s_inp_axis_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_inp_axis TVALID" *)
input wire s_inp_axis_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_out_axis TREADY" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_out_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 60606064, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0" *)
input wire m_out_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_inp_axis TSTRB" *)
input wire [3 : 0] s_inp_axis_tstrb;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_BUSIF m_out_axis:s_inp_axis, ASSOCIATED_RESET resetn, FREQ_HZ 60606064, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *)
input wire clk;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_out_axis TDATA" *)
output wire [31 : 0] m_out_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_inp_axis TREADY" *)
output wire s_inp_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_out_axis TLAST" *)
output wire m_out_axis_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_out_axis TVALID" *)
output wire m_out_axis_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_out_axis TSTRB" *)
output wire [3 : 0] m_out_axis_tstrb;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 resetn RST" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
input wire resetn;

  main_wrapper #(
    .ADDR_WIDTH(1),
    .C_AXIS_TDATA_WIDTH(32)
  ) inst (
    .s_inp_axis_tdata(s_inp_axis_tdata),
    .s_inp_axis_tlast(s_inp_axis_tlast),
    .s_inp_axis_tvalid(s_inp_axis_tvalid),
    .m_out_axis_tready(m_out_axis_tready),
    .s_inp_axis_tstrb(s_inp_axis_tstrb),
    .clk(clk),
    .m_out_axis_tdata(m_out_axis_tdata),
    .s_inp_axis_tready(s_inp_axis_tready),
    .m_out_axis_tlast(m_out_axis_tlast),
    .m_out_axis_tvalid(m_out_axis_tvalid),
    .m_out_axis_tstrb(m_out_axis_tstrb),
    .resetn(resetn)
  );
endmodule
