# -----------------------------------------------------------------
# minized_pin_constraints.tcl
#
# 11/19/2017 D. W. Hawkins (dwh@caltech.edu)
#
# Avnet MiniZed pin constraints file.
#
# This script creates an array of key-value pairs for each port in
# the design using standard Tcl syntax. At the end of the script,
# the array is parsed, and the key-value pairs are applied to the
# design using Vivado commands.
#
# This script is based on the Avnet MiniZed XDC file;
#
# http://zedboard.org/sites/default/files/documentations/MiniZed_Constraints_Rev1_170613.zip
#
# This script contains the pin assignments for the Programmable
# Logic (PL) portion of the design. The Processor System (PS)
# pin assignments are defined by the Zynq First Stage Bootloader
# (FSBL).
#
# The MiniZed includes an FT2232H USB-to-UART bridge with the
# A-bus connected to JTAG and the B-bus connected to the PS UART.
# The A-bus signal AD[6] = FT_PS_POR_N and AD[7] = FT_PS_SRST_N
# could be connected to the board resets, but are not by default.
# The reset push button output (MR_N) connects to the power
# management controller (PMIC). The PMIC GPIOs connect to
# pull-downs and an unpopulated header. The PMIC reset output
# (PMIC_SYS_RST_N) connects to the FPGA PS reset input (p3 [2]).
# The FPGA PS clock input connects to a 33.33MHz clock.
#
# FPGA projects need the PS system configured to generate a clock
# to the PL.
#
# -----------------------------------------------------------------
# Notes
# ------
#
# 1. 'unmanaged' constraints file
#
#    This file is a Vivado 'unmanaged' constraints file. It will
#    not be modified by Vivado and supports all Tcl constructs.
#    XDC files support very limited Tcl syntax, eg., no
#    conditional logic.
#
# 2. Pin assignments are applied during implementation
#
#    If this file is added to a project, then Tcl puts output from
#    may appear in the following log files;
#
#    hdl\boards\xilinx\avnet_minized\blinky_osc\vwork\project_1.runs\synth_1\runme.log
#    hdl\boards\xilinx\avnet_minized\blinky_osc\vwork\project_1.runs\impl_1\runme.log
#
#    The Tcl command "set_property PACKAGE_PIN ..." should only be
#    used during implementation. The command will fail if called
#    during synthesis. To restrict this file to implementation
#    only, use the set_property command to set the constraints
#    file used_in_synthesis and used_in_simulation flags to false.
#
# -----------------------------------------------------------------
# References
# ----------
#
# [1] Avnet, "MiniZed Hardware User Guide", version 1.0,
#     06/13/2017.
#
# [2] Avnet, "MiniZed Zynq Development Board Schematic",
#     revision 1.0, 06/13/2017.
#
# -----------------------------------------------------------------

# -----------------------------------------------------------------
# Constraints script message
# -----------------------------------------------------------------
#
#puts "minized_pin_constraints.tcl: Running the pin constraints file!"

# =================================================================
# Pin constraints
# =================================================================
#
# -----------------------------------------------------------------
# Unused pins
# -----------------------------------------------------------------

#set_property BITSTREAM.CONFIG.UNUSEDPIN Pulldown [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN Pullup   [current_design]
#set_property BITSTREAM.CONFIG.UNUSEDPIN Pullnone [current_design]

# -----------------------------------------------------------------
# Arduino Interface
# -----------------------------------------------------------------
#
# For details see:
# * User Guide p26 [1]
# * Schematic  p7 [2]
# * Analog input on A0 to A5 is not supported
# * Only 3.3V shields (Zynq I/O are not 5V tolerant)
# * A[5:3] are shared with a bi-color LED and a switch
#   A[3] = green LED (high = ON)
#   A[4] = red LED   (high = ON)
#   A[5] = switch
#
# Bank 35, VCCO = 3.3V (p7 [2])
set pin(arduino_a[0]) {PACKAGE_PIN = F14, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(arduino_a[1]) {PACKAGE_PIN = F13, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(arduino_a[2]) {PACKAGE_PIN = F12, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(arduino_a[3]) {PACKAGE_PIN = E13, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(arduino_a[4]) {PACKAGE_PIN = E12, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(arduino_a[5]) {PACKAGE_PIN = E11, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}

# Bank 34, VCCO = 3.3V (p7 [2])
set pin(arduino_io[0])  {PACKAGE_PIN =  R8, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(arduino_io[1])  {PACKAGE_PIN =  P8, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(arduino_io[2])  {PACKAGE_PIN =  P9, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(arduino_io[3])  {PACKAGE_PIN =  R7, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(arduino_io[4])  {PACKAGE_PIN =  N7, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(arduino_io[5])  {PACKAGE_PIN = R10, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(arduino_io[6])  {PACKAGE_PIN = P10, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(arduino_io[7])  {PACKAGE_PIN =  N8, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(arduino_io[8])  {PACKAGE_PIN =  M9, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(arduino_io[9])  {PACKAGE_PIN =  N9, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(arduino_io[10]) {PACKAGE_PIN = M10, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(arduino_io[11]) {PACKAGE_PIN = M11, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(arduino_io[12]) {PACKAGE_PIN = R11, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(arduino_io[13]) {PACKAGE_PIN = P11, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}

# -----------------------------------------------------------------
# I2C bus
# -----------------------------------------------------------------
#
# * The I2C bus also connects to the Arduino I2C interface (p7 [2])
# * I2C devices are
#   - ST Micro LIS2DS12TR accelerometer and temperature sensor (p8 [2])
#   - Dialog DA9062 power management controller
#
# Bank 35, VCCO = 3.3V (p7 [2])
set pin(i2c_scl) {PACKAGE_PIN = G15, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(i2c_sda) {PACKAGE_PIN = F15, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}

# -----------------------------------------------------------------
# Digital Microphone Input
# -----------------------------------------------------------------
#
# * ST Micro MP34DT05 Microphone Input (p7, p8 [2])
#
# Bank 34, VCCO = 3.3V (p7 [2])
set pin(audio_clk) {PACKAGE_PIN = L12, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(audio_do)  {PACKAGE_PIN = M12, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}

# ----------------------------------------------------------------------------
# Bluetooth UART
# ----------------------------------------------------------------------------
#
# * Murata 1DX Wi-Fi and Bluetooth Module (p7, p8 [2])
#
# Bank 34, VCCO = 3.3V (p7 [2])
set pin(bt_cts_n)     {PACKAGE_PIN = G12, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(bt_host_wake) {PACKAGE_PIN = H14, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(bt_reg_on)    {PACKAGE_PIN = H13, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(bt_rts_n)     {PACKAGE_PIN = H12, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(bt_rxd)       {PACKAGE_PIN = G11, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(bt_txd)       {PACKAGE_PIN = G14, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}

# ----------------------------------------------------------------------------
# WiFi SDIO
# ----------------------------------------------------------------------------
#
# * Murata 1DX Wi-Fi and Bluetooth Module (p7, p8 [2])
#
# Bank 34, VCCO = 3.3V (p7 [2])
set pin(wl_host_wake) {PACKAGE_PIN = K12, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(wl_reg_on)    {PACKAGE_PIN = K11, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(wl_sdio_clk)  {PACKAGE_PIN = J15, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(wl_sdio_cmd)  {PACKAGE_PIN = J11, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(wl_sdio_d[0]) {PACKAGE_PIN = J13, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(wl_sdio_d[1]) {PACKAGE_PIN = H11, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(wl_sdio_d[2]) {PACKAGE_PIN = K15, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(wl_sdio_d[3]) {PACKAGE_PIN = J14, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}

# ----------------------------------------------------------------------------
# Pmod #1
# ----------------------------------------------------------------------------
#
# Bank 34, VCCO = 3.3V (p7 [2])
set pin(pmod1_d_p[0]) {PACKAGE_PIN = L15, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod1_d_n[0]) {PACKAGE_PIN = M15, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
#
set pin(pmod1_d_p[1]) {PACKAGE_PIN = L14, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod1_d_n[1]) {PACKAGE_PIN = M14, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
#
set pin(pmod1_d_p[2]) {PACKAGE_PIN = K13, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod1_d_n[2]) {PACKAGE_PIN = L13, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
#
set pin(pmod1_d_p[3]) {PACKAGE_PIN = N13, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod1_d_n[3]) {PACKAGE_PIN = N14, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}

# ----------------------------------------------------------------------------
# PL Pmod #2
# ----------------------------------------------------------------------------
#
# Bank 34, VCCO = 3.3V (p7 [2])
set pin(pmod2_d_p[0]) {PACKAGE_PIN = P13, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod2_d_n[0]) {PACKAGE_PIN = P14, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
#
set pin(pmod2_d_p[1]) {PACKAGE_PIN = N11, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod2_d_n[1]) {PACKAGE_PIN = N12, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
#
set pin(pmod2_d_p[2]) {PACKAGE_PIN = P15, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod2_d_n[2]) {PACKAGE_PIN = R15, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
#
set pin(pmod2_d_p[3]) {PACKAGE_PIN = R12, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}
set pin(pmod2_d_n[3]) {PACKAGE_PIN = R13, IOSTANDARD = LVCMOS33, SLEW = SLOW, DRIVE = 8, OFFCHIP_TERM = NONE}

# =================================================================
# Vivado commands
# =================================================================
#
# Get the list of ports in the constraints
#set ports_allowed [lsort [array names pin]]
#puts "Ports allowed: $ports_allowed"

# Get the list of ports used in the design
# * use concat to add parantheses to ports with indexed names
#   eg., led_g[0] becomes {led_g[0]} which matches the
#   format in ports_allowed (otherwise list search can fail)
#set ports_used [lsort [concat [get_ports *]]]
#puts "Ports used   : $ports_used"

## Port assignments
#foreach portname $ports_used {

#	# Check the port matches an allowed port
#	# * use -exact so that square brackets are not interpreted
#	#   as a regex pattern matching command
#	# * note: using Tcl error does not stop the process
#	if {[lsearch -exact $ports_allowed $portname] == -1} {
#		puts "WARNING: '$portname' is not a recognized port name!"
#		continue
#	}

#	# Port object
#	set port [get_ports $portname]

#	# Convert the comma separated list into a Tcl list
#	set options [split $pin($portname) ,]

#	# Process each key-value pair
#	foreach option $options {

#		# Extract the key and value
#		set keyval [split $option =]
#		set key [lindex $keyval 0]
#		set val [lindex $keyval 1]

#		# Strip whitespace
#		set key [string trim $key]
#		set val [string trim $val]

#		# Generate a log message for pin assignments
#		if {[string equal $key "PACKAGE_PIN"] == 1} {
#			puts "minized_pin_constraints.tcl: $portname = $val"
#		}

#		# Execute the Vivado constraint
#		set_property $key $val $port
#	}
#}