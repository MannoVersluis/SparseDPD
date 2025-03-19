# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: C:\Users\manno\Vitis\DPD_hardware\DPD_hardware_system\_ide\scripts\debugger_dpd_hardware-default.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source C:\Users\manno\Vitis\DPD_hardware\DPD_hardware_system\_ide\scripts\debugger_dpd_hardware-default.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Avnet MiniZed V1 1234-oj1A" && level==0 && jtag_device_ctx=="jsn-MiniZed V1-1234-oj1A-13723093-0"}
fpga -file C:/Users/manno/Vitis/DPD_hardware/DPD_hardware/_ide/bitstream/design_1_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw C:/Users/manno/Vitis/DPD_hardware/design_1_wrapper/export/design_1_wrapper/hw/design_1_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source C:/Users/manno/Vitis/DPD_hardware/DPD_hardware/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow C:/Users/manno/Vitis/DPD_hardware/DPD_hardware/Debug/DPD_hardware.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
