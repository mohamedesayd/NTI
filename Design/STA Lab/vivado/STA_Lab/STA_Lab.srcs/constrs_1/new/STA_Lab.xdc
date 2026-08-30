#========================
# =1= define clock
#========================

#====0======1.0==1.1===2.0=====2.1=======3========
create_clock -name clk -period 7.000 [get_ports clk]
#0: create clock constraint
#1: give the clock a name
#2: define clock period
#3: tells vivado which input port is the clock
set_clock_uncertainty -setup 0.200 [get_clocks clk]
set_clock_uncertainty -hold  0.100 [get_clocks clk]
#set_clock_uncertainty 0.2 [get_clock clk]
#========================================
# =2= constriants Input and Output dealys
#========================================

#======0============1=====2.0=2.1=========3=========
#set_input_delay  -clock clk -max 2.0 [get_ports data_in]
#set_input_delay  -clock clk -min 0.5 [get_ports data_in]
#0: time taken by an external device to produce data_in after the clock edge.
#1: define witch clk the input relative to.
#2: -max 2.0 => latest arrival = 2 ns => used for setup analysis.
#   -min 0.5 → earliest arrival = 0.5 ns → used for hold analysis.
#3: specifiy which prot for vivado

#======0============1=====2.0=2.1=========3=========
set_output_delay -clock clk -max 2.0 [get_ports sev_segss0]
set_output_delay -clock clk -min 0.5 [get_ports sev_segss0]
#0: time allowed for your FPGA to deliver data_out to the external device.
#1: define witch clk the input relative to.
#2: -max 2.0 => external device needs data within 2 ns => setup analysis.
#   -min 0.5 => data must remain valid for at least 0.5 ns => hold analysis.
#3: specifiy which prot for vivado
set_output_delay -clock clk -max 2.0 [get_ports sev_segss1]
set_output_delay -clock clk -min 0.5 [get_ports sev_segss1]

set_output_delay -clock clk -max 2.0 [get_ports sev_segmm0]
set_output_delay -clock clk -min 0.5 [get_ports sev_segmm0]
set_output_delay -clock clk -max 2.0 [get_ports sev_segmm1]
set_output_delay -clock clk -min 0.5 [get_ports sev_segmm1]

set_output_delay -clock clk -max 2.0 [get_ports sev_seghh0]
set_output_delay -clock clk -min 0.5 [get_ports sev_seghh0]
set_output_delay -clock clk -max 2.0 [get_ports sev_seghh1]
set_output_delay -clock clk -min 0.5 [get_ports sev_seghh1]
#========================================
# =3= Setting false paths
#========================================

#=====0========1=========2========
set_false_path -from [get_ports rst_n]
#0: Ignore timing analysis for this path because it is not a real timing-critical data path.
#   means don't perform STA from the rst input to the rest of the design.
#1: define starting end
#2: define whihc port

# Ignore paths between two unrelated clocks
# set_false_path -from [get_clocks clk_a] -to [get_clocks clk_b]
#Important: Don't use set_false_path just to hide a timing violation. 
#           Use it only when the path is functionally not required to meet normal timing.