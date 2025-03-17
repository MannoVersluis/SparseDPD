-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
-- Date        : Mon Mar 17 13:16:58 2025
-- Host        : Manno running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/manno/Vivado/DPD_hardware/DPD_hardware.gen/sources_1/bd/design_1/ip/design_1_main_wrapper_0/design_1_main_wrapper_0_stub.vhdl
-- Design      : design_1_main_wrapper_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z007sclg225-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_main_wrapper_0 is
  Port ( 
    s_inp_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_inp_axis_tlast : in STD_LOGIC;
    s_inp_axis_tvalid : in STD_LOGIC;
    m_out_axis_tready : in STD_LOGIC;
    s_inp_axis_tstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    clk : in STD_LOGIC;
    m_out_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_inp_axis_tready : out STD_LOGIC;
    m_out_axis_tlast : out STD_LOGIC;
    m_out_axis_tvalid : out STD_LOGIC;
    m_out_axis_tstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    resetn : in STD_LOGIC
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_main_wrapper_0 : entity is "design_1_main_wrapper_0,main_wrapper,{}";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of design_1_main_wrapper_0 : entity is "design_1_main_wrapper_0,main_wrapper,{x_ipProduct=Vivado 2024.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=main_wrapper,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,ADDR_WIDTH=1,C_AXIS_TDATA_WIDTH=32}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_main_wrapper_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_main_wrapper_0 : entity is "module_ref";
end design_1_main_wrapper_0;

architecture stub of design_1_main_wrapper_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "s_inp_axis_tdata[31:0],s_inp_axis_tlast,s_inp_axis_tvalid,m_out_axis_tready,s_inp_axis_tstrb[3:0],clk,m_out_axis_tdata[31:0],s_inp_axis_tready,m_out_axis_tlast,m_out_axis_tvalid,m_out_axis_tstrb[3:0],resetn";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of s_inp_axis_tdata : signal is "xilinx.com:interface:axis:1.0 s_inp_axis TDATA";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of s_inp_axis_tdata : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of s_inp_axis_tdata : signal is "XIL_INTERFACENAME s_inp_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 60606064, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_inp_axis_tlast : signal is "xilinx.com:interface:axis:1.0 s_inp_axis TLAST";
  attribute X_INTERFACE_INFO of s_inp_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 s_inp_axis TVALID";
  attribute X_INTERFACE_INFO of m_out_axis_tready : signal is "xilinx.com:interface:axis:1.0 m_out_axis TREADY";
  attribute X_INTERFACE_MODE of m_out_axis_tready : signal is "master";
  attribute X_INTERFACE_PARAMETER of m_out_axis_tready : signal is "XIL_INTERFACENAME m_out_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 60606064, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_inp_axis_tstrb : signal is "xilinx.com:interface:axis:1.0 s_inp_axis TSTRB";
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_MODE of clk : signal is "slave";
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_BUSIF m_out_axis:s_inp_axis, ASSOCIATED_RESET resetn, FREQ_HZ 60606064, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m_out_axis_tdata : signal is "xilinx.com:interface:axis:1.0 m_out_axis TDATA";
  attribute X_INTERFACE_INFO of s_inp_axis_tready : signal is "xilinx.com:interface:axis:1.0 s_inp_axis TREADY";
  attribute X_INTERFACE_INFO of m_out_axis_tlast : signal is "xilinx.com:interface:axis:1.0 m_out_axis TLAST";
  attribute X_INTERFACE_INFO of m_out_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 m_out_axis TVALID";
  attribute X_INTERFACE_INFO of m_out_axis_tstrb : signal is "xilinx.com:interface:axis:1.0 m_out_axis TSTRB";
  attribute X_INTERFACE_INFO of resetn : signal is "xilinx.com:signal:reset:1.0 resetn RST";
  attribute X_INTERFACE_MODE of resetn : signal is "slave";
  attribute X_INTERFACE_PARAMETER of resetn : signal is "XIL_INTERFACENAME resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of stub : architecture is "main_wrapper,Vivado 2024.2";
begin
end;
