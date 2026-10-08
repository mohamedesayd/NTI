# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "")
  file(REMOVE_RECURSE
  "/home/eldo/work/NTI/Design/Day_ten/fpga/soc_lab_2/vitis/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/include/sleep.h"
  "/home/eldo/work/NTI/Design/Day_ten/fpga/soc_lab_2/vitis/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/include/xiltimer.h"
  "/home/eldo/work/NTI/Design/Day_ten/fpga/soc_lab_2/vitis/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/include/xtimer_config.h"
  "/home/eldo/work/NTI/Design/Day_ten/fpga/soc_lab_2/vitis/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/lib/libxiltimer.a"
  )
endif()
