-makelib xcelium_lib/xilinx_vip -sv \
  "/home/use/Packages/Xilinx_v2022.2/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "/home/use/Packages/Xilinx_v2022.2/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "/home/use/Packages/Xilinx_v2022.2/Vivado/2022.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "/home/use/Packages/Xilinx_v2022.2/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "/home/use/Packages/Xilinx_v2022.2/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "/home/use/Packages/Xilinx_v2022.2/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "/home/use/Packages/Xilinx_v2022.2/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "/home/use/Packages/Xilinx_v2022.2/Vivado/2022.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "/home/use/Packages/Xilinx_v2022.2/Vivado/2022.2/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib xcelium_lib/xpm -sv \
  "/home/use/Packages/Xilinx_v2022.2/Vivado/2022.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "/home/use/Packages/Xilinx_v2022.2/Vivado/2022.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "/home/use/Packages/Xilinx_v2022.2/Vivado/2022.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/xlslice_v1_0_2 \
  "../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/11d0/hdl/xlslice_v1_0_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/Project_Q/ip/Project_Q_xlslice_0_0/sim/Project_Q_xlslice_0_0.v" \
-endlib
-makelib xcelium_lib/axi_infrastructure_v1_1_0 \
  "../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_vip_v1_1_13 -sv \
  "../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/ffc2/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/zynq_ultra_ps_e_vip_v1_0_13 -sv \
  "../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/abef/hdl/zynq_ultra_ps_e_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/Project_Q/ip/Project_Q_zynq_ultra_ps_e_0_0/sim/Project_Q_zynq_ultra_ps_e_0_0_vip_wrapper.v" \
  "../../../bd/Project_Q/ip/Project_Q_clk_wiz_0_0/Project_Q_clk_wiz_0_0_clk_wiz.v" \
  "../../../bd/Project_Q/ip/Project_Q_clk_wiz_0_0/Project_Q_clk_wiz_0_0.v" \
-endlib
-makelib xcelium_lib/lib_cdc_v1_0_2 \
  "../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/proc_sys_reset_v5_0_13 \
  "../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/Project_Q/ip/Project_Q_proc_sys_reset_0_0/sim/Project_Q_proc_sys_reset_0_0.vhd" \
  "../../../bd/Project_Q/ip/Project_Q_proc_sys_reset_1_0/sim/Project_Q_proc_sys_reset_1_0.vhd" \
-endlib
-makelib xcelium_lib/axi_lite_ipif_v3_0_4 \
  "../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_intc_v4_1_17 \
  "../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/802b/hdl/axi_intc_v4_1_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/Project_Q/ip/Project_Q_axi_intc_0_0/sim/Project_Q_axi_intc_0_0.vhd" \
-endlib
-makelib xcelium_lib/interrupt_control_v3_1_4 \
  "../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/a040/hdl/interrupt_control_v3_1_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_gpio_v2_0_29 \
  "../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/6219/hdl/axi_gpio_v2_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/Project_Q/ip/Project_Q_axi_gpio_0_0/sim/Project_Q_axi_gpio_0_0.vhd" \
  "../../../bd/Project_Q/ip/Project_Q_axi_gpio_0_1/sim/Project_Q_axi_gpio_0_1.vhd" \
  "../../../bd/Project_Q/ip/Project_Q_axi_gpio_0_2/sim/Project_Q_axi_gpio_0_2.vhd" \
  "../../../bd/Project_Q/ip/Project_Q_axi_gpio_0_4/sim/Project_Q_axi_gpio_0_4.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/Project_Q/sim/Project_Q.v" \
-endlib
-makelib xcelium_lib/lib_pkg_v1_0_2 \
  "../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_iic_v2_1_3 \
  "../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/1439/hdl/axi_iic_v2_1_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/Project_Q/ip/Project_Q_axi_iic_0_0/sim/Project_Q_axi_iic_0_0.vhd" \
-endlib
-makelib xcelium_lib/lib_srl_fifo_v1_0_2 \
  "../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_uartlite_v2_0_31 \
  "../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/67a1/hdl/axi_uartlite_v2_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/Project_Q/ip/Project_Q_axi_uartlite_0_0/sim/Project_Q_axi_uartlite_0_0.vhd" \
  "../../../bd/Project_Q/ip/Project_Q_proc_sys_reset_2_0/sim/Project_Q_proc_sys_reset_2_0.vhd" \
-endlib
-makelib xcelium_lib/generic_baseblocks_v2_1_0 \
  "../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_register_slice_v2_1_27 \
  "../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/f0b4/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_7 \
  "../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/83df/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_7 \
  "../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/83df/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_7 \
  "../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/83df/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib xcelium_lib/axi_data_fifo_v2_1_26 \
  "../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/3111/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_crossbar_v2_1_28 \
  "../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/c40e/hdl/axi_crossbar_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/Project_Q/ip/Project_Q_xbar_1/sim/Project_Q_xbar_1.v" \
-endlib
-makelib xcelium_lib/axi_protocol_converter_v2_1_27 \
  "../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/aeb3/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/Project_Q/ip/Project_Q_auto_pc_1/sim/Project_Q_auto_pc_1.v" \
-endlib
-makelib xcelium_lib/axi_clock_converter_v2_1_26 \
  "../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/b8be/hdl/axi_clock_converter_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/Project_Q/ip/Project_Q_auto_cc_1/sim/Project_Q_auto_cc_1.v" \
  "../../../bd/Project_Q/ip/Project_Q_auto_cc_2/sim/Project_Q_auto_cc_2.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

