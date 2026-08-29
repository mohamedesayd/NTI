#=======================================================
# FPGA name: 5CSXFC6D6F31C6
#=======================================================

# ======================================================
## Clocks
# ======================================================

#===========================================
#===========================================
set_location_assignment PIN_AF14 -to clk_fpga      ;#CLOCK_50
#set_location_assignment PIN_AA16 -to clk      ;#CLOCK2_50
#set_location_assignment PIN_Y26  -to clk      ;#CLOCK3_50
#set_location_assignment PIN_K14  -to clk      ;#CLOCK4_50
#set_location_assignment PIN_D25  -to clk      ;#HPS_CLOCK1_25
#set_location_assignment PIN_F25  -to clk      ;#HPS_CLOCK2_25
#===========================================
#===========================================

# ======================================================
# Switches pin assignments
# ======================================================
# Format: set_location_assignment PIN_<pin> -to your_signal_name[i]

#===========================================
#===========================================
#set_location_assignment PIN_AB30 -to bin[0]
#set_location_assignment PIN_Y27  -to bin[1]
#set_location_assignment PIN_AB28 -to bin[2]
#set_location_assignment PIN_AC30 -to bin[3]
#set_location_assignment PIN_W25  -to bin[4]
#set_location_assignment PIN_V25  -to bin[5]
#set_location_assignment PIN_AC28 -to bin[6]
#set_location_assignment PIN_AD30 -to bin[7]
#set_location_assignment PIN_AC29 -to SW[8]
#set_location_assignment PIN_AA30 -to SW[9]
#===========================================
#===========================================

# ======================================================
# Buttons pin assignments
# ======================================================
# Format: set_location_assignment PIN_<pin> -to your_signal_name[i]

##===========================================
##===========================================
#set_location_assignment PIN_AJ4  -to clk
set_location_assignment PIN_AK4  -to rst_n
#set_location_assignment PIN_AA14 -to KEY[2]
#set_location_assignment PIN_AA15 -to KEY[3]
##===========================================
##===========================================

# ======================================================
# LEDs pin assignments
# ======================================================
# Format: set_location_assignment PIN_<pin> -to your_signal_name[i]

#===========================================
#===========================================
#set_location_assignment PIN_AA24 -to LEDR[0]
#set_location_assignment PIN_AB23 -to LEDR[1]
#set_location_assignment PIN_AC23 -to LEDR[2]
#set_location_assignment PIN_AD24 -to LEDR[3]
#set_location_assignment PIN_AG25 -to LEDR[4]
#set_location_assignment PIN_AF25 -to LEDR[5]
#set_location_assignment PIN_AE24 -to LEDR[6]
#set_location_assignment PIN_AF24 -to LEDR[7]
#set_location_assignment PIN_AB22 -to LEDR[8]
#set_location_assignment PIN_AC22 -to LEDR[9]
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
set_location_assignment PIN_W17  -to sev_segss0[0]
set_location_assignment PIN_V18  -to sev_segss0[1]
set_location_assignment PIN_AG17 -to sev_segss0[2]
set_location_assignment PIN_AG16 -to sev_segss0[3]
set_location_assignment PIN_AH17 -to sev_segss0[4]
set_location_assignment PIN_AG18 -to sev_segss0[5]
set_location_assignment PIN_AH18 -to sev_segss0[6]
#===========================================
#===========================================
# HEX1
set_location_assignment PIN_AF16 -to sev_segss1[0]
set_location_assignment PIN_V16  -to sev_segss1[1]
set_location_assignment PIN_AE16 -to sev_segss1[2]
set_location_assignment PIN_AD17 -to sev_segss1[3]
set_location_assignment PIN_AE18 -to sev_segss1[4]
set_location_assignment PIN_AE17 -to sev_segss1[5]
set_location_assignment PIN_V17  -to sev_segss1[6]
#===========================================
#===========================================
# HEX2
set_location_assignment PIN_AA21 -to sev_segmm0[0]
set_location_assignment PIN_AB17 -to sev_segmm0[1]
set_location_assignment PIN_AA18 -to sev_segmm0[2]
set_location_assignment PIN_Y17  -to sev_segmm0[3]
set_location_assignment PIN_Y18  -to sev_segmm0[4]
set_location_assignment PIN_AF18 -to sev_segmm0[5]
set_location_assignment PIN_W16  -to sev_segmm0[6]
#===========================================
#===========================================
# HEX3
set_location_assignment PIN_Y19  -to sev_segmm1[0]
set_location_assignment PIN_W19  -to sev_segmm1[1]
set_location_assignment PIN_AD19 -to sev_segmm1[2]
set_location_assignment PIN_AA20 -to sev_segmm1[3]
set_location_assignment PIN_AC20 -to sev_segmm1[4]
set_location_assignment PIN_AA19 -to sev_segmm1[5]
set_location_assignment PIN_AD20 -to sev_segmm1[6]
#===========================================
#===========================================
# HEX4
set_location_assignment PIN_AD21 -to sev_seghh0[0]
set_location_assignment PIN_AG22 -to sev_seghh0[1]
set_location_assignment PIN_AE22 -to sev_seghh0[2]
set_location_assignment PIN_AE23 -to sev_seghh0[3]
set_location_assignment PIN_AG23 -to sev_seghh0[4]
set_location_assignment PIN_AF23 -to sev_seghh0[5]
set_location_assignment PIN_AH22 -to sev_seghh0[6]
#===========================================
#===========================================
# HEX5
set_location_assignment PIN_AF21 -to sev_seghh1[0]
set_location_assignment PIN_AG21 -to sev_seghh1[1]
set_location_assignment PIN_AF20 -to sev_seghh1[2]
set_location_assignment PIN_AG20 -to sev_seghh1[3]
set_location_assignment PIN_AE19 -to sev_seghh1[4]
set_location_assignment PIN_AF19 -to sev_seghh1[5]
set_location_assignment PIN_AB21 -to sev_seghh1[6]
#===========================================
#===========================================

# ======================================================
# Save/export
# ======================================================
export_assignments
puts ">>> DE10-Standard pin assignments applied!"
