# ------------------------------------------------------------------------------
# Top Level Simulation Script to source msim_setup.tcl
# ------------------------------------------------------------------------------
set QSYS_SIMDIR obj/default/runtime/sim
source msim_setup.tcl
# Copy generated memory initialization hex and dat file(s) to current directory
file copy -force C:/Users/seba2/Documents/quartusProjects/CPU2/software/AlarmClock1/mem_init/hdl_sim/AlarmClockHDL_ONCHIPRAM.dat ./ 
file copy -force C:/Users/seba2/Documents/quartusProjects/CPU2/software/AlarmClock1/mem_init/AlarmClockHDL_ONCHIPRAM.hex ./ 
