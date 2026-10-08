transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog  -work work +incdir+/home/eldo/work/NTI/Design/Day\ five/FPGA {/home/eldo/work/NTI/Design/Day five/FPGA/FSM.v}

