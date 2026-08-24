## ======================================================
## 50 MHz CLOCK INPUT (CLOCK_50)
## DE10-Standard User Manual — PIN_AF14
## ======================================================
#set_location_assignment PIN_AF14 -to clk
##set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to clk
#
#
#set_global_assignment -name FAMILY "Cyclone V"
#set_global_assignment -name DEVICE "5CSXFC6D6F31C6"
#
## I/O standard
##set_global_assignment -name GLOBAL_BUFFER_INSERTION ON
#
## ======================================================
## Buttons (example)
## ======================================================
## (Change these if your signal names differ)
## SW[0] PIN_AB30
set_location_assignment PIN_AB30 -to reset
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to reset
## SW[2] PIN_AB28 
#set_location_assignment PIN_AB28 -to run
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to run
## SW[3] PIN_AC30 
#set_location_assignment PIN_AC30 -to up_down
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to up_down

# ======================================================
# Seven-segment display pin assignments

# For each segment i = 0..6 (a–g) of each HEX display
# Format: set_location_assignment PIN_<pin> -to HEXx[i]

# HEX0
set_location_assignment PIN_W17  -to out[0]
set_location_assignment PIN_V18  -to out[1]
set_location_assignment PIN_AG17 -to out[2]
set_location_assignment PIN_AG16 -to out[3]
set_location_assignment PIN_AH17 -to out[4]
set_location_assignment PIN_AG18 -to out[5]
set_location_assignment PIN_AH18 -to out[6]

if {0} {
#HEX1
set_location_assignment PIN_AF16 -to HEX1[0]
set_location_assignment PIN_V16 -to HEX1[1]
set_location_assignment PIN_AE16 -to HEX1[2]
set_location_assignment PIN_AD17 -to HEX1[3]
set_location_assignment PIN_AE18 -to HEX1[4]
set_location_assignment PIN_AE17 -to HEX1[5]
set_location_assignment PIN_V17 -to HEX1[6]

# HEX2
set_location_assignment PIN_AA21 -to HEX2[0]
set_location_assignment PIN_AB17 -to HEX2[1]
set_location_assignment PIN_AA18 -to HEX2[2]
set_location_assignment PIN_Y17 -to HEX2[3]
set_location_assignment PIN_Y18 -to HEX2[4]
set_location_assignment PIN_AF18 -to HEX2[5]
set_location_assignment PIN_W16 -to HEX2[6]

# HEX3
set_location_assignment PIN_Y19 -to HEX3[0]
set_location_assignment PIN_W19 -to HEX3[1]
set_location_assignment PIN_AD19 -to HEX3[2]
set_location_assignment PIN_AA20 -to HEX3[3]
set_location_assignment PIN_AC20 -to HEX3[4]
set_location_assignment PIN_AA19 -to HEX3[5]
set_location_assignment PIN_AD20 -to HEX3[6]

# HEX4
set_location_assignment PIN_AD21 -to HEX4[0]
set_location_assignment PIN_AG22 -to HEX4[1]
set_location_assignment PIN_AE22 -to HEX4[2]
set_location_assignment PIN_AE23 -to HEX4[3]
set_location_assignment PIN_AG23 -to HEX4[4]
set_location_assignment PIN_AF23 -to HEX4[5]
set_location_assignment PIN_AH22 -to HEX4[6]

# HEX5
set_location_assignment PIN_AF21 -to HEX5[0]
set_location_assignment PIN_AG21 -to HEX5[1]
set_location_assignment PIN_AF20 -to HEX5[2]
set_location_assignment PIN_AG20 -to HEX5[3]
set_location_assignment PIN_AE19 -to HEX5[4]
set_location_assignment PIN_AF19 -to HEX5[5]
set_location_assignment PIN_AB21 -to HEX5[6]
}

#==============================================
#switches
#==============================================
set_location_assignment PIN_AB30  -to in[0]
set_location_assignment PIN_Y27   -to in[1]
set_location_assignment PIN_AB28  -to in[2]
set_location_assignment PIN_AC30  -to in[3]
#set_location_assignment PIN_W25   -to SW[4]
#set_location_assignment PIN_V25   -to SW[5]
#set_location_assignment PIN_AC28  -to SW[6]
#set_location_assignment PIN_AD30  -to SW[7]
#set_location_assignment PIN_AC29  -to SW[8]
#set_location_assignment PIN_AA30  -to SW[9]


# Apply I/O standard to all segments
foreach hex {HEX0 HEX1 HEX2 HEX3 HEX4 HEX5} {
  foreach seg {0 1 2 3 4 5 6} {
    set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ${hex}[${seg}]
  }
}

# ======================================================
# Save/export
# ======================================================
export_assignments
puts ">>> DE10-Standard pin assignments applied!"
