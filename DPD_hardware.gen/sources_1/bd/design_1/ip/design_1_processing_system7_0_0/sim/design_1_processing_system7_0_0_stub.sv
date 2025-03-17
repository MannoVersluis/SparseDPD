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


//------------------------------------------------------------------------------------
// Filename:    design_1_processing_system7_0_0_stub.sv
// Description: This HDL file is intended to be used with following simulators only:
//
//   Vivado Simulator (XSim)
//   Cadence Xcelium Simulator
//
//------------------------------------------------------------------------------------
`timescale 1ps/1ps

`ifdef XILINX_SIMULATOR

`ifndef XILINX_SIMULATOR_BITASBOOL
`define XILINX_SIMULATOR_BITASBOOL
typedef bit bit_as_bool;
`endif

(* SC_MODULE_EXPORT *)
module design_1_processing_system7_0_0 (
  input bit [15 : 0] GPIO_I,
  output bit [15 : 0] GPIO_O,
  output bit [15 : 0] GPIO_T,
  input bit_as_bool I2C0_SDA_I,
  output bit_as_bool I2C0_SDA_O,
  output bit_as_bool I2C0_SDA_T,
  input bit_as_bool I2C0_SCL_I,
  output bit_as_bool I2C0_SCL_O,
  output bit_as_bool I2C0_SCL_T,
  output bit_as_bool SDIO0_CLK,
  input bit_as_bool SDIO0_CLK_FB,
  output bit_as_bool SDIO0_CMD_O,
  input bit_as_bool SDIO0_CMD_I,
  output bit_as_bool SDIO0_CMD_T,
  input bit [3 : 0] SDIO0_DATA_I,
  output bit [3 : 0] SDIO0_DATA_O,
  output bit [3 : 0] SDIO0_DATA_T,
  output bit_as_bool SDIO0_LED,
  input bit_as_bool SDIO0_CDN,
  input bit_as_bool SDIO0_WP,
  output bit_as_bool SDIO0_BUSPOW,
  output bit [2 : 0] SDIO0_BUSVOLT,
  output bit_as_bool UART0_DTRN,
  output bit_as_bool UART0_RTSN,
  output bit_as_bool UART0_TX,
  input bit_as_bool UART0_CTSN,
  input bit_as_bool UART0_DCDN,
  input bit_as_bool UART0_DSRN,
  input bit_as_bool UART0_RIN,
  input bit_as_bool UART0_RX,
  output bit [1 : 0] USB0_PORT_INDCTL,
  output bit_as_bool USB0_VBUS_PWRSELECT,
  input bit_as_bool USB0_VBUS_PWRFAULT,
  output bit_as_bool M_AXI_GP0_ARVALID,
  output bit_as_bool M_AXI_GP0_AWVALID,
  output bit_as_bool M_AXI_GP0_BREADY,
  output bit_as_bool M_AXI_GP0_RREADY,
  output bit_as_bool M_AXI_GP0_WLAST,
  output bit_as_bool M_AXI_GP0_WVALID,
  output bit [11 : 0] M_AXI_GP0_ARID,
  output bit [11 : 0] M_AXI_GP0_AWID,
  output bit [11 : 0] M_AXI_GP0_WID,
  output bit [1 : 0] M_AXI_GP0_ARBURST,
  output bit [1 : 0] M_AXI_GP0_ARLOCK,
  output bit [2 : 0] M_AXI_GP0_ARSIZE,
  output bit [1 : 0] M_AXI_GP0_AWBURST,
  output bit [1 : 0] M_AXI_GP0_AWLOCK,
  output bit [2 : 0] M_AXI_GP0_AWSIZE,
  output bit [2 : 0] M_AXI_GP0_ARPROT,
  output bit [2 : 0] M_AXI_GP0_AWPROT,
  output bit [31 : 0] M_AXI_GP0_ARADDR,
  output bit [31 : 0] M_AXI_GP0_AWADDR,
  output bit [31 : 0] M_AXI_GP0_WDATA,
  output bit [3 : 0] M_AXI_GP0_ARCACHE,
  output bit [3 : 0] M_AXI_GP0_ARLEN,
  output bit [3 : 0] M_AXI_GP0_ARQOS,
  output bit [3 : 0] M_AXI_GP0_AWCACHE,
  output bit [3 : 0] M_AXI_GP0_AWLEN,
  output bit [3 : 0] M_AXI_GP0_AWQOS,
  output bit [3 : 0] M_AXI_GP0_WSTRB,
  input bit_as_bool M_AXI_GP0_ACLK,
  input bit_as_bool M_AXI_GP0_ARREADY,
  input bit_as_bool M_AXI_GP0_AWREADY,
  input bit_as_bool M_AXI_GP0_BVALID,
  input bit_as_bool M_AXI_GP0_RLAST,
  input bit_as_bool M_AXI_GP0_RVALID,
  input bit_as_bool M_AXI_GP0_WREADY,
  input bit [11 : 0] M_AXI_GP0_BID,
  input bit [11 : 0] M_AXI_GP0_RID,
  input bit [1 : 0] M_AXI_GP0_BRESP,
  input bit [1 : 0] M_AXI_GP0_RRESP,
  input bit [31 : 0] M_AXI_GP0_RDATA,
  output bit_as_bool S_AXI_HP1_ARREADY,
  output bit_as_bool S_AXI_HP1_AWREADY,
  output bit_as_bool S_AXI_HP1_BVALID,
  output bit_as_bool S_AXI_HP1_RLAST,
  output bit_as_bool S_AXI_HP1_RVALID,
  output bit_as_bool S_AXI_HP1_WREADY,
  output bit [1 : 0] S_AXI_HP1_BRESP,
  output bit [1 : 0] S_AXI_HP1_RRESP,
  output bit [5 : 0] S_AXI_HP1_BID,
  output bit [5 : 0] S_AXI_HP1_RID,
  output bit [63 : 0] S_AXI_HP1_RDATA,
  output bit [7 : 0] S_AXI_HP1_RCOUNT,
  output bit [7 : 0] S_AXI_HP1_WCOUNT,
  output bit [2 : 0] S_AXI_HP1_RACOUNT,
  output bit [5 : 0] S_AXI_HP1_WACOUNT,
  input bit_as_bool S_AXI_HP1_ACLK,
  input bit_as_bool S_AXI_HP1_ARVALID,
  input bit_as_bool S_AXI_HP1_AWVALID,
  input bit_as_bool S_AXI_HP1_BREADY,
  input bit_as_bool S_AXI_HP1_RDISSUECAP1_EN,
  input bit_as_bool S_AXI_HP1_RREADY,
  input bit_as_bool S_AXI_HP1_WLAST,
  input bit_as_bool S_AXI_HP1_WRISSUECAP1_EN,
  input bit_as_bool S_AXI_HP1_WVALID,
  input bit [1 : 0] S_AXI_HP1_ARBURST,
  input bit [1 : 0] S_AXI_HP1_ARLOCK,
  input bit [2 : 0] S_AXI_HP1_ARSIZE,
  input bit [1 : 0] S_AXI_HP1_AWBURST,
  input bit [1 : 0] S_AXI_HP1_AWLOCK,
  input bit [2 : 0] S_AXI_HP1_AWSIZE,
  input bit [2 : 0] S_AXI_HP1_ARPROT,
  input bit [2 : 0] S_AXI_HP1_AWPROT,
  input bit [31 : 0] S_AXI_HP1_ARADDR,
  input bit [31 : 0] S_AXI_HP1_AWADDR,
  input bit [3 : 0] S_AXI_HP1_ARCACHE,
  input bit [3 : 0] S_AXI_HP1_ARLEN,
  input bit [3 : 0] S_AXI_HP1_ARQOS,
  input bit [3 : 0] S_AXI_HP1_AWCACHE,
  input bit [3 : 0] S_AXI_HP1_AWLEN,
  input bit [3 : 0] S_AXI_HP1_AWQOS,
  input bit [5 : 0] S_AXI_HP1_ARID,
  input bit [5 : 0] S_AXI_HP1_AWID,
  input bit [5 : 0] S_AXI_HP1_WID,
  input bit [63 : 0] S_AXI_HP1_WDATA,
  input bit [7 : 0] S_AXI_HP1_WSTRB,
  output bit_as_bool FCLK_CLK0,
  output bit_as_bool FCLK_RESET0_N,
  output bit [31 : 0] MIO,
  output bit_as_bool DDR_CAS_n,
  output bit_as_bool DDR_CKE,
  output bit_as_bool DDR_Clk_n,
  output bit_as_bool DDR_Clk,
  output bit_as_bool DDR_CS_n,
  output bit_as_bool DDR_DRSTB,
  output bit_as_bool DDR_ODT,
  output bit_as_bool DDR_RAS_n,
  output bit_as_bool DDR_WEB,
  output bit [2 : 0] DDR_BankAddr,
  output bit [14 : 0] DDR_Addr,
  output bit_as_bool DDR_VRN,
  output bit_as_bool DDR_VRP,
  output bit [1 : 0] DDR_DM,
  output bit [15 : 0] DDR_DQ,
  output bit [1 : 0] DDR_DQS_n,
  output bit [1 : 0] DDR_DQS,
  output bit_as_bool PS_SRSTB,
  output bit_as_bool PS_CLK,
  output bit_as_bool PS_PORB
);
endmodule
`endif

`ifdef XCELIUM
(* XMSC_MODULE_EXPORT *)
module design_1_processing_system7_0_0 (GPIO_I,GPIO_O,GPIO_T,I2C0_SDA_I,I2C0_SDA_O,I2C0_SDA_T,I2C0_SCL_I,I2C0_SCL_O,I2C0_SCL_T,SDIO0_CLK,SDIO0_CLK_FB,SDIO0_CMD_O,SDIO0_CMD_I,SDIO0_CMD_T,SDIO0_DATA_I,SDIO0_DATA_O,SDIO0_DATA_T,SDIO0_LED,SDIO0_CDN,SDIO0_WP,SDIO0_BUSPOW,SDIO0_BUSVOLT,UART0_DTRN,UART0_RTSN,UART0_TX,UART0_CTSN,UART0_DCDN,UART0_DSRN,UART0_RIN,UART0_RX,USB0_PORT_INDCTL,USB0_VBUS_PWRSELECT,USB0_VBUS_PWRFAULT,M_AXI_GP0_ARVALID,M_AXI_GP0_AWVALID,M_AXI_GP0_BREADY,M_AXI_GP0_RREADY,M_AXI_GP0_WLAST,M_AXI_GP0_WVALID,M_AXI_GP0_ARID,M_AXI_GP0_AWID,M_AXI_GP0_WID,M_AXI_GP0_ARBURST,M_AXI_GP0_ARLOCK,M_AXI_GP0_ARSIZE,M_AXI_GP0_AWBURST,M_AXI_GP0_AWLOCK,M_AXI_GP0_AWSIZE,M_AXI_GP0_ARPROT,M_AXI_GP0_AWPROT,M_AXI_GP0_ARADDR,M_AXI_GP0_AWADDR,M_AXI_GP0_WDATA,M_AXI_GP0_ARCACHE,M_AXI_GP0_ARLEN,M_AXI_GP0_ARQOS,M_AXI_GP0_AWCACHE,M_AXI_GP0_AWLEN,M_AXI_GP0_AWQOS,M_AXI_GP0_WSTRB,M_AXI_GP0_ACLK,M_AXI_GP0_ARREADY,M_AXI_GP0_AWREADY,M_AXI_GP0_BVALID,M_AXI_GP0_RLAST,M_AXI_GP0_RVALID,M_AXI_GP0_WREADY,M_AXI_GP0_BID,M_AXI_GP0_RID,M_AXI_GP0_BRESP,M_AXI_GP0_RRESP,M_AXI_GP0_RDATA,S_AXI_HP1_ARREADY,S_AXI_HP1_AWREADY,S_AXI_HP1_BVALID,S_AXI_HP1_RLAST,S_AXI_HP1_RVALID,S_AXI_HP1_WREADY,S_AXI_HP1_BRESP,S_AXI_HP1_RRESP,S_AXI_HP1_BID,S_AXI_HP1_RID,S_AXI_HP1_RDATA,S_AXI_HP1_RCOUNT,S_AXI_HP1_WCOUNT,S_AXI_HP1_RACOUNT,S_AXI_HP1_WACOUNT,S_AXI_HP1_ACLK,S_AXI_HP1_ARVALID,S_AXI_HP1_AWVALID,S_AXI_HP1_BREADY,S_AXI_HP1_RDISSUECAP1_EN,S_AXI_HP1_RREADY,S_AXI_HP1_WLAST,S_AXI_HP1_WRISSUECAP1_EN,S_AXI_HP1_WVALID,S_AXI_HP1_ARBURST,S_AXI_HP1_ARLOCK,S_AXI_HP1_ARSIZE,S_AXI_HP1_AWBURST,S_AXI_HP1_AWLOCK,S_AXI_HP1_AWSIZE,S_AXI_HP1_ARPROT,S_AXI_HP1_AWPROT,S_AXI_HP1_ARADDR,S_AXI_HP1_AWADDR,S_AXI_HP1_ARCACHE,S_AXI_HP1_ARLEN,S_AXI_HP1_ARQOS,S_AXI_HP1_AWCACHE,S_AXI_HP1_AWLEN,S_AXI_HP1_AWQOS,S_AXI_HP1_ARID,S_AXI_HP1_AWID,S_AXI_HP1_WID,S_AXI_HP1_WDATA,S_AXI_HP1_WSTRB,FCLK_CLK0,FCLK_RESET0_N,MIO,DDR_CAS_n,DDR_CKE,DDR_Clk_n,DDR_Clk,DDR_CS_n,DDR_DRSTB,DDR_ODT,DDR_RAS_n,DDR_WEB,DDR_BankAddr,DDR_Addr,DDR_VRN,DDR_VRP,DDR_DM,DDR_DQ,DDR_DQS_n,DDR_DQS,PS_SRSTB,PS_CLK,PS_PORB)
(* integer foreign = "SystemC";
*);
  input bit [15 : 0] GPIO_I;
  output wire [15 : 0] GPIO_O;
  output wire [15 : 0] GPIO_T;
  input bit I2C0_SDA_I;
  output wire I2C0_SDA_O;
  output wire I2C0_SDA_T;
  input bit I2C0_SCL_I;
  output wire I2C0_SCL_O;
  output wire I2C0_SCL_T;
  output wire SDIO0_CLK;
  input bit SDIO0_CLK_FB;
  output wire SDIO0_CMD_O;
  input bit SDIO0_CMD_I;
  output wire SDIO0_CMD_T;
  input bit [3 : 0] SDIO0_DATA_I;
  output wire [3 : 0] SDIO0_DATA_O;
  output wire [3 : 0] SDIO0_DATA_T;
  output wire SDIO0_LED;
  input bit SDIO0_CDN;
  input bit SDIO0_WP;
  output wire SDIO0_BUSPOW;
  output wire [2 : 0] SDIO0_BUSVOLT;
  output wire UART0_DTRN;
  output wire UART0_RTSN;
  output wire UART0_TX;
  input bit UART0_CTSN;
  input bit UART0_DCDN;
  input bit UART0_DSRN;
  input bit UART0_RIN;
  input bit UART0_RX;
  output wire [1 : 0] USB0_PORT_INDCTL;
  output wire USB0_VBUS_PWRSELECT;
  input bit USB0_VBUS_PWRFAULT;
  output wire M_AXI_GP0_ARVALID;
  output wire M_AXI_GP0_AWVALID;
  output wire M_AXI_GP0_BREADY;
  output wire M_AXI_GP0_RREADY;
  output wire M_AXI_GP0_WLAST;
  output wire M_AXI_GP0_WVALID;
  output wire [11 : 0] M_AXI_GP0_ARID;
  output wire [11 : 0] M_AXI_GP0_AWID;
  output wire [11 : 0] M_AXI_GP0_WID;
  output wire [1 : 0] M_AXI_GP0_ARBURST;
  output wire [1 : 0] M_AXI_GP0_ARLOCK;
  output wire [2 : 0] M_AXI_GP0_ARSIZE;
  output wire [1 : 0] M_AXI_GP0_AWBURST;
  output wire [1 : 0] M_AXI_GP0_AWLOCK;
  output wire [2 : 0] M_AXI_GP0_AWSIZE;
  output wire [2 : 0] M_AXI_GP0_ARPROT;
  output wire [2 : 0] M_AXI_GP0_AWPROT;
  output wire [31 : 0] M_AXI_GP0_ARADDR;
  output wire [31 : 0] M_AXI_GP0_AWADDR;
  output wire [31 : 0] M_AXI_GP0_WDATA;
  output wire [3 : 0] M_AXI_GP0_ARCACHE;
  output wire [3 : 0] M_AXI_GP0_ARLEN;
  output wire [3 : 0] M_AXI_GP0_ARQOS;
  output wire [3 : 0] M_AXI_GP0_AWCACHE;
  output wire [3 : 0] M_AXI_GP0_AWLEN;
  output wire [3 : 0] M_AXI_GP0_AWQOS;
  output wire [3 : 0] M_AXI_GP0_WSTRB;
  input bit M_AXI_GP0_ACLK;
  input bit M_AXI_GP0_ARREADY;
  input bit M_AXI_GP0_AWREADY;
  input bit M_AXI_GP0_BVALID;
  input bit M_AXI_GP0_RLAST;
  input bit M_AXI_GP0_RVALID;
  input bit M_AXI_GP0_WREADY;
  input bit [11 : 0] M_AXI_GP0_BID;
  input bit [11 : 0] M_AXI_GP0_RID;
  input bit [1 : 0] M_AXI_GP0_BRESP;
  input bit [1 : 0] M_AXI_GP0_RRESP;
  input bit [31 : 0] M_AXI_GP0_RDATA;
  output wire S_AXI_HP1_ARREADY;
  output wire S_AXI_HP1_AWREADY;
  output wire S_AXI_HP1_BVALID;
  output wire S_AXI_HP1_RLAST;
  output wire S_AXI_HP1_RVALID;
  output wire S_AXI_HP1_WREADY;
  output wire [1 : 0] S_AXI_HP1_BRESP;
  output wire [1 : 0] S_AXI_HP1_RRESP;
  output wire [5 : 0] S_AXI_HP1_BID;
  output wire [5 : 0] S_AXI_HP1_RID;
  output wire [63 : 0] S_AXI_HP1_RDATA;
  output wire [7 : 0] S_AXI_HP1_RCOUNT;
  output wire [7 : 0] S_AXI_HP1_WCOUNT;
  output wire [2 : 0] S_AXI_HP1_RACOUNT;
  output wire [5 : 0] S_AXI_HP1_WACOUNT;
  input bit S_AXI_HP1_ACLK;
  input bit S_AXI_HP1_ARVALID;
  input bit S_AXI_HP1_AWVALID;
  input bit S_AXI_HP1_BREADY;
  input bit S_AXI_HP1_RDISSUECAP1_EN;
  input bit S_AXI_HP1_RREADY;
  input bit S_AXI_HP1_WLAST;
  input bit S_AXI_HP1_WRISSUECAP1_EN;
  input bit S_AXI_HP1_WVALID;
  input bit [1 : 0] S_AXI_HP1_ARBURST;
  input bit [1 : 0] S_AXI_HP1_ARLOCK;
  input bit [2 : 0] S_AXI_HP1_ARSIZE;
  input bit [1 : 0] S_AXI_HP1_AWBURST;
  input bit [1 : 0] S_AXI_HP1_AWLOCK;
  input bit [2 : 0] S_AXI_HP1_AWSIZE;
  input bit [2 : 0] S_AXI_HP1_ARPROT;
  input bit [2 : 0] S_AXI_HP1_AWPROT;
  input bit [31 : 0] S_AXI_HP1_ARADDR;
  input bit [31 : 0] S_AXI_HP1_AWADDR;
  input bit [3 : 0] S_AXI_HP1_ARCACHE;
  input bit [3 : 0] S_AXI_HP1_ARLEN;
  input bit [3 : 0] S_AXI_HP1_ARQOS;
  input bit [3 : 0] S_AXI_HP1_AWCACHE;
  input bit [3 : 0] S_AXI_HP1_AWLEN;
  input bit [3 : 0] S_AXI_HP1_AWQOS;
  input bit [5 : 0] S_AXI_HP1_ARID;
  input bit [5 : 0] S_AXI_HP1_AWID;
  input bit [5 : 0] S_AXI_HP1_WID;
  input bit [63 : 0] S_AXI_HP1_WDATA;
  input bit [7 : 0] S_AXI_HP1_WSTRB;
  output wire FCLK_CLK0;
  output wire FCLK_RESET0_N;
  inout wire [31 : 0] MIO;
  inout wire DDR_CAS_n;
  inout wire DDR_CKE;
  inout wire DDR_Clk_n;
  inout wire DDR_Clk;
  inout wire DDR_CS_n;
  inout wire DDR_DRSTB;
  inout wire DDR_ODT;
  inout wire DDR_RAS_n;
  inout wire DDR_WEB;
  inout wire [2 : 0] DDR_BankAddr;
  inout wire [14 : 0] DDR_Addr;
  inout wire DDR_VRN;
  inout wire DDR_VRP;
  inout wire [1 : 0] DDR_DM;
  inout wire [15 : 0] DDR_DQ;
  inout wire [1 : 0] DDR_DQS_n;
  inout wire [1 : 0] DDR_DQS;
  inout wire PS_SRSTB;
  inout wire PS_CLK;
  inout wire PS_PORB;
endmodule
`endif
