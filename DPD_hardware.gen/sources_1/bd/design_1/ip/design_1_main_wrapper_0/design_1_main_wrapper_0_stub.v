// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Wed Mar 19 10:49:43 2025
// Host        : Manno running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/manno/Vivado/DPD_hardware/DPD_hardware.gen/sources_1/bd/design_1/ip/design_1_main_wrapper_0/design_1_main_wrapper_0_stub.v
// Design      : design_1_main_wrapper_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z007sclg225-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "design_1_main_wrapper_0,main_wrapper,{}" *) (* CORE_GENERATION_INFO = "design_1_main_wrapper_0,main_wrapper,{x_ipProduct=Vivado 2024.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=main_wrapper,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,ADDR_WIDTH=1,C_AXIS_TDATA_WIDTH=32}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* IP_DEFINITION_SOURCE = "module_ref" *) (* X_CORE_INFO = "main_wrapper,Vivado 2024.2" *) 
module design_1_main_wrapper_0(s_inp_axis_tdata, s_inp_axis_tlast, 
  s_inp_axis_tvalid, m_out_axis_tready, s_inp_axis_tstrb, clk, m_out_axis_tdata, 
  s_inp_axis_tready, m_out_axis_tlast, m_out_axis_tvalid, m_out_axis_tstrb, resetn)
/* synthesis syn_black_box black_box_pad_pin="s_inp_axis_tdata[31:0],s_inp_axis_tlast,s_inp_axis_tvalid,m_out_axis_tready,s_inp_axis_tstrb[3:0],m_out_axis_tdata[63:0],s_inp_axis_tready,m_out_axis_tlast,m_out_axis_tvalid,m_out_axis_tstrb[7:0],resetn" */
/* synthesis syn_force_seq_prim="clk" */;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_inp_axis TDATA" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_inp_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 102564102, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0" *) input [31:0]s_inp_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_inp_axis TLAST" *) input s_inp_axis_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_inp_axis TVALID" *) input s_inp_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_out_axis TREADY" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_out_axis, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 102564102, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0" *) input m_out_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_inp_axis TSTRB" *) input [3:0]s_inp_axis_tstrb;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_BUSIF m_out_axis:s_inp_axis, ASSOCIATED_RESET resetn, FREQ_HZ 102564102, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input clk /* synthesis syn_isclock = 1 */;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_out_axis TDATA" *) output [63:0]m_out_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_inp_axis TREADY" *) output s_inp_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_out_axis TLAST" *) output m_out_axis_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_out_axis TVALID" *) output m_out_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_out_axis TSTRB" *) output [7:0]m_out_axis_tstrb;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 resetn RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input resetn;
endmodule
