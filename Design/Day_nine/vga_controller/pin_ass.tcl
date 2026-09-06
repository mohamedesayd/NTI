#=======================================================
# FPGA name: 5CSXFC6D6F31C6
#=======================================================


# ======================================================
# Clocks
# ======================================================

set_location_assignment PIN_AF14  -to ref_clk      ;#CLOCK_50
#set_location_assignment PIN_AA16  -to       ;#CLOCK2_50
#set_location_assignment PIN_Y26   -to       ;#CLOCK3_50
#set_location_assignment PIN_K14   -to       ;#CLOCK4_50
#set_location_assignment PIN_D25   -to       ;#HPS_CLOCK1_25
#set_location_assignment PIN_F25   -to       ;#HPS_CLOCK2_25

# ======================================================
# Switches pin assignments
# ======================================================
# Format: set_location_assignment PIN_<pin> -to your_signal_name[i]

#===========================================
#===========================================
set_location_assignment PIN_AB30 -to cfg[0]
set_location_assignment PIN_Y27  -to cfg[1]
set_location_assignment PIN_AB28 -to cfg[2]
set_location_assignment PIN_AC30 -to cfg[3]
set_location_assignment PIN_W25  -to cfg[4]
set_location_assignment PIN_V25  -to cfg[5]
set_location_assignment PIN_AC28 -to cfg[6]
set_location_assignment PIN_AD30 -to cfg[7]
set_location_assignment PIN_AC29 -to cfg[8]
set_location_assignment PIN_AA30 -to cfg[9]
#===========================================
#===========================================

# ======================================================
# Buttons pin assignments
# ======================================================
# Format: set_location_assignment PIN_<pin> -to your_signal_name[i]

#===========================================
#===========================================
set_location_assignment PIN_AJ4  -to rst_n
# set_location_assignment PIN_AK4  -to KEY[1]
# set_location_assignment PIN_AA14 -to KEY[2]
# set_location_assignment PIN_AA15 -to KEY[3]
#===========================================
#===========================================

# ======================================================
# LEDs pin assignments
# ======================================================
# Format: set_location_assignment PIN_<pin> -to your_signal_name[i]

#===========================================
#===========================================
# set_location_assignment PIN_AA24 -to LEDR[0]
# set_location_assignment PIN_AB23 -to LEDR[1]
# set_location_assignment PIN_AC23 -to LEDR[2]
# set_location_assignment PIN_AD24 -to LEDR[3]
# set_location_assignment PIN_AG25 -to LEDR[4]
# set_location_assignment PIN_AF25 -to LEDR[5]
# set_location_assignment PIN_AE24 -to LEDR[6]
# set_location_assignment PIN_AF24 -to LEDR[7]
# set_location_assignment PIN_AB22 -to LEDR[8]
# set_location_assignment PIN_AC22 -to LEDR[9]
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
#set_location_assignment PIN_W17  -to HEX0[0]
#set_location_assignment PIN_V18  -to HEX0[1]
#set_location_assignment PIN_AG17 -to HEX0[2]
#set_location_assignment PIN_AG16 -to HEX0[3]
#set_location_assignment PIN_AH17 -to HEX0[4]
#set_location_assignment PIN_AG18 -to HEX0[5]
#set_location_assignment PIN_AH18 -to HEX0[6]
##===========================================
##===========================================
## HEX1
#set_location_assignment PIN_AF16 -to HEX1[0]
#set_location_assignment PIN_V16  -to HEX1[1]
#set_location_assignment PIN_AE16 -to HEX1[2]
#set_location_assignment PIN_AD17 -to HEX1[3]
#set_location_assignment PIN_AE18 -to HEX1[4]
#set_location_assignment PIN_AE17 -to HEX1[5]
#set_location_assignment PIN_V17  -to HEX1[6]
##===========================================
##===========================================
## HEX2
#set_location_assignment PIN_AA21 -to HEX2[0]
#set_location_assignment PIN_AB17 -to HEX2[1]
#set_location_assignment PIN_AA18 -to HEX2[2]
#set_location_assignment PIN_Y17  -to HEX2[3]
#set_location_assignment PIN_Y18  -to HEX2[4]
#set_location_assignment PIN_AF18 -to HEX2[5]
#set_location_assignment PIN_W16  -to HEX2[6]
##===========================================
##===========================================
## HEX3
#set_location_assignment PIN_Y19  -to HEX3[0]
#set_location_assignment PIN_W19  -to HEX3[1]
#set_location_assignment PIN_AD19 -to HEX3[2]
#set_location_assignment PIN_AA20 -to HEX3[3]
#set_location_assignment PIN_AC20 -to HEX3[4]
#set_location_assignment PIN_AA19 -to HEX3[5]
#set_location_assignment PIN_AD20 -to HEX3[6]
##===========================================
##===========================================
## HEX4
#set_location_assignment PIN_AD21 -to HEX4[0]
#set_location_assignment PIN_AG22 -to HEX4[1]
#set_location_assignment PIN_AE22 -to HEX4[2]
#set_location_assignment PIN_AE23 -to HEX4[3]
#set_location_assignment PIN_AG23 -to HEX4[4]
#set_location_assignment PIN_AF23 -to HEX4[5]
#set_location_assignment PIN_AH22 -to HEX4[6]
##===========================================
##===========================================
## HEX5
#set_location_assignment PIN_AF21 -to HEX5[0]
#set_location_assignment PIN_AG21 -to HEX5[1]
#set_location_assignment PIN_AF20 -to HEX5[2]
#set_location_assignment PIN_AG20 -to HEX5[3]
#set_location_assignment PIN_AE19 -to HEX5[4]
#set_location_assignment PIN_AF19 -to HEX5[5]
#set_location_assignment PIN_AB21 -to HEX5[6]
##===========================================
##===========================================
#
##=======================================================
##VGA
#=======================================================
#VGA Output
set_location_assignment PIN_AK29  -to  r[0] 
set_location_assignment PIN_AK28  -to  r[1] 
set_location_assignment PIN_AK27  -to  r[2] 
set_location_assignment PIN_AJ27  -to  r[3] 
set_location_assignment PIN_AH27  -to  r[4] 
set_location_assignment PIN_AF26  -to  r[5] 
set_location_assignment PIN_AG26  -to  r[6] 
set_location_assignment PIN_AJ26  -to  r[7] 
set_location_assignment PIN_AK26  -to  g[0] 
set_location_assignment PIN_AJ25  -to  g[1] 
set_location_assignment PIN_AH25  -to  g[2] 
set_location_assignment PIN_AK24  -to  g[3] 
set_location_assignment PIN_AJ24  -to  g[4] 
set_location_assignment PIN_AH24  -to  g[5] 
set_location_assignment PIN_AK23  -to  g[6] 
set_location_assignment PIN_AH23  -to  g[7] 
set_location_assignment PIN_AJ21  -to  b[0] 
set_location_assignment PIN_AJ20  -to  b[1] 
set_location_assignment PIN_AH20  -to  b[2] 
set_location_assignment PIN_AJ19  -to  b[3] 
set_location_assignment PIN_AH19  -to  b[4] 
set_location_assignment PIN_AJ17  -to  b[5] 
set_location_assignment PIN_AJ16  -to  b[6] 
set_location_assignment PIN_AK16  -to  b[7] 
set_location_assignment PIN_AK21  -to  clk    ;#VGA_CLK 
set_location_assignment PIN_AK22  -to  video_on  ;#VGA_BLANK_N
set_location_assignment PIN_AK19  -to  h_sync    ;#VGA_HS 
set_location_assignment PIN_AK18  -to  v_sync    ;#VGA_VS 
set_location_assignment PIN_AJ22  -to  vga_sync_n    ;#VGA_SYNC_N 

# ======================================================
# Save/export
# ======================================================
export_assignments
puts ">>> DE10-Standard pin assignments applied!"
