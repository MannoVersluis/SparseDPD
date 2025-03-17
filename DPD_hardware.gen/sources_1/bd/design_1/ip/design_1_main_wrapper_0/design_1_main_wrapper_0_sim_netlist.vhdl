-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
-- Date        : Mon Mar 17 13:16:58 2025
-- Host        : Manno running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/manno/Vivado/DPD_hardware/DPD_hardware.gen/sources_1/bd/design_1/ip/design_1_main_wrapper_0/design_1_main_wrapper_0_sim_netlist.vhdl
-- Design      : design_1_main_wrapper_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z007sclg225-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_main_wrapper_0_main_IO is
  port (
    Q : out STD_LOGIC_VECTOR ( 32 downto 0 );
    s_inp_axis_tready : out STD_LOGIC;
    m_out_axis_tvalid : out STD_LOGIC;
    clk : in STD_LOGIC;
    mem_write_data : in STD_LOGIC_VECTOR ( 32 downto 0 );
    s_inp_axis_tvalid : in STD_LOGIC;
    m_out_axis_tready : in STD_LOGIC;
    resetn : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_main_wrapper_0_main_IO : entity is "main_IO";
end design_1_main_wrapper_0_main_IO;

architecture STRUCTURE of design_1_main_wrapper_0_main_IO is
  signal m00_axis_tvalid_reg_i_1_n_0 : STD_LOGIC;
  signal \m00_data_reg[31]_i_1_n_0\ : STD_LOGIC;
  signal \^m_out_axis_tvalid\ : STD_LOGIC;
  signal mem_read_data_reg : STD_LOGIC_VECTOR ( 32 downto 0 );
  signal mem_read_data_reg0 : STD_LOGIC_VECTOR ( 32 downto 0 );
  signal \mem_read_data_reg[32]_i_1_n_0\ : STD_LOGIC;
  signal mem_read_data_valid_reg : STD_LOGIC;
  signal mem_read_data_valid_reg_i_1_n_0 : STD_LOGIC;
  signal mem_reg_0_1_30_33_n_2 : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal p_1_in : STD_LOGIC;
  signal rd_addr_reg : STD_LOGIC;
  signal \rd_addr_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal rd_ptr_reg : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \rd_ptr_reg[1]_i_1_n_0\ : STD_LOGIC;
  signal \rd_ptr_sync1_reg_reg_n_0_[0]\ : STD_LOGIC;
  signal rst_sync1_reg : STD_LOGIC;
  signal rst_sync1_reg_i_1_n_0 : STD_LOGIC;
  signal wr_addr_reg : STD_LOGIC;
  signal wr_ptr_next : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \wr_ptr_reg[1]_i_1_n_0\ : STD_LOGIC;
  signal \wr_ptr_reg_reg_n_0_[0]\ : STD_LOGIC;
  signal wr_ptr_sync1_reg : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal write1_out : STD_LOGIC;
  signal NLW_mem_reg_0_1_0_5_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_mem_reg_0_1_12_17_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_mem_reg_0_1_18_23_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_mem_reg_0_1_24_29_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_mem_reg_0_1_30_33_DOC_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_mem_reg_0_1_30_33_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_mem_reg_0_1_6_11_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of mem_reg_0_1_0_5 : label is "";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of mem_reg_0_1_0_5 : label is 68;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of mem_reg_0_1_0_5 : label is "design_1_main_wrapper_0/inst/main_IO/mem_reg";
  attribute RTL_RAM_STYLE : string;
  attribute RTL_RAM_STYLE of mem_reg_0_1_0_5 : label is "auto";
  attribute RTL_RAM_TYPE : string;
  attribute RTL_RAM_TYPE of mem_reg_0_1_0_5 : label is "RAM_SDP";
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of mem_reg_0_1_0_5 : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of mem_reg_0_1_0_5 : label is 1;
  attribute ram_offset : integer;
  attribute ram_offset of mem_reg_0_1_0_5 : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of mem_reg_0_1_0_5 : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of mem_reg_0_1_0_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of mem_reg_0_1_12_17 : label is "";
  attribute RTL_RAM_BITS of mem_reg_0_1_12_17 : label is 68;
  attribute RTL_RAM_NAME of mem_reg_0_1_12_17 : label is "design_1_main_wrapper_0/inst/main_IO/mem_reg";
  attribute RTL_RAM_STYLE of mem_reg_0_1_12_17 : label is "auto";
  attribute RTL_RAM_TYPE of mem_reg_0_1_12_17 : label is "RAM_SDP";
  attribute ram_addr_begin of mem_reg_0_1_12_17 : label is 0;
  attribute ram_addr_end of mem_reg_0_1_12_17 : label is 1;
  attribute ram_offset of mem_reg_0_1_12_17 : label is 0;
  attribute ram_slice_begin of mem_reg_0_1_12_17 : label is 12;
  attribute ram_slice_end of mem_reg_0_1_12_17 : label is 17;
  attribute METHODOLOGY_DRC_VIOS of mem_reg_0_1_18_23 : label is "";
  attribute RTL_RAM_BITS of mem_reg_0_1_18_23 : label is 68;
  attribute RTL_RAM_NAME of mem_reg_0_1_18_23 : label is "design_1_main_wrapper_0/inst/main_IO/mem_reg";
  attribute RTL_RAM_STYLE of mem_reg_0_1_18_23 : label is "auto";
  attribute RTL_RAM_TYPE of mem_reg_0_1_18_23 : label is "RAM_SDP";
  attribute ram_addr_begin of mem_reg_0_1_18_23 : label is 0;
  attribute ram_addr_end of mem_reg_0_1_18_23 : label is 1;
  attribute ram_offset of mem_reg_0_1_18_23 : label is 0;
  attribute ram_slice_begin of mem_reg_0_1_18_23 : label is 18;
  attribute ram_slice_end of mem_reg_0_1_18_23 : label is 23;
  attribute METHODOLOGY_DRC_VIOS of mem_reg_0_1_24_29 : label is "";
  attribute RTL_RAM_BITS of mem_reg_0_1_24_29 : label is 68;
  attribute RTL_RAM_NAME of mem_reg_0_1_24_29 : label is "design_1_main_wrapper_0/inst/main_IO/mem_reg";
  attribute RTL_RAM_STYLE of mem_reg_0_1_24_29 : label is "auto";
  attribute RTL_RAM_TYPE of mem_reg_0_1_24_29 : label is "RAM_SDP";
  attribute ram_addr_begin of mem_reg_0_1_24_29 : label is 0;
  attribute ram_addr_end of mem_reg_0_1_24_29 : label is 1;
  attribute ram_offset of mem_reg_0_1_24_29 : label is 0;
  attribute ram_slice_begin of mem_reg_0_1_24_29 : label is 24;
  attribute ram_slice_end of mem_reg_0_1_24_29 : label is 29;
  attribute METHODOLOGY_DRC_VIOS of mem_reg_0_1_30_33 : label is "";
  attribute RTL_RAM_BITS of mem_reg_0_1_30_33 : label is 68;
  attribute RTL_RAM_NAME of mem_reg_0_1_30_33 : label is "design_1_main_wrapper_0/inst/main_IO/mem_reg";
  attribute RTL_RAM_STYLE of mem_reg_0_1_30_33 : label is "auto";
  attribute RTL_RAM_TYPE of mem_reg_0_1_30_33 : label is "RAM_SDP";
  attribute ram_addr_begin of mem_reg_0_1_30_33 : label is 0;
  attribute ram_addr_end of mem_reg_0_1_30_33 : label is 1;
  attribute ram_offset of mem_reg_0_1_30_33 : label is 0;
  attribute ram_slice_begin of mem_reg_0_1_30_33 : label is 30;
  attribute ram_slice_end of mem_reg_0_1_30_33 : label is 33;
  attribute METHODOLOGY_DRC_VIOS of mem_reg_0_1_6_11 : label is "";
  attribute RTL_RAM_BITS of mem_reg_0_1_6_11 : label is 68;
  attribute RTL_RAM_NAME of mem_reg_0_1_6_11 : label is "design_1_main_wrapper_0/inst/main_IO/mem_reg";
  attribute RTL_RAM_STYLE of mem_reg_0_1_6_11 : label is "auto";
  attribute RTL_RAM_TYPE of mem_reg_0_1_6_11 : label is "RAM_SDP";
  attribute ram_addr_begin of mem_reg_0_1_6_11 : label is 0;
  attribute ram_addr_end of mem_reg_0_1_6_11 : label is 1;
  attribute ram_offset of mem_reg_0_1_6_11 : label is 0;
  attribute ram_slice_begin of mem_reg_0_1_6_11 : label is 6;
  attribute ram_slice_end of mem_reg_0_1_6_11 : label is 11;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \wr_addr_reg[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \wr_ptr_reg[1]_i_1\ : label is "soft_lutpair0";
begin
  m_out_axis_tvalid <= \^m_out_axis_tvalid\;
m00_axis_tvalid_reg_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => mem_read_data_valid_reg,
      I1 => m_out_axis_tready,
      I2 => \^m_out_axis_tvalid\,
      O => m00_axis_tvalid_reg_i_1_n_0
    );
m00_axis_tvalid_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => m00_axis_tvalid_reg_i_1_n_0,
      Q => \^m_out_axis_tvalid\,
      R => rst_sync1_reg
    );
\m00_data_reg[31]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => m_out_axis_tready,
      I1 => \^m_out_axis_tvalid\,
      O => \m00_data_reg[31]_i_1_n_0\
    );
\m00_data_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \m00_data_reg[31]_i_1_n_0\,
      D => mem_read_data_reg(0),
      Q => Q(0),
      R => '0'
    );
\m00_data_reg_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \m00_data_reg[31]_i_1_n_0\,
      D => mem_read_data_reg(10),
      Q => Q(10),
      R => '0'
    );
\m00_data_reg_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \m00_data_reg[31]_i_1_n_0\,
      D => mem_read_data_reg(11),
      Q => Q(11),
      R => '0'
    );
\m00_data_reg_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \m00_data_reg[31]_i_1_n_0\,
      D => mem_read_data_reg(12),
      Q => Q(12),
      R => '0'
    );
\m00_data_reg_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \m00_data_reg[31]_i_1_n_0\,
      D => mem_read_data_reg(13),
      Q => Q(13),
      R => '0'
    );
\m00_data_reg_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \m00_data_reg[31]_i_1_n_0\,
      D => mem_read_data_reg(14),
      Q => Q(14),
      R => '0'
    );
\m00_data_reg_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \m00_data_reg[31]_i_1_n_0\,
      D => mem_read_data_reg(15),
      Q => Q(15),
      R => '0'
    );
\m00_data_reg_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \m00_data_reg[31]_i_1_n_0\,
      D => mem_read_data_reg(16),
      Q => Q(16),
      R => '0'
    );
\m00_data_reg_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \m00_data_reg[31]_i_1_n_0\,
      D => mem_read_data_reg(17),
      Q => Q(17),
      R => '0'
    );
\m00_data_reg_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \m00_data_reg[31]_i_1_n_0\,
      D => mem_read_data_reg(18),
      Q => Q(18),
      R => '0'
    );
\m00_data_reg_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \m00_data_reg[31]_i_1_n_0\,
      D => mem_read_data_reg(19),
      Q => Q(19),
      R => '0'
    );
\m00_data_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \m00_data_reg[31]_i_1_n_0\,
      D => mem_read_data_reg(1),
      Q => Q(1),
      R => '0'
    );
\m00_data_reg_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \m00_data_reg[31]_i_1_n_0\,
      D => mem_read_data_reg(20),
      Q => Q(20),
      R => '0'
    );
\m00_data_reg_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \m00_data_reg[31]_i_1_n_0\,
      D => mem_read_data_reg(21),
      Q => Q(21),
      R => '0'
    );
\m00_data_reg_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \m00_data_reg[31]_i_1_n_0\,
      D => mem_read_data_reg(22),
      Q => Q(22),
      R => '0'
    );
\m00_data_reg_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \m00_data_reg[31]_i_1_n_0\,
      D => mem_read_data_reg(23),
      Q => Q(23),
      R => '0'
    );
\m00_data_reg_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \m00_data_reg[31]_i_1_n_0\,
      D => mem_read_data_reg(24),
      Q => Q(24),
      R => '0'
    );
\m00_data_reg_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \m00_data_reg[31]_i_1_n_0\,
      D => mem_read_data_reg(25),
      Q => Q(25),
      R => '0'
    );
\m00_data_reg_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \m00_data_reg[31]_i_1_n_0\,
      D => mem_read_data_reg(26),
      Q => Q(26),
      R => '0'
    );
\m00_data_reg_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \m00_data_reg[31]_i_1_n_0\,
      D => mem_read_data_reg(27),
      Q => Q(27),
      R => '0'
    );
\m00_data_reg_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \m00_data_reg[31]_i_1_n_0\,
      D => mem_read_data_reg(28),
      Q => Q(28),
      R => '0'
    );
\m00_data_reg_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \m00_data_reg[31]_i_1_n_0\,
      D => mem_read_data_reg(29),
      Q => Q(29),
      R => '0'
    );
\m00_data_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \m00_data_reg[31]_i_1_n_0\,
      D => mem_read_data_reg(2),
      Q => Q(2),
      R => '0'
    );
\m00_data_reg_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \m00_data_reg[31]_i_1_n_0\,
      D => mem_read_data_reg(30),
      Q => Q(30),
      R => '0'
    );
\m00_data_reg_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \m00_data_reg[31]_i_1_n_0\,
      D => mem_read_data_reg(31),
      Q => Q(31),
      R => '0'
    );
\m00_data_reg_reg[32]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \m00_data_reg[31]_i_1_n_0\,
      D => mem_read_data_reg(32),
      Q => Q(32),
      R => '0'
    );
\m00_data_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \m00_data_reg[31]_i_1_n_0\,
      D => mem_read_data_reg(3),
      Q => Q(3),
      R => '0'
    );
\m00_data_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \m00_data_reg[31]_i_1_n_0\,
      D => mem_read_data_reg(4),
      Q => Q(4),
      R => '0'
    );
\m00_data_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \m00_data_reg[31]_i_1_n_0\,
      D => mem_read_data_reg(5),
      Q => Q(5),
      R => '0'
    );
\m00_data_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \m00_data_reg[31]_i_1_n_0\,
      D => mem_read_data_reg(6),
      Q => Q(6),
      R => '0'
    );
\m00_data_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \m00_data_reg[31]_i_1_n_0\,
      D => mem_read_data_reg(7),
      Q => Q(7),
      R => '0'
    );
\m00_data_reg_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \m00_data_reg[31]_i_1_n_0\,
      D => mem_read_data_reg(8),
      Q => Q(8),
      R => '0'
    );
\m00_data_reg_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \m00_data_reg[31]_i_1_n_0\,
      D => mem_read_data_reg(9),
      Q => Q(9),
      R => '0'
    );
\mem_read_data_reg[32]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0DD0DDDDDDDD0DD0"
    )
        port map (
      I0 => mem_read_data_valid_reg,
      I1 => \m00_data_reg[31]_i_1_n_0\,
      I2 => wr_ptr_sync1_reg(1),
      I3 => rd_ptr_reg(1),
      I4 => wr_ptr_sync1_reg(0),
      I5 => rd_ptr_reg(0),
      O => \mem_read_data_reg[32]_i_1_n_0\
    );
\mem_read_data_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \mem_read_data_reg[32]_i_1_n_0\,
      D => mem_read_data_reg0(0),
      Q => mem_read_data_reg(0),
      R => '0'
    );
\mem_read_data_reg_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \mem_read_data_reg[32]_i_1_n_0\,
      D => mem_read_data_reg0(10),
      Q => mem_read_data_reg(10),
      R => '0'
    );
\mem_read_data_reg_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \mem_read_data_reg[32]_i_1_n_0\,
      D => mem_read_data_reg0(11),
      Q => mem_read_data_reg(11),
      R => '0'
    );
\mem_read_data_reg_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \mem_read_data_reg[32]_i_1_n_0\,
      D => mem_read_data_reg0(12),
      Q => mem_read_data_reg(12),
      R => '0'
    );
\mem_read_data_reg_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \mem_read_data_reg[32]_i_1_n_0\,
      D => mem_read_data_reg0(13),
      Q => mem_read_data_reg(13),
      R => '0'
    );
\mem_read_data_reg_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \mem_read_data_reg[32]_i_1_n_0\,
      D => mem_read_data_reg0(14),
      Q => mem_read_data_reg(14),
      R => '0'
    );
\mem_read_data_reg_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \mem_read_data_reg[32]_i_1_n_0\,
      D => mem_read_data_reg0(15),
      Q => mem_read_data_reg(15),
      R => '0'
    );
\mem_read_data_reg_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \mem_read_data_reg[32]_i_1_n_0\,
      D => mem_read_data_reg0(16),
      Q => mem_read_data_reg(16),
      R => '0'
    );
\mem_read_data_reg_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \mem_read_data_reg[32]_i_1_n_0\,
      D => mem_read_data_reg0(17),
      Q => mem_read_data_reg(17),
      R => '0'
    );
\mem_read_data_reg_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \mem_read_data_reg[32]_i_1_n_0\,
      D => mem_read_data_reg0(18),
      Q => mem_read_data_reg(18),
      R => '0'
    );
\mem_read_data_reg_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \mem_read_data_reg[32]_i_1_n_0\,
      D => mem_read_data_reg0(19),
      Q => mem_read_data_reg(19),
      R => '0'
    );
\mem_read_data_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \mem_read_data_reg[32]_i_1_n_0\,
      D => mem_read_data_reg0(1),
      Q => mem_read_data_reg(1),
      R => '0'
    );
\mem_read_data_reg_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \mem_read_data_reg[32]_i_1_n_0\,
      D => mem_read_data_reg0(20),
      Q => mem_read_data_reg(20),
      R => '0'
    );
\mem_read_data_reg_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \mem_read_data_reg[32]_i_1_n_0\,
      D => mem_read_data_reg0(21),
      Q => mem_read_data_reg(21),
      R => '0'
    );
\mem_read_data_reg_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \mem_read_data_reg[32]_i_1_n_0\,
      D => mem_read_data_reg0(22),
      Q => mem_read_data_reg(22),
      R => '0'
    );
\mem_read_data_reg_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \mem_read_data_reg[32]_i_1_n_0\,
      D => mem_read_data_reg0(23),
      Q => mem_read_data_reg(23),
      R => '0'
    );
\mem_read_data_reg_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \mem_read_data_reg[32]_i_1_n_0\,
      D => mem_read_data_reg0(24),
      Q => mem_read_data_reg(24),
      R => '0'
    );
\mem_read_data_reg_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \mem_read_data_reg[32]_i_1_n_0\,
      D => mem_read_data_reg0(25),
      Q => mem_read_data_reg(25),
      R => '0'
    );
\mem_read_data_reg_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \mem_read_data_reg[32]_i_1_n_0\,
      D => mem_read_data_reg0(26),
      Q => mem_read_data_reg(26),
      R => '0'
    );
\mem_read_data_reg_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \mem_read_data_reg[32]_i_1_n_0\,
      D => mem_read_data_reg0(27),
      Q => mem_read_data_reg(27),
      R => '0'
    );
\mem_read_data_reg_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \mem_read_data_reg[32]_i_1_n_0\,
      D => mem_read_data_reg0(28),
      Q => mem_read_data_reg(28),
      R => '0'
    );
\mem_read_data_reg_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \mem_read_data_reg[32]_i_1_n_0\,
      D => mem_read_data_reg0(29),
      Q => mem_read_data_reg(29),
      R => '0'
    );
\mem_read_data_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \mem_read_data_reg[32]_i_1_n_0\,
      D => mem_read_data_reg0(2),
      Q => mem_read_data_reg(2),
      R => '0'
    );
\mem_read_data_reg_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \mem_read_data_reg[32]_i_1_n_0\,
      D => mem_read_data_reg0(30),
      Q => mem_read_data_reg(30),
      R => '0'
    );
\mem_read_data_reg_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \mem_read_data_reg[32]_i_1_n_0\,
      D => mem_read_data_reg0(31),
      Q => mem_read_data_reg(31),
      R => '0'
    );
\mem_read_data_reg_reg[32]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \mem_read_data_reg[32]_i_1_n_0\,
      D => mem_read_data_reg0(32),
      Q => mem_read_data_reg(32),
      R => '0'
    );
\mem_read_data_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \mem_read_data_reg[32]_i_1_n_0\,
      D => mem_read_data_reg0(3),
      Q => mem_read_data_reg(3),
      R => '0'
    );
\mem_read_data_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \mem_read_data_reg[32]_i_1_n_0\,
      D => mem_read_data_reg0(4),
      Q => mem_read_data_reg(4),
      R => '0'
    );
\mem_read_data_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \mem_read_data_reg[32]_i_1_n_0\,
      D => mem_read_data_reg0(5),
      Q => mem_read_data_reg(5),
      R => '0'
    );
\mem_read_data_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \mem_read_data_reg[32]_i_1_n_0\,
      D => mem_read_data_reg0(6),
      Q => mem_read_data_reg(6),
      R => '0'
    );
\mem_read_data_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \mem_read_data_reg[32]_i_1_n_0\,
      D => mem_read_data_reg0(7),
      Q => mem_read_data_reg(7),
      R => '0'
    );
\mem_read_data_reg_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \mem_read_data_reg[32]_i_1_n_0\,
      D => mem_read_data_reg0(8),
      Q => mem_read_data_reg(8),
      R => '0'
    );
\mem_read_data_reg_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \mem_read_data_reg[32]_i_1_n_0\,
      D => mem_read_data_reg0(9),
      Q => mem_read_data_reg(9),
      R => '0'
    );
mem_read_data_valid_reg_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6FF6FFFF6FF66FF6"
    )
        port map (
      I0 => wr_ptr_sync1_reg(1),
      I1 => rd_ptr_reg(1),
      I2 => wr_ptr_sync1_reg(0),
      I3 => rd_ptr_reg(0),
      I4 => \m00_data_reg[31]_i_1_n_0\,
      I5 => mem_read_data_valid_reg,
      O => mem_read_data_valid_reg_i_1_n_0
    );
mem_read_data_valid_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => mem_read_data_valid_reg_i_1_n_0,
      Q => mem_read_data_valid_reg,
      R => rst_sync1_reg
    );
mem_reg_0_1_0_5: unisim.vcomponents.RAM32M
     port map (
      ADDRA(4 downto 1) => B"0000",
      ADDRA(0) => rd_addr_reg,
      ADDRB(4 downto 1) => B"0000",
      ADDRB(0) => rd_addr_reg,
      ADDRC(4 downto 1) => B"0000",
      ADDRC(0) => rd_addr_reg,
      ADDRD(4 downto 1) => B"0000",
      ADDRD(0) => wr_addr_reg,
      DIA(1 downto 0) => mem_write_data(1 downto 0),
      DIB(1 downto 0) => mem_write_data(3 downto 2),
      DIC(1 downto 0) => mem_write_data(5 downto 4),
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => mem_read_data_reg0(1 downto 0),
      DOB(1 downto 0) => mem_read_data_reg0(3 downto 2),
      DOC(1 downto 0) => mem_read_data_reg0(5 downto 4),
      DOD(1 downto 0) => NLW_mem_reg_0_1_0_5_DOD_UNCONNECTED(1 downto 0),
      WCLK => clk,
      WE => write1_out
    );
mem_reg_0_1_0_5_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA2828AA"
    )
        port map (
      I0 => s_inp_axis_tvalid,
      I1 => \rd_ptr_sync1_reg_reg_n_0_[0]\,
      I2 => \wr_ptr_reg_reg_n_0_[0]\,
      I3 => p_0_in,
      I4 => p_1_in,
      O => write1_out
    );
mem_reg_0_1_12_17: unisim.vcomponents.RAM32M
     port map (
      ADDRA(4 downto 1) => B"0000",
      ADDRA(0) => rd_addr_reg,
      ADDRB(4 downto 1) => B"0000",
      ADDRB(0) => rd_addr_reg,
      ADDRC(4 downto 1) => B"0000",
      ADDRC(0) => rd_addr_reg,
      ADDRD(4 downto 1) => B"0000",
      ADDRD(0) => wr_addr_reg,
      DIA(1 downto 0) => mem_write_data(13 downto 12),
      DIB(1 downto 0) => mem_write_data(15 downto 14),
      DIC(1 downto 0) => mem_write_data(17 downto 16),
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => mem_read_data_reg0(13 downto 12),
      DOB(1 downto 0) => mem_read_data_reg0(15 downto 14),
      DOC(1 downto 0) => mem_read_data_reg0(17 downto 16),
      DOD(1 downto 0) => NLW_mem_reg_0_1_12_17_DOD_UNCONNECTED(1 downto 0),
      WCLK => clk,
      WE => write1_out
    );
mem_reg_0_1_18_23: unisim.vcomponents.RAM32M
     port map (
      ADDRA(4 downto 1) => B"0000",
      ADDRA(0) => rd_addr_reg,
      ADDRB(4 downto 1) => B"0000",
      ADDRB(0) => rd_addr_reg,
      ADDRC(4 downto 1) => B"0000",
      ADDRC(0) => rd_addr_reg,
      ADDRD(4 downto 1) => B"0000",
      ADDRD(0) => wr_addr_reg,
      DIA(1 downto 0) => mem_write_data(19 downto 18),
      DIB(1 downto 0) => mem_write_data(21 downto 20),
      DIC(1 downto 0) => mem_write_data(23 downto 22),
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => mem_read_data_reg0(19 downto 18),
      DOB(1 downto 0) => mem_read_data_reg0(21 downto 20),
      DOC(1 downto 0) => mem_read_data_reg0(23 downto 22),
      DOD(1 downto 0) => NLW_mem_reg_0_1_18_23_DOD_UNCONNECTED(1 downto 0),
      WCLK => clk,
      WE => write1_out
    );
mem_reg_0_1_24_29: unisim.vcomponents.RAM32M
     port map (
      ADDRA(4 downto 1) => B"0000",
      ADDRA(0) => rd_addr_reg,
      ADDRB(4 downto 1) => B"0000",
      ADDRB(0) => rd_addr_reg,
      ADDRC(4 downto 1) => B"0000",
      ADDRC(0) => rd_addr_reg,
      ADDRD(4 downto 1) => B"0000",
      ADDRD(0) => wr_addr_reg,
      DIA(1 downto 0) => mem_write_data(25 downto 24),
      DIB(1 downto 0) => mem_write_data(27 downto 26),
      DIC(1 downto 0) => mem_write_data(29 downto 28),
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => mem_read_data_reg0(25 downto 24),
      DOB(1 downto 0) => mem_read_data_reg0(27 downto 26),
      DOC(1 downto 0) => mem_read_data_reg0(29 downto 28),
      DOD(1 downto 0) => NLW_mem_reg_0_1_24_29_DOD_UNCONNECTED(1 downto 0),
      WCLK => clk,
      WE => write1_out
    );
mem_reg_0_1_30_33: unisim.vcomponents.RAM32M
     port map (
      ADDRA(4 downto 1) => B"0000",
      ADDRA(0) => rd_addr_reg,
      ADDRB(4 downto 1) => B"0000",
      ADDRB(0) => rd_addr_reg,
      ADDRC(4 downto 1) => B"0000",
      ADDRC(0) => rd_addr_reg,
      ADDRD(4 downto 1) => B"0000",
      ADDRD(0) => wr_addr_reg,
      DIA(1 downto 0) => mem_write_data(31 downto 30),
      DIB(1) => '0',
      DIB(0) => mem_write_data(32),
      DIC(1 downto 0) => B"00",
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => mem_read_data_reg0(31 downto 30),
      DOB(1) => mem_reg_0_1_30_33_n_2,
      DOB(0) => mem_read_data_reg0(32),
      DOC(1 downto 0) => NLW_mem_reg_0_1_30_33_DOC_UNCONNECTED(1 downto 0),
      DOD(1 downto 0) => NLW_mem_reg_0_1_30_33_DOD_UNCONNECTED(1 downto 0),
      WCLK => clk,
      WE => write1_out
    );
mem_reg_0_1_6_11: unisim.vcomponents.RAM32M
     port map (
      ADDRA(4 downto 1) => B"0000",
      ADDRA(0) => rd_addr_reg,
      ADDRB(4 downto 1) => B"0000",
      ADDRB(0) => rd_addr_reg,
      ADDRC(4 downto 1) => B"0000",
      ADDRC(0) => rd_addr_reg,
      ADDRD(4 downto 1) => B"0000",
      ADDRD(0) => wr_addr_reg,
      DIA(1 downto 0) => mem_write_data(7 downto 6),
      DIB(1 downto 0) => mem_write_data(9 downto 8),
      DIC(1 downto 0) => mem_write_data(11 downto 10),
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => mem_read_data_reg0(7 downto 6),
      DOB(1 downto 0) => mem_read_data_reg0(9 downto 8),
      DOC(1 downto 0) => mem_read_data_reg0(11 downto 10),
      DOD(1 downto 0) => NLW_mem_reg_0_1_6_11_DOD_UNCONNECTED(1 downto 0),
      WCLK => clk,
      WE => write1_out
    );
\rd_addr_reg[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"90FF9090F600F6F6"
    )
        port map (
      I0 => wr_ptr_sync1_reg(1),
      I1 => rd_ptr_reg(1),
      I2 => wr_ptr_sync1_reg(0),
      I3 => \m00_data_reg[31]_i_1_n_0\,
      I4 => mem_read_data_valid_reg,
      I5 => rd_ptr_reg(0),
      O => \rd_addr_reg[0]_i_1_n_0\
    );
\rd_addr_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \rd_addr_reg[0]_i_1_n_0\,
      Q => rd_addr_reg,
      R => '0'
    );
\rd_ptr_reg[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D5FFD5D5A200A2A2"
    )
        port map (
      I0 => rd_ptr_reg(0),
      I1 => wr_ptr_sync1_reg(0),
      I2 => wr_ptr_sync1_reg(1),
      I3 => \m00_data_reg[31]_i_1_n_0\,
      I4 => mem_read_data_valid_reg,
      I5 => rd_ptr_reg(1),
      O => \rd_ptr_reg[1]_i_1_n_0\
    );
\rd_ptr_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \rd_addr_reg[0]_i_1_n_0\,
      Q => rd_ptr_reg(0),
      R => rst_sync1_reg
    );
\rd_ptr_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \rd_ptr_reg[1]_i_1_n_0\,
      Q => rd_ptr_reg(1),
      R => rst_sync1_reg
    );
\rd_ptr_sync1_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => rd_ptr_reg(0),
      Q => \rd_ptr_sync1_reg_reg_n_0_[0]\,
      R => rst_sync1_reg
    );
\rd_ptr_sync1_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => rd_ptr_reg(1),
      Q => p_0_in,
      R => rst_sync1_reg
    );
rst_sync1_reg_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => resetn,
      O => rst_sync1_reg_i_1_n_0
    );
rst_sync1_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => rst_sync1_reg_i_1_n_0,
      Q => rst_sync1_reg,
      R => '0'
    );
s_inp_axis_tready_INST_0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000F66F"
    )
        port map (
      I0 => \rd_ptr_sync1_reg_reg_n_0_[0]\,
      I1 => \wr_ptr_reg_reg_n_0_[0]\,
      I2 => p_0_in,
      I3 => p_1_in,
      I4 => rst_sync1_reg,
      O => s_inp_axis_tready
    );
\wr_addr_reg[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6F09F0F0"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \wr_ptr_reg_reg_n_0_[0]\,
      I3 => \rd_ptr_sync1_reg_reg_n_0_[0]\,
      I4 => s_inp_axis_tvalid,
      O => wr_ptr_next(0)
    );
\wr_addr_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => wr_ptr_next(0),
      Q => wr_addr_reg,
      R => '0'
    );
\wr_ptr_reg[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"77F70888"
    )
        port map (
      I0 => \wr_ptr_reg_reg_n_0_[0]\,
      I1 => s_inp_axis_tvalid,
      I2 => \rd_ptr_sync1_reg_reg_n_0_[0]\,
      I3 => p_0_in,
      I4 => p_1_in,
      O => \wr_ptr_reg[1]_i_1_n_0\
    );
\wr_ptr_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => wr_ptr_next(0),
      Q => \wr_ptr_reg_reg_n_0_[0]\,
      R => rst_sync1_reg
    );
\wr_ptr_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \wr_ptr_reg[1]_i_1_n_0\,
      Q => p_1_in,
      R => rst_sync1_reg
    );
\wr_ptr_sync1_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \wr_ptr_reg_reg_n_0_[0]\,
      Q => wr_ptr_sync1_reg(0),
      R => rst_sync1_reg
    );
\wr_ptr_sync1_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => p_1_in,
      Q => wr_ptr_sync1_reg(1),
      R => rst_sync1_reg
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_main_wrapper_0_main_wrapper is
  port (
    Q : out STD_LOGIC_VECTOR ( 32 downto 0 );
    s_inp_axis_tready : out STD_LOGIC;
    m_out_axis_tvalid : out STD_LOGIC;
    clk : in STD_LOGIC;
    mem_write_data : in STD_LOGIC_VECTOR ( 32 downto 0 );
    s_inp_axis_tvalid : in STD_LOGIC;
    m_out_axis_tready : in STD_LOGIC;
    resetn : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_main_wrapper_0_main_wrapper : entity is "main_wrapper";
end design_1_main_wrapper_0_main_wrapper;

architecture STRUCTURE of design_1_main_wrapper_0_main_wrapper is
begin
main_IO: entity work.design_1_main_wrapper_0_main_IO
     port map (
      Q(32 downto 0) => Q(32 downto 0),
      clk => clk,
      m_out_axis_tready => m_out_axis_tready,
      m_out_axis_tvalid => m_out_axis_tvalid,
      mem_write_data(32 downto 0) => mem_write_data(32 downto 0),
      resetn => resetn,
      s_inp_axis_tready => s_inp_axis_tready,
      s_inp_axis_tvalid => s_inp_axis_tvalid
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_main_wrapper_0 is
  port (
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_main_wrapper_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_main_wrapper_0 : entity is "design_1_main_wrapper_0,main_wrapper,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_main_wrapper_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_main_wrapper_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_main_wrapper_0 : entity is "main_wrapper,Vivado 2024.2";
end design_1_main_wrapper_0;

architecture STRUCTURE of design_1_main_wrapper_0 is
  signal \<const0>\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of clk : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_BUSIF m_out_axis:s_inp_axis, ASSOCIATED_RESET resetn, FREQ_HZ 60606064, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m_out_axis_tlast : signal is "xilinx.com:interface:axis:1.0 m_out_axis TLAST";
  attribute X_INTERFACE_INFO of m_out_axis_tready : signal is "xilinx.com:interface:axis:1.0 m_out_axis TREADY";
  attribute X_INTERFACE_MODE of m_out_axis_tready : signal is "master";
  attribute X_INTERFACE_PARAMETER of m_out_axis_tready : signal is "XIL_INTERFACENAME m_out_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 60606064, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m_out_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 m_out_axis TVALID";
  attribute X_INTERFACE_INFO of resetn : signal is "xilinx.com:signal:reset:1.0 resetn RST";
  attribute X_INTERFACE_MODE of resetn : signal is "slave";
  attribute X_INTERFACE_PARAMETER of resetn : signal is "XIL_INTERFACENAME resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_inp_axis_tlast : signal is "xilinx.com:interface:axis:1.0 s_inp_axis TLAST";
  attribute X_INTERFACE_INFO of s_inp_axis_tready : signal is "xilinx.com:interface:axis:1.0 s_inp_axis TREADY";
  attribute X_INTERFACE_INFO of s_inp_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 s_inp_axis TVALID";
  attribute X_INTERFACE_INFO of m_out_axis_tdata : signal is "xilinx.com:interface:axis:1.0 m_out_axis TDATA";
  attribute X_INTERFACE_INFO of m_out_axis_tstrb : signal is "xilinx.com:interface:axis:1.0 m_out_axis TSTRB";
  attribute X_INTERFACE_INFO of s_inp_axis_tdata : signal is "xilinx.com:interface:axis:1.0 s_inp_axis TDATA";
  attribute X_INTERFACE_MODE of s_inp_axis_tdata : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s_inp_axis_tdata : signal is "XIL_INTERFACENAME s_inp_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 60606064, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_inp_axis_tstrb : signal is "xilinx.com:interface:axis:1.0 s_inp_axis TSTRB";
begin
  m_out_axis_tstrb(3) <= \<const0>\;
  m_out_axis_tstrb(2) <= \<const0>\;
  m_out_axis_tstrb(1) <= \<const0>\;
  m_out_axis_tstrb(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.design_1_main_wrapper_0_main_wrapper
     port map (
      Q(32) => m_out_axis_tlast,
      Q(31 downto 0) => m_out_axis_tdata(31 downto 0),
      clk => clk,
      m_out_axis_tready => m_out_axis_tready,
      m_out_axis_tvalid => m_out_axis_tvalid,
      mem_write_data(32) => s_inp_axis_tlast,
      mem_write_data(31 downto 0) => s_inp_axis_tdata(31 downto 0),
      resetn => resetn,
      s_inp_axis_tready => s_inp_axis_tready,
      s_inp_axis_tvalid => s_inp_axis_tvalid
    );
end STRUCTURE;
