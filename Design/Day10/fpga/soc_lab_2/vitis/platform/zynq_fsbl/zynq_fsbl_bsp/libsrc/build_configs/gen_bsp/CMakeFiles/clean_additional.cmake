# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "")
  file(REMOVE_RECURSE
  "/home/eldo/work/NTI/Design/Day_ten/fpga/soc_lab_2/vitis/platform/zynq_fsbl/zynq_fsbl_bsp/include/diskio.h"
  "/home/eldo/work/NTI/Design/Day_ten/fpga/soc_lab_2/vitis/platform/zynq_fsbl/zynq_fsbl_bsp/include/ff.h"
  "/home/eldo/work/NTI/Design/Day_ten/fpga/soc_lab_2/vitis/platform/zynq_fsbl/zynq_fsbl_bsp/include/ffconf.h"
  "/home/eldo/work/NTI/Design/Day_ten/fpga/soc_lab_2/vitis/platform/zynq_fsbl/zynq_fsbl_bsp/include/sleep.h"
  "/home/eldo/work/NTI/Design/Day_ten/fpga/soc_lab_2/vitis/platform/zynq_fsbl/zynq_fsbl_bsp/include/xilffs.h"
  "/home/eldo/work/NTI/Design/Day_ten/fpga/soc_lab_2/vitis/platform/zynq_fsbl/zynq_fsbl_bsp/include/xilffs_config.h"
  "/home/eldo/work/NTI/Design/Day_ten/fpga/soc_lab_2/vitis/platform/zynq_fsbl/zynq_fsbl_bsp/include/xilrsa.h"
  "/home/eldo/work/NTI/Design/Day_ten/fpga/soc_lab_2/vitis/platform/zynq_fsbl/zynq_fsbl_bsp/include/xiltimer.h"
  "/home/eldo/work/NTI/Design/Day_ten/fpga/soc_lab_2/vitis/platform/zynq_fsbl/zynq_fsbl_bsp/include/xtimer_config.h"
  "/home/eldo/work/NTI/Design/Day_ten/fpga/soc_lab_2/vitis/platform/zynq_fsbl/zynq_fsbl_bsp/lib/libxilffs.a"
  "/home/eldo/work/NTI/Design/Day_ten/fpga/soc_lab_2/vitis/platform/zynq_fsbl/zynq_fsbl_bsp/lib/libxilrsa.a"
  "/home/eldo/work/NTI/Design/Day_ten/fpga/soc_lab_2/vitis/platform/zynq_fsbl/zynq_fsbl_bsp/lib/libxiltimer.a"
  )
endif()
