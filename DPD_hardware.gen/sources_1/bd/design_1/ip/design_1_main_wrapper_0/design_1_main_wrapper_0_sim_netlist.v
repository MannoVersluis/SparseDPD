// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Mon Mar 17 13:16:58 2025
// Host        : Manno running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/manno/Vivado/DPD_hardware/DPD_hardware.gen/sources_1/bd/design_1/ip/design_1_main_wrapper_0/design_1_main_wrapper_0_sim_netlist.v
// Design      : design_1_main_wrapper_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z007sclg225-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_main_wrapper_0,main_wrapper,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "main_wrapper,Vivado 2024.2" *) 
(* NotValidForBitStream *)
module design_1_main_wrapper_0
   (s_inp_axis_tdata,
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
    resetn);
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_inp_axis TDATA" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_inp_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 60606064, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0" *) input [31:0]s_inp_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_inp_axis TLAST" *) input s_inp_axis_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_inp_axis TVALID" *) input s_inp_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_out_axis TREADY" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_out_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 60606064, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0" *) input m_out_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_inp_axis TSTRB" *) input [3:0]s_inp_axis_tstrb;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_BUSIF m_out_axis:s_inp_axis, ASSOCIATED_RESET resetn, FREQ_HZ 60606064, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_out_axis TDATA" *) output [31:0]m_out_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_inp_axis TREADY" *) output s_inp_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_out_axis TLAST" *) output m_out_axis_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_out_axis TVALID" *) output m_out_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_out_axis TSTRB" *) output [3:0]m_out_axis_tstrb;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 resetn RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input resetn;

  wire \<const0> ;
  wire clk;
  wire [31:0]m_out_axis_tdata;
  wire m_out_axis_tlast;
  wire m_out_axis_tready;
  wire m_out_axis_tvalid;
  wire resetn;
  wire [31:0]s_inp_axis_tdata;
  wire s_inp_axis_tlast;
  wire s_inp_axis_tready;
  wire s_inp_axis_tvalid;

  assign m_out_axis_tstrb[3] = \<const0> ;
  assign m_out_axis_tstrb[2] = \<const0> ;
  assign m_out_axis_tstrb[1] = \<const0> ;
  assign m_out_axis_tstrb[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  design_1_main_wrapper_0_main_wrapper inst
       (.Q({m_out_axis_tlast,m_out_axis_tdata}),
        .clk(clk),
        .m_out_axis_tready(m_out_axis_tready),
        .m_out_axis_tvalid(m_out_axis_tvalid),
        .mem_write_data({s_inp_axis_tlast,s_inp_axis_tdata}),
        .resetn(resetn),
        .s_inp_axis_tready(s_inp_axis_tready),
        .s_inp_axis_tvalid(s_inp_axis_tvalid));
endmodule

(* ORIG_REF_NAME = "main_IO" *) 
module design_1_main_wrapper_0_main_IO
   (Q,
    s_inp_axis_tready,
    m_out_axis_tvalid,
    clk,
    mem_write_data,
    s_inp_axis_tvalid,
    m_out_axis_tready,
    resetn);
  output [32:0]Q;
  output s_inp_axis_tready;
  output m_out_axis_tvalid;
  input clk;
  input [32:0]mem_write_data;
  input s_inp_axis_tvalid;
  input m_out_axis_tready;
  input resetn;

  wire [32:0]Q;
  wire clk;
  wire m00_axis_tvalid_reg_i_1_n_0;
  wire \m00_data_reg[31]_i_1_n_0 ;
  wire m_out_axis_tready;
  wire m_out_axis_tvalid;
  wire [32:0]mem_read_data_reg;
  wire [32:0]mem_read_data_reg0;
  wire \mem_read_data_reg[32]_i_1_n_0 ;
  wire mem_read_data_valid_reg;
  wire mem_read_data_valid_reg_i_1_n_0;
  wire mem_reg_0_1_30_33_n_2;
  wire [32:0]mem_write_data;
  wire p_0_in;
  wire p_1_in;
  wire rd_addr_reg;
  wire \rd_addr_reg[0]_i_1_n_0 ;
  wire [1:0]rd_ptr_reg;
  wire \rd_ptr_reg[1]_i_1_n_0 ;
  wire \rd_ptr_sync1_reg_reg_n_0_[0] ;
  wire resetn;
  wire rst_sync1_reg;
  wire rst_sync1_reg_i_1_n_0;
  wire s_inp_axis_tready;
  wire s_inp_axis_tvalid;
  wire wr_addr_reg;
  wire [0:0]wr_ptr_next;
  wire \wr_ptr_reg[1]_i_1_n_0 ;
  wire \wr_ptr_reg_reg_n_0_[0] ;
  wire [1:0]wr_ptr_sync1_reg;
  wire write1_out;
  wire [1:0]NLW_mem_reg_0_1_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_mem_reg_0_1_12_17_DOD_UNCONNECTED;
  wire [1:0]NLW_mem_reg_0_1_18_23_DOD_UNCONNECTED;
  wire [1:0]NLW_mem_reg_0_1_24_29_DOD_UNCONNECTED;
  wire [1:0]NLW_mem_reg_0_1_30_33_DOC_UNCONNECTED;
  wire [1:0]NLW_mem_reg_0_1_30_33_DOD_UNCONNECTED;
  wire [1:0]NLW_mem_reg_0_1_6_11_DOD_UNCONNECTED;

  LUT3 #(
    .INIT(8'hBA)) 
    m00_axis_tvalid_reg_i_1
       (.I0(mem_read_data_valid_reg),
        .I1(m_out_axis_tready),
        .I2(m_out_axis_tvalid),
        .O(m00_axis_tvalid_reg_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    m00_axis_tvalid_reg_reg
       (.C(clk),
        .CE(1'b1),
        .D(m00_axis_tvalid_reg_i_1_n_0),
        .Q(m_out_axis_tvalid),
        .R(rst_sync1_reg));
  LUT2 #(
    .INIT(4'hB)) 
    \m00_data_reg[31]_i_1 
       (.I0(m_out_axis_tready),
        .I1(m_out_axis_tvalid),
        .O(\m00_data_reg[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[0] 
       (.C(clk),
        .CE(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[0]),
        .Q(Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[10] 
       (.C(clk),
        .CE(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[10]),
        .Q(Q[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[11] 
       (.C(clk),
        .CE(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[11]),
        .Q(Q[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[12] 
       (.C(clk),
        .CE(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[12]),
        .Q(Q[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[13] 
       (.C(clk),
        .CE(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[13]),
        .Q(Q[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[14] 
       (.C(clk),
        .CE(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[14]),
        .Q(Q[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[15] 
       (.C(clk),
        .CE(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[15]),
        .Q(Q[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[16] 
       (.C(clk),
        .CE(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[16]),
        .Q(Q[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[17] 
       (.C(clk),
        .CE(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[17]),
        .Q(Q[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[18] 
       (.C(clk),
        .CE(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[18]),
        .Q(Q[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[19] 
       (.C(clk),
        .CE(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[19]),
        .Q(Q[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[1] 
       (.C(clk),
        .CE(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[1]),
        .Q(Q[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[20] 
       (.C(clk),
        .CE(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[20]),
        .Q(Q[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[21] 
       (.C(clk),
        .CE(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[21]),
        .Q(Q[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[22] 
       (.C(clk),
        .CE(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[22]),
        .Q(Q[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[23] 
       (.C(clk),
        .CE(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[23]),
        .Q(Q[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[24] 
       (.C(clk),
        .CE(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[24]),
        .Q(Q[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[25] 
       (.C(clk),
        .CE(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[25]),
        .Q(Q[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[26] 
       (.C(clk),
        .CE(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[26]),
        .Q(Q[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[27] 
       (.C(clk),
        .CE(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[27]),
        .Q(Q[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[28] 
       (.C(clk),
        .CE(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[28]),
        .Q(Q[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[29] 
       (.C(clk),
        .CE(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[29]),
        .Q(Q[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[2] 
       (.C(clk),
        .CE(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[2]),
        .Q(Q[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[30] 
       (.C(clk),
        .CE(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[30]),
        .Q(Q[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[31] 
       (.C(clk),
        .CE(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[31]),
        .Q(Q[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[32] 
       (.C(clk),
        .CE(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[32]),
        .Q(Q[32]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[3] 
       (.C(clk),
        .CE(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[3]),
        .Q(Q[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[4] 
       (.C(clk),
        .CE(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[4]),
        .Q(Q[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[5] 
       (.C(clk),
        .CE(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[5]),
        .Q(Q[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[6] 
       (.C(clk),
        .CE(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[6]),
        .Q(Q[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[7] 
       (.C(clk),
        .CE(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[7]),
        .Q(Q[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[8] 
       (.C(clk),
        .CE(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[8]),
        .Q(Q[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m00_data_reg_reg[9] 
       (.C(clk),
        .CE(\m00_data_reg[31]_i_1_n_0 ),
        .D(mem_read_data_reg[9]),
        .Q(Q[9]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0DD0DDDDDDDD0DD0)) 
    \mem_read_data_reg[32]_i_1 
       (.I0(mem_read_data_valid_reg),
        .I1(\m00_data_reg[31]_i_1_n_0 ),
        .I2(wr_ptr_sync1_reg[1]),
        .I3(rd_ptr_reg[1]),
        .I4(wr_ptr_sync1_reg[0]),
        .I5(rd_ptr_reg[0]),
        .O(\mem_read_data_reg[32]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \mem_read_data_reg_reg[0] 
       (.C(clk),
        .CE(\mem_read_data_reg[32]_i_1_n_0 ),
        .D(mem_read_data_reg0[0]),
        .Q(mem_read_data_reg[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mem_read_data_reg_reg[10] 
       (.C(clk),
        .CE(\mem_read_data_reg[32]_i_1_n_0 ),
        .D(mem_read_data_reg0[10]),
        .Q(mem_read_data_reg[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mem_read_data_reg_reg[11] 
       (.C(clk),
        .CE(\mem_read_data_reg[32]_i_1_n_0 ),
        .D(mem_read_data_reg0[11]),
        .Q(mem_read_data_reg[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mem_read_data_reg_reg[12] 
       (.C(clk),
        .CE(\mem_read_data_reg[32]_i_1_n_0 ),
        .D(mem_read_data_reg0[12]),
        .Q(mem_read_data_reg[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mem_read_data_reg_reg[13] 
       (.C(clk),
        .CE(\mem_read_data_reg[32]_i_1_n_0 ),
        .D(mem_read_data_reg0[13]),
        .Q(mem_read_data_reg[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mem_read_data_reg_reg[14] 
       (.C(clk),
        .CE(\mem_read_data_reg[32]_i_1_n_0 ),
        .D(mem_read_data_reg0[14]),
        .Q(mem_read_data_reg[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mem_read_data_reg_reg[15] 
       (.C(clk),
        .CE(\mem_read_data_reg[32]_i_1_n_0 ),
        .D(mem_read_data_reg0[15]),
        .Q(mem_read_data_reg[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mem_read_data_reg_reg[16] 
       (.C(clk),
        .CE(\mem_read_data_reg[32]_i_1_n_0 ),
        .D(mem_read_data_reg0[16]),
        .Q(mem_read_data_reg[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mem_read_data_reg_reg[17] 
       (.C(clk),
        .CE(\mem_read_data_reg[32]_i_1_n_0 ),
        .D(mem_read_data_reg0[17]),
        .Q(mem_read_data_reg[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mem_read_data_reg_reg[18] 
       (.C(clk),
        .CE(\mem_read_data_reg[32]_i_1_n_0 ),
        .D(mem_read_data_reg0[18]),
        .Q(mem_read_data_reg[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mem_read_data_reg_reg[19] 
       (.C(clk),
        .CE(\mem_read_data_reg[32]_i_1_n_0 ),
        .D(mem_read_data_reg0[19]),
        .Q(mem_read_data_reg[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mem_read_data_reg_reg[1] 
       (.C(clk),
        .CE(\mem_read_data_reg[32]_i_1_n_0 ),
        .D(mem_read_data_reg0[1]),
        .Q(mem_read_data_reg[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mem_read_data_reg_reg[20] 
       (.C(clk),
        .CE(\mem_read_data_reg[32]_i_1_n_0 ),
        .D(mem_read_data_reg0[20]),
        .Q(mem_read_data_reg[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mem_read_data_reg_reg[21] 
       (.C(clk),
        .CE(\mem_read_data_reg[32]_i_1_n_0 ),
        .D(mem_read_data_reg0[21]),
        .Q(mem_read_data_reg[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mem_read_data_reg_reg[22] 
       (.C(clk),
        .CE(\mem_read_data_reg[32]_i_1_n_0 ),
        .D(mem_read_data_reg0[22]),
        .Q(mem_read_data_reg[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mem_read_data_reg_reg[23] 
       (.C(clk),
        .CE(\mem_read_data_reg[32]_i_1_n_0 ),
        .D(mem_read_data_reg0[23]),
        .Q(mem_read_data_reg[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mem_read_data_reg_reg[24] 
       (.C(clk),
        .CE(\mem_read_data_reg[32]_i_1_n_0 ),
        .D(mem_read_data_reg0[24]),
        .Q(mem_read_data_reg[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mem_read_data_reg_reg[25] 
       (.C(clk),
        .CE(\mem_read_data_reg[32]_i_1_n_0 ),
        .D(mem_read_data_reg0[25]),
        .Q(mem_read_data_reg[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mem_read_data_reg_reg[26] 
       (.C(clk),
        .CE(\mem_read_data_reg[32]_i_1_n_0 ),
        .D(mem_read_data_reg0[26]),
        .Q(mem_read_data_reg[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mem_read_data_reg_reg[27] 
       (.C(clk),
        .CE(\mem_read_data_reg[32]_i_1_n_0 ),
        .D(mem_read_data_reg0[27]),
        .Q(mem_read_data_reg[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mem_read_data_reg_reg[28] 
       (.C(clk),
        .CE(\mem_read_data_reg[32]_i_1_n_0 ),
        .D(mem_read_data_reg0[28]),
        .Q(mem_read_data_reg[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mem_read_data_reg_reg[29] 
       (.C(clk),
        .CE(\mem_read_data_reg[32]_i_1_n_0 ),
        .D(mem_read_data_reg0[29]),
        .Q(mem_read_data_reg[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mem_read_data_reg_reg[2] 
       (.C(clk),
        .CE(\mem_read_data_reg[32]_i_1_n_0 ),
        .D(mem_read_data_reg0[2]),
        .Q(mem_read_data_reg[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mem_read_data_reg_reg[30] 
       (.C(clk),
        .CE(\mem_read_data_reg[32]_i_1_n_0 ),
        .D(mem_read_data_reg0[30]),
        .Q(mem_read_data_reg[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mem_read_data_reg_reg[31] 
       (.C(clk),
        .CE(\mem_read_data_reg[32]_i_1_n_0 ),
        .D(mem_read_data_reg0[31]),
        .Q(mem_read_data_reg[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mem_read_data_reg_reg[32] 
       (.C(clk),
        .CE(\mem_read_data_reg[32]_i_1_n_0 ),
        .D(mem_read_data_reg0[32]),
        .Q(mem_read_data_reg[32]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mem_read_data_reg_reg[3] 
       (.C(clk),
        .CE(\mem_read_data_reg[32]_i_1_n_0 ),
        .D(mem_read_data_reg0[3]),
        .Q(mem_read_data_reg[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mem_read_data_reg_reg[4] 
       (.C(clk),
        .CE(\mem_read_data_reg[32]_i_1_n_0 ),
        .D(mem_read_data_reg0[4]),
        .Q(mem_read_data_reg[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mem_read_data_reg_reg[5] 
       (.C(clk),
        .CE(\mem_read_data_reg[32]_i_1_n_0 ),
        .D(mem_read_data_reg0[5]),
        .Q(mem_read_data_reg[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mem_read_data_reg_reg[6] 
       (.C(clk),
        .CE(\mem_read_data_reg[32]_i_1_n_0 ),
        .D(mem_read_data_reg0[6]),
        .Q(mem_read_data_reg[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mem_read_data_reg_reg[7] 
       (.C(clk),
        .CE(\mem_read_data_reg[32]_i_1_n_0 ),
        .D(mem_read_data_reg0[7]),
        .Q(mem_read_data_reg[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mem_read_data_reg_reg[8] 
       (.C(clk),
        .CE(\mem_read_data_reg[32]_i_1_n_0 ),
        .D(mem_read_data_reg0[8]),
        .Q(mem_read_data_reg[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mem_read_data_reg_reg[9] 
       (.C(clk),
        .CE(\mem_read_data_reg[32]_i_1_n_0 ),
        .D(mem_read_data_reg0[9]),
        .Q(mem_read_data_reg[9]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h6FF6FFFF6FF66FF6)) 
    mem_read_data_valid_reg_i_1
       (.I0(wr_ptr_sync1_reg[1]),
        .I1(rd_ptr_reg[1]),
        .I2(wr_ptr_sync1_reg[0]),
        .I3(rd_ptr_reg[0]),
        .I4(\m00_data_reg[31]_i_1_n_0 ),
        .I5(mem_read_data_valid_reg),
        .O(mem_read_data_valid_reg_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    mem_read_data_valid_reg_reg
       (.C(clk),
        .CE(1'b1),
        .D(mem_read_data_valid_reg_i_1_n_0),
        .Q(mem_read_data_valid_reg),
        .R(rst_sync1_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "68" *) 
  (* RTL_RAM_NAME = "design_1_main_wrapper_0/inst/main_IO/mem_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "5" *) 
  RAM32M mem_reg_0_1_0_5
       (.ADDRA({1'b0,1'b0,1'b0,1'b0,rd_addr_reg}),
        .ADDRB({1'b0,1'b0,1'b0,1'b0,rd_addr_reg}),
        .ADDRC({1'b0,1'b0,1'b0,1'b0,rd_addr_reg}),
        .ADDRD({1'b0,1'b0,1'b0,1'b0,wr_addr_reg}),
        .DIA(mem_write_data[1:0]),
        .DIB(mem_write_data[3:2]),
        .DIC(mem_write_data[5:4]),
        .DID({1'b0,1'b0}),
        .DOA(mem_read_data_reg0[1:0]),
        .DOB(mem_read_data_reg0[3:2]),
        .DOC(mem_read_data_reg0[5:4]),
        .DOD(NLW_mem_reg_0_1_0_5_DOD_UNCONNECTED[1:0]),
        .WCLK(clk),
        .WE(write1_out));
  LUT5 #(
    .INIT(32'hAA2828AA)) 
    mem_reg_0_1_0_5_i_1
       (.I0(s_inp_axis_tvalid),
        .I1(\rd_ptr_sync1_reg_reg_n_0_[0] ),
        .I2(\wr_ptr_reg_reg_n_0_[0] ),
        .I3(p_0_in),
        .I4(p_1_in),
        .O(write1_out));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "68" *) 
  (* RTL_RAM_NAME = "design_1_main_wrapper_0/inst/main_IO/mem_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "12" *) 
  (* ram_slice_end = "17" *) 
  RAM32M mem_reg_0_1_12_17
       (.ADDRA({1'b0,1'b0,1'b0,1'b0,rd_addr_reg}),
        .ADDRB({1'b0,1'b0,1'b0,1'b0,rd_addr_reg}),
        .ADDRC({1'b0,1'b0,1'b0,1'b0,rd_addr_reg}),
        .ADDRD({1'b0,1'b0,1'b0,1'b0,wr_addr_reg}),
        .DIA(mem_write_data[13:12]),
        .DIB(mem_write_data[15:14]),
        .DIC(mem_write_data[17:16]),
        .DID({1'b0,1'b0}),
        .DOA(mem_read_data_reg0[13:12]),
        .DOB(mem_read_data_reg0[15:14]),
        .DOC(mem_read_data_reg0[17:16]),
        .DOD(NLW_mem_reg_0_1_12_17_DOD_UNCONNECTED[1:0]),
        .WCLK(clk),
        .WE(write1_out));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "68" *) 
  (* RTL_RAM_NAME = "design_1_main_wrapper_0/inst/main_IO/mem_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "18" *) 
  (* ram_slice_end = "23" *) 
  RAM32M mem_reg_0_1_18_23
       (.ADDRA({1'b0,1'b0,1'b0,1'b0,rd_addr_reg}),
        .ADDRB({1'b0,1'b0,1'b0,1'b0,rd_addr_reg}),
        .ADDRC({1'b0,1'b0,1'b0,1'b0,rd_addr_reg}),
        .ADDRD({1'b0,1'b0,1'b0,1'b0,wr_addr_reg}),
        .DIA(mem_write_data[19:18]),
        .DIB(mem_write_data[21:20]),
        .DIC(mem_write_data[23:22]),
        .DID({1'b0,1'b0}),
        .DOA(mem_read_data_reg0[19:18]),
        .DOB(mem_read_data_reg0[21:20]),
        .DOC(mem_read_data_reg0[23:22]),
        .DOD(NLW_mem_reg_0_1_18_23_DOD_UNCONNECTED[1:0]),
        .WCLK(clk),
        .WE(write1_out));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "68" *) 
  (* RTL_RAM_NAME = "design_1_main_wrapper_0/inst/main_IO/mem_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "24" *) 
  (* ram_slice_end = "29" *) 
  RAM32M mem_reg_0_1_24_29
       (.ADDRA({1'b0,1'b0,1'b0,1'b0,rd_addr_reg}),
        .ADDRB({1'b0,1'b0,1'b0,1'b0,rd_addr_reg}),
        .ADDRC({1'b0,1'b0,1'b0,1'b0,rd_addr_reg}),
        .ADDRD({1'b0,1'b0,1'b0,1'b0,wr_addr_reg}),
        .DIA(mem_write_data[25:24]),
        .DIB(mem_write_data[27:26]),
        .DIC(mem_write_data[29:28]),
        .DID({1'b0,1'b0}),
        .DOA(mem_read_data_reg0[25:24]),
        .DOB(mem_read_data_reg0[27:26]),
        .DOC(mem_read_data_reg0[29:28]),
        .DOD(NLW_mem_reg_0_1_24_29_DOD_UNCONNECTED[1:0]),
        .WCLK(clk),
        .WE(write1_out));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "68" *) 
  (* RTL_RAM_NAME = "design_1_main_wrapper_0/inst/main_IO/mem_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "30" *) 
  (* ram_slice_end = "33" *) 
  RAM32M mem_reg_0_1_30_33
       (.ADDRA({1'b0,1'b0,1'b0,1'b0,rd_addr_reg}),
        .ADDRB({1'b0,1'b0,1'b0,1'b0,rd_addr_reg}),
        .ADDRC({1'b0,1'b0,1'b0,1'b0,rd_addr_reg}),
        .ADDRD({1'b0,1'b0,1'b0,1'b0,wr_addr_reg}),
        .DIA(mem_write_data[31:30]),
        .DIB({1'b0,mem_write_data[32]}),
        .DIC({1'b0,1'b0}),
        .DID({1'b0,1'b0}),
        .DOA(mem_read_data_reg0[31:30]),
        .DOB({mem_reg_0_1_30_33_n_2,mem_read_data_reg0[32]}),
        .DOC(NLW_mem_reg_0_1_30_33_DOC_UNCONNECTED[1:0]),
        .DOD(NLW_mem_reg_0_1_30_33_DOD_UNCONNECTED[1:0]),
        .WCLK(clk),
        .WE(write1_out));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "68" *) 
  (* RTL_RAM_NAME = "design_1_main_wrapper_0/inst/main_IO/mem_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "11" *) 
  RAM32M mem_reg_0_1_6_11
       (.ADDRA({1'b0,1'b0,1'b0,1'b0,rd_addr_reg}),
        .ADDRB({1'b0,1'b0,1'b0,1'b0,rd_addr_reg}),
        .ADDRC({1'b0,1'b0,1'b0,1'b0,rd_addr_reg}),
        .ADDRD({1'b0,1'b0,1'b0,1'b0,wr_addr_reg}),
        .DIA(mem_write_data[7:6]),
        .DIB(mem_write_data[9:8]),
        .DIC(mem_write_data[11:10]),
        .DID({1'b0,1'b0}),
        .DOA(mem_read_data_reg0[7:6]),
        .DOB(mem_read_data_reg0[9:8]),
        .DOC(mem_read_data_reg0[11:10]),
        .DOD(NLW_mem_reg_0_1_6_11_DOD_UNCONNECTED[1:0]),
        .WCLK(clk),
        .WE(write1_out));
  LUT6 #(
    .INIT(64'h90FF9090F600F6F6)) 
    \rd_addr_reg[0]_i_1 
       (.I0(wr_ptr_sync1_reg[1]),
        .I1(rd_ptr_reg[1]),
        .I2(wr_ptr_sync1_reg[0]),
        .I3(\m00_data_reg[31]_i_1_n_0 ),
        .I4(mem_read_data_valid_reg),
        .I5(rd_ptr_reg[0]),
        .O(\rd_addr_reg[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rd_addr_reg_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\rd_addr_reg[0]_i_1_n_0 ),
        .Q(rd_addr_reg),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hD5FFD5D5A200A2A2)) 
    \rd_ptr_reg[1]_i_1 
       (.I0(rd_ptr_reg[0]),
        .I1(wr_ptr_sync1_reg[0]),
        .I2(wr_ptr_sync1_reg[1]),
        .I3(\m00_data_reg[31]_i_1_n_0 ),
        .I4(mem_read_data_valid_reg),
        .I5(rd_ptr_reg[1]),
        .O(\rd_ptr_reg[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\rd_addr_reg[0]_i_1_n_0 ),
        .Q(rd_ptr_reg[0]),
        .R(rst_sync1_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\rd_ptr_reg[1]_i_1_n_0 ),
        .Q(rd_ptr_reg[1]),
        .R(rst_sync1_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_sync1_reg_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(rd_ptr_reg[0]),
        .Q(\rd_ptr_sync1_reg_reg_n_0_[0] ),
        .R(rst_sync1_reg));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_sync1_reg_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(rd_ptr_reg[1]),
        .Q(p_0_in),
        .R(rst_sync1_reg));
  LUT1 #(
    .INIT(2'h1)) 
    rst_sync1_reg_i_1
       (.I0(resetn),
        .O(rst_sync1_reg_i_1_n_0));
  FDRE #(
    .INIT(1'b1)) 
    rst_sync1_reg_reg
       (.C(clk),
        .CE(1'b1),
        .D(rst_sync1_reg_i_1_n_0),
        .Q(rst_sync1_reg),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h0000F66F)) 
    s_inp_axis_tready_INST_0
       (.I0(\rd_ptr_sync1_reg_reg_n_0_[0] ),
        .I1(\wr_ptr_reg_reg_n_0_[0] ),
        .I2(p_0_in),
        .I3(p_1_in),
        .I4(rst_sync1_reg),
        .O(s_inp_axis_tready));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h6F09F0F0)) 
    \wr_addr_reg[0]_i_1 
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\wr_ptr_reg_reg_n_0_[0] ),
        .I3(\rd_ptr_sync1_reg_reg_n_0_[0] ),
        .I4(s_inp_axis_tvalid),
        .O(wr_ptr_next));
  FDRE #(
    .INIT(1'b0)) 
    \wr_addr_reg_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(wr_ptr_next),
        .Q(wr_addr_reg),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h77F70888)) 
    \wr_ptr_reg[1]_i_1 
       (.I0(\wr_ptr_reg_reg_n_0_[0] ),
        .I1(s_inp_axis_tvalid),
        .I2(\rd_ptr_sync1_reg_reg_n_0_[0] ),
        .I3(p_0_in),
        .I4(p_1_in),
        .O(\wr_ptr_reg[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_reg_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(wr_ptr_next),
        .Q(\wr_ptr_reg_reg_n_0_[0] ),
        .R(rst_sync1_reg));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_reg_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\wr_ptr_reg[1]_i_1_n_0 ),
        .Q(p_1_in),
        .R(rst_sync1_reg));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_sync1_reg_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\wr_ptr_reg_reg_n_0_[0] ),
        .Q(wr_ptr_sync1_reg[0]),
        .R(rst_sync1_reg));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_sync1_reg_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(p_1_in),
        .Q(wr_ptr_sync1_reg[1]),
        .R(rst_sync1_reg));
endmodule

(* ORIG_REF_NAME = "main_wrapper" *) 
module design_1_main_wrapper_0_main_wrapper
   (Q,
    s_inp_axis_tready,
    m_out_axis_tvalid,
    clk,
    mem_write_data,
    s_inp_axis_tvalid,
    m_out_axis_tready,
    resetn);
  output [32:0]Q;
  output s_inp_axis_tready;
  output m_out_axis_tvalid;
  input clk;
  input [32:0]mem_write_data;
  input s_inp_axis_tvalid;
  input m_out_axis_tready;
  input resetn;

  wire [32:0]Q;
  wire clk;
  wire m_out_axis_tready;
  wire m_out_axis_tvalid;
  wire [32:0]mem_write_data;
  wire resetn;
  wire s_inp_axis_tready;
  wire s_inp_axis_tvalid;

  design_1_main_wrapper_0_main_IO main_IO
       (.Q(Q),
        .clk(clk),
        .m_out_axis_tready(m_out_axis_tready),
        .m_out_axis_tvalid(m_out_axis_tvalid),
        .mem_write_data(mem_write_data),
        .resetn(resetn),
        .s_inp_axis_tready(s_inp_axis_tready),
        .s_inp_axis_tvalid(s_inp_axis_tvalid));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
