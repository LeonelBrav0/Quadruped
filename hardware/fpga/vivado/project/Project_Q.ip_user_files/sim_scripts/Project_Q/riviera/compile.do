vlib work
vlib riviera

vlib riviera/xilinx_vip
vlib riviera/xpm
vlib riviera/xlslice_v1_0_2
vlib riviera/xil_defaultlib
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/axi_vip_v1_1_13
vlib riviera/zynq_ultra_ps_e_vip_v1_0_13
vlib riviera/lib_cdc_v1_0_2
vlib riviera/proc_sys_reset_v5_0_13
vlib riviera/axi_lite_ipif_v3_0_4
vlib riviera/axi_intc_v4_1_17
vlib riviera/interrupt_control_v3_1_4
vlib riviera/axi_gpio_v2_0_29
vlib riviera/lib_pkg_v1_0_2
vlib riviera/axi_iic_v2_1_3
vlib riviera/lib_srl_fifo_v1_0_2
vlib riviera/axi_uartlite_v2_0_31
vlib riviera/generic_baseblocks_v2_1_0
vlib riviera/axi_register_slice_v2_1_27
vlib riviera/fifo_generator_v13_2_7
vlib riviera/axi_data_fifo_v2_1_26
vlib riviera/axi_crossbar_v2_1_28
vlib riviera/axi_protocol_converter_v2_1_27
vlib riviera/axi_clock_converter_v2_1_26

vmap xilinx_vip riviera/xilinx_vip
vmap xpm riviera/xpm
vmap xlslice_v1_0_2 riviera/xlslice_v1_0_2
vmap xil_defaultlib riviera/xil_defaultlib
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_13 riviera/axi_vip_v1_1_13
vmap zynq_ultra_ps_e_vip_v1_0_13 riviera/zynq_ultra_ps_e_vip_v1_0_13
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 riviera/proc_sys_reset_v5_0_13
vmap axi_lite_ipif_v3_0_4 riviera/axi_lite_ipif_v3_0_4
vmap axi_intc_v4_1_17 riviera/axi_intc_v4_1_17
vmap interrupt_control_v3_1_4 riviera/interrupt_control_v3_1_4
vmap axi_gpio_v2_0_29 riviera/axi_gpio_v2_0_29
vmap lib_pkg_v1_0_2 riviera/lib_pkg_v1_0_2
vmap axi_iic_v2_1_3 riviera/axi_iic_v2_1_3
vmap lib_srl_fifo_v1_0_2 riviera/lib_srl_fifo_v1_0_2
vmap axi_uartlite_v2_0_31 riviera/axi_uartlite_v2_0_31
vmap generic_baseblocks_v2_1_0 riviera/generic_baseblocks_v2_1_0
vmap axi_register_slice_v2_1_27 riviera/axi_register_slice_v2_1_27
vmap fifo_generator_v13_2_7 riviera/fifo_generator_v13_2_7
vmap axi_data_fifo_v2_1_26 riviera/axi_data_fifo_v2_1_26
vmap axi_crossbar_v2_1_28 riviera/axi_crossbar_v2_1_28
vmap axi_protocol_converter_v2_1_27 riviera/axi_protocol_converter_v2_1_27
vmap axi_clock_converter_v2_1_26 riviera/axi_clock_converter_v2_1_26

vlog -work xilinx_vip  -sv2k12 "+incdir+/home/use/Packages/Xilinx_v2022.2/Vivado/2022.2/data/xilinx_vip/include" \
"/home/use/Packages/Xilinx_v2022.2/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/home/use/Packages/Xilinx_v2022.2/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/home/use/Packages/Xilinx_v2022.2/Vivado/2022.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/home/use/Packages/Xilinx_v2022.2/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/home/use/Packages/Xilinx_v2022.2/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/home/use/Packages/Xilinx_v2022.2/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/home/use/Packages/Xilinx_v2022.2/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/home/use/Packages/Xilinx_v2022.2/Vivado/2022.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/home/use/Packages/Xilinx_v2022.2/Vivado/2022.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -sv2k12 "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/ec67/hdl" "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/abef/hdl" "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/7698" "+incdir+/home/use/Packages/Xilinx_v2022.2/Vivado/2022.2/data/xilinx_vip/include" \
"/home/use/Packages/Xilinx_v2022.2/Vivado/2022.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/home/use/Packages/Xilinx_v2022.2/Vivado/2022.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  \
"/home/use/Packages/Xilinx_v2022.2/Vivado/2022.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xlslice_v1_0_2  -v2k5 "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/ec67/hdl" "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/abef/hdl" "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/7698" "+incdir+/home/use/Packages/Xilinx_v2022.2/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/11d0/hdl/xlslice_v1_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/ec67/hdl" "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/abef/hdl" "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/7698" "+incdir+/home/use/Packages/Xilinx_v2022.2/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/Project_Q/ip/Project_Q_xlslice_0_0/sim/Project_Q_xlslice_0_0.v" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/ec67/hdl" "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/abef/hdl" "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/7698" "+incdir+/home/use/Packages/Xilinx_v2022.2/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_13  -sv2k12 "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/ec67/hdl" "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/abef/hdl" "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/7698" "+incdir+/home/use/Packages/Xilinx_v2022.2/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/ffc2/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work zynq_ultra_ps_e_vip_v1_0_13  -sv2k12 "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/ec67/hdl" "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/abef/hdl" "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/7698" "+incdir+/home/use/Packages/Xilinx_v2022.2/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/abef/hdl/zynq_ultra_ps_e_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/ec67/hdl" "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/abef/hdl" "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/7698" "+incdir+/home/use/Packages/Xilinx_v2022.2/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/Project_Q/ip/Project_Q_zynq_ultra_ps_e_0_0/sim/Project_Q_zynq_ultra_ps_e_0_0_vip_wrapper.v" \
"../../../bd/Project_Q/ip/Project_Q_clk_wiz_0_0/Project_Q_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/Project_Q/ip/Project_Q_clk_wiz_0_0/Project_Q_clk_wiz_0_0.v" \

vcom -work lib_cdc_v1_0_2 -93  \
"../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -93  \
"../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../bd/Project_Q/ip/Project_Q_proc_sys_reset_0_0/sim/Project_Q_proc_sys_reset_0_0.vhd" \
"../../../bd/Project_Q/ip/Project_Q_proc_sys_reset_1_0/sim/Project_Q_proc_sys_reset_1_0.vhd" \

vcom -work axi_lite_ipif_v3_0_4 -93  \
"../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work axi_intc_v4_1_17 -93  \
"../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/802b/hdl/axi_intc_v4_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../bd/Project_Q/ip/Project_Q_axi_intc_0_0/sim/Project_Q_axi_intc_0_0.vhd" \

vcom -work interrupt_control_v3_1_4 -93  \
"../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/a040/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_29 -93  \
"../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/6219/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../bd/Project_Q/ip/Project_Q_axi_gpio_0_0/sim/Project_Q_axi_gpio_0_0.vhd" \
"../../../bd/Project_Q/ip/Project_Q_axi_gpio_0_1/sim/Project_Q_axi_gpio_0_1.vhd" \
"../../../bd/Project_Q/ip/Project_Q_axi_gpio_0_2/sim/Project_Q_axi_gpio_0_2.vhd" \
"../../../bd/Project_Q/ip/Project_Q_axi_gpio_0_4/sim/Project_Q_axi_gpio_0_4.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/ec67/hdl" "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/abef/hdl" "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/7698" "+incdir+/home/use/Packages/Xilinx_v2022.2/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/Project_Q/sim/Project_Q.v" \

vcom -work lib_pkg_v1_0_2 -93  \
"../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work axi_iic_v2_1_3 -93  \
"../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/1439/hdl/axi_iic_v2_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../bd/Project_Q/ip/Project_Q_axi_iic_0_0/sim/Project_Q_axi_iic_0_0.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -93  \
"../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work axi_uartlite_v2_0_31 -93  \
"../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/67a1/hdl/axi_uartlite_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../bd/Project_Q/ip/Project_Q_axi_uartlite_0_0/sim/Project_Q_axi_uartlite_0_0.vhd" \
"../../../bd/Project_Q/ip/Project_Q_proc_sys_reset_2_0/sim/Project_Q_proc_sys_reset_2_0.vhd" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/ec67/hdl" "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/abef/hdl" "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/7698" "+incdir+/home/use/Packages/Xilinx_v2022.2/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_27  -v2k5 "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/ec67/hdl" "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/abef/hdl" "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/7698" "+incdir+/home/use/Packages/Xilinx_v2022.2/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/f0b4/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_7  -v2k5 "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/ec67/hdl" "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/abef/hdl" "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/7698" "+incdir+/home/use/Packages/Xilinx_v2022.2/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/83df/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_7 -93  \
"../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/83df/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_7  -v2k5 "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/ec67/hdl" "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/abef/hdl" "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/7698" "+incdir+/home/use/Packages/Xilinx_v2022.2/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/83df/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_26  -v2k5 "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/ec67/hdl" "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/abef/hdl" "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/7698" "+incdir+/home/use/Packages/Xilinx_v2022.2/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/3111/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_28  -v2k5 "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/ec67/hdl" "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/abef/hdl" "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/7698" "+incdir+/home/use/Packages/Xilinx_v2022.2/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/c40e/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/ec67/hdl" "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/abef/hdl" "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/7698" "+incdir+/home/use/Packages/Xilinx_v2022.2/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/Project_Q/ip/Project_Q_xbar_1/sim/Project_Q_xbar_1.v" \

vlog -work axi_protocol_converter_v2_1_27  -v2k5 "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/ec67/hdl" "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/abef/hdl" "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/7698" "+incdir+/home/use/Packages/Xilinx_v2022.2/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/aeb3/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/ec67/hdl" "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/abef/hdl" "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/7698" "+incdir+/home/use/Packages/Xilinx_v2022.2/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/Project_Q/ip/Project_Q_auto_pc_1/sim/Project_Q_auto_pc_1.v" \

vlog -work axi_clock_converter_v2_1_26  -v2k5 "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/ec67/hdl" "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/abef/hdl" "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/7698" "+incdir+/home/use/Packages/Xilinx_v2022.2/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/b8be/hdl/axi_clock_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/ec67/hdl" "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/abef/hdl" "+incdir+../../../../Project_Q.gen/sources_1/bd/Project_Q/ipshared/7698" "+incdir+/home/use/Packages/Xilinx_v2022.2/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/Project_Q/ip/Project_Q_auto_cc_1/sim/Project_Q_auto_cc_1.v" \
"../../../bd/Project_Q/ip/Project_Q_auto_cc_2/sim/Project_Q_auto_cc_2.v" \

vlog -work xil_defaultlib \
"glbl.v"

