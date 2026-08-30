#=======================================================
# FPGA name: 5CSXFC6D6F31C6
#=======================================================

set_location_assignment PIN_AF14 -to clk_ref      ;#CLOCK_50

# ======================================================
# Switches pin assignments
# ======================================================
# Format: set_location_assignment PIN_<pin> -to your_signal_name[i]

#===========================================
#===========================================
set_location_assignment PIN_AB30 -to sw[0]
set_location_assignment PIN_Y27  -to sw[1]
set_location_assignment PIN_AB28 -to sw[2]
set_location_assignment PIN_AC30 -to sw[3]
set_location_assignment PIN_W25  -to sw[4]
set_location_assignment PIN_V25  -to sw[5]
set_location_assignment PIN_AC28 -to sw[6]
set_location_assignment PIN_AD30 -to sw[7]
set_location_assignment PIN_AC29 -to sw[8]
set_location_assignment PIN_AA30 -to sw[9]
#===========================================
#===========================================

# ======================================================
# Buttons pin assignments
# ======================================================
# Format: set_location_assignment PIN_<pin> -to your_signal_name[i]

#===========================================
#===========================================
set_location_assignment PIN_AJ4  -to rst_n
set_location_assignment PIN_AK4  -to hold
set_location_assignment PIN_AA14 -to start
#set_location_assignment PIN_AA15 -to KEY[3]
#===========================================
#===========================================

# ======================================================
# LEDs pin assignments
# ======================================================
# Format: set_location_assignment PIN_<pin> -to your_signal_name[i]

#===========================================
#===========================================
set_location_assignment PIN_AA24 -to leds[0]
set_location_assignment PIN_AB23 -to leds[1]
set_location_assignment PIN_AC23 -to leds[2]
set_location_assignment PIN_AD24 -to leds[3]
set_location_assignment PIN_AG25 -to leds[4]
set_location_assignment PIN_AF25 -to leds[5]
set_location_assignment PIN_AE24 -to leds[6]
set_location_assignment PIN_AF24 -to leds[7]
set_location_assignment PIN_AB22 -to leds[8]
set_location_assignment PIN_AC22 -to leds[9]
#===========================================
#===========================================


# ======================================================
# Seven-segment display pin assignments
#=======================================================
# For each segment i = 0..6 (a–g) of each HEX display
# Format: set_location_assignment PIN_<pin> -to your_signal_name[i]

#===========================================
#===========================================
# HEX0
set_location_assignment PIN_W17  -to sevseg0[6]
set_location_assignment PIN_V18  -to sevseg0[5]
set_location_assignment PIN_AG17 -to sevseg0[4]
set_location_assignment PIN_AG16 -to sevseg0[3]
set_location_assignment PIN_AH17 -to sevseg0[2]
set_location_assignment PIN_AG18 -to sevseg0[1]
set_location_assignment PIN_AH18 -to sevseg0[0]
#===========================================
#===========================================
# HEX1
set_location_assignment PIN_AF16 -to sevseg1[6]
set_location_assignment PIN_V16  -to sevseg1[5]
set_location_assignment PIN_AE16 -to sevseg1[4]
set_location_assignment PIN_AD17 -to sevseg1[3]
set_location_assignment PIN_AE18 -to sevseg1[2]
set_location_assignment PIN_AE17 -to sevseg1[1]
set_location_assignment PIN_V17  -to sevseg1[0]
#===========================================
#===========================================
# HEX2
set_location_assignment PIN_AA21 -to sevseg2[6]
set_location_assignment PIN_AB17 -to sevseg2[5]
set_location_assignment PIN_AA18 -to sevseg2[4]
set_location_assignment PIN_Y17  -to sevseg2[3]
set_location_assignment PIN_Y18  -to sevseg2[2]
set_location_assignment PIN_AF18 -to sevseg2[1]
set_location_assignment PIN_W16  -to sevseg2[0]
#===========================================
#===========================================
# HEX3
set_location_assignment PIN_Y19  -to sevseg3[6]
set_location_assignment PIN_W19  -to sevseg3[5]
set_location_assignment PIN_AD19 -to sevseg3[4]
set_location_assignment PIN_AA20 -to sevseg3[3]
set_location_assignment PIN_AC20 -to sevseg3[2]
set_location_assignment PIN_AA19 -to sevseg3[1]
set_location_assignment PIN_AD20 -to sevseg3[0]
#===========================================
#===========================================
# HEX4
set_location_assignment PIN_AD21 -to sevseg4[6]
set_location_assignment PIN_AG22 -to sevseg4[5]
set_location_assignment PIN_AE22 -to sevseg4[4]
set_location_assignment PIN_AE23 -to sevseg4[3]
set_location_assignment PIN_AG23 -to sevseg4[2]
set_location_assignment PIN_AF23 -to sevseg4[1]
set_location_assignment PIN_AH22 -to sevseg4[0]
#===========================================
#===========================================
# HEX5
set_location_assignment PIN_AF21 -to sevseg5[6]
set_location_assignment PIN_AG21 -to sevseg5[5]
set_location_assignment PIN_AF20 -to sevseg5[4]
set_location_assignment PIN_AG20 -to sevseg5[3]
set_location_assignment PIN_AE19 -to sevseg5[2]
set_location_assignment PIN_AF19 -to sevseg5[1]
set_location_assignment PIN_AB21 -to sevseg5[0]
#===========================================
#===========================================

# ======================================================
# Save/export
# ======================================================
export_assignments
puts ">>> DE10-Standard pin assignments applied!"
