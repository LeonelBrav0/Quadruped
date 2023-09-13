# (C) Copyright 2020 - 2021 Xilinx, Inc.
# SPDX-License-Identifier: Apache-2.0

set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]

#Fan Speed Enable
set_property PACKAGE_PIN A12 [get_ports {fan_en_b}]
set_property IOSTANDARD LVCMOS33 [get_ports {fan_en_b}]
set_property SLEW SLOW [get_ports {fan_en_b}]
set_property DRIVE 4 [get_ports {fan_en_b}]

#PMOD

######################## PMOD 1 Upper ########################
set_property PACKAGE_PIN H12 [get_ports {pmod1_io_tri_io[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmod1_io_tri_io[0]}]

set_property PACKAGE_PIN E10 [get_ports {pmod1_io_tri_io[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmod1_io_tri_io[1]}]

set_property PACKAGE_PIN D10 [get_ports {pmod1_io_tri_io[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmod1_io_tri_io[2]}]

set_property PACKAGE_PIN C11 [get_ports {pmod1_io_tri_io[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmod1_io_tri_io[3]}]

######################## PMOD 1 Lower ########################
set_property PACKAGE_PIN B10 [get_ports {pmod1_io_tri_io[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmod1_io_tri_io[4]}]

set_property PACKAGE_PIN E12 [get_ports {pmod1_io_tri_io[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmod1_io_tri_io[5]}]

set_property PACKAGE_PIN D11 [get_ports {pmod1_io_tri_io[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmod1_io_tri_io[6]}]

set_property PACKAGE_PIN B11 [get_ports {pmod1_io_tri_io[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmod1_io_tri_io[7]}]

######################## PMOD 2 Upper ########################
set_property PACKAGE_PIN J11 [get_ports {pmod2_io_tri_io[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmod2_io_tri_io[0]}]

set_property PACKAGE_PIN J10 [get_ports {pmod2_io_tri_io[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmod2_io_tri_io[1]}]

set_property PACKAGE_PIN K13 [get_ports {pmod2_io_tri_io[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmod2_io_tri_io[2]}]

set_property PACKAGE_PIN K12 [get_ports {pmod2_io_tri_io[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmod2_io_tri_io[3]}]

######################## PMOD 2 Lower ########################
set_property PACKAGE_PIN H11 [get_ports {pmod2_io_tri_io[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmod2_io_tri_io[4]}]

set_property PACKAGE_PIN G10 [get_ports {pmod2_io_tri_io[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmod2_io_tri_io[5]}]

set_property PACKAGE_PIN F12 [get_ports {pmod2_io_tri_io[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmod2_io_tri_io[6]}]

set_property PACKAGE_PIN F11 [get_ports {pmod2_io_tri_io[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmod2_io_tri_io[7]}]

######################## PMOD 3 Upper ########################
set_property PACKAGE_PIN AE12 [get_ports {pmod3_io_tri_io[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmod3_io_tri_io[0]}]

set_property PACKAGE_PIN AF12 [get_ports {pmod3_io_tri_io[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmod3_io_tri_io[1]}]

set_property PACKAGE_PIN AG10 [get_ports {pmod3_io_tri_io[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmod3_io_tri_io[2]}]

set_property PACKAGE_PIN AH10 [get_ports {pmod3_io_tri_io[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmod3_io_tri_io[3]}]

######################## PMOD 3 Lower ########################
set_property PACKAGE_PIN AF11 [get_ports {pmod3_io_tri_io[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmod3_io_tri_io[4]}]

set_property PACKAGE_PIN AG11 [get_ports {pmod3_io_tri_io[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmod3_io_tri_io[5]}]

set_property PACKAGE_PIN AH12 [get_ports {pmod3_io_tri_io[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmod3_io_tri_io[6]}]

set_property PACKAGE_PIN AH11 [get_ports {pmod3_io_tri_io[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmod3_io_tri_io[7]}]

######################## PMOD 4 Upper ########################
set_property PACKAGE_PIN AC12 [get_ports {zynqmp_spi_ss_io}]
set_property IOSTANDARD LVCMOS33 [get_ports {zynqmp_spi_ss_io}]

set_property PACKAGE_PIN AD12 [get_ports {zynqmp_spi_sck_io}]
set_property IOSTANDARD LVCMOS33 [get_ports {zynqmp_spi_sck_io}]

set_property PACKAGE_PIN AE10 [get_ports {zynqmp_spi_io1_io}]
set_property IOSTANDARD LVCMOS33 [get_ports {zynqmp_spi_io1_io}]

set_property PACKAGE_PIN AF10 [get_ports {zynqmp_spi_io0_io}]
set_property IOSTANDARD LVCMOS33 [get_ports {zynqmp_spi_io0_io}]

######################## PMOD 4 Lower ########################
set_property PACKAGE_PIN AD11 [get_ports {zynqmp_iic_scl_io}]
set_property IOSTANDARD LVCMOS33 [get_ports {zynqmp_iic_scl_io}]

set_property PACKAGE_PIN AD10 [get_ports {zynqmp_iic_sda_io}]
set_property IOSTANDARD LVCMOS33 [get_ports {zynqmp_iic_sda_io}]

set_property PACKAGE_PIN AA11 [get_ports {zynqmp_uart_rxd}]
set_property IOSTANDARD LVCMOS33 [get_ports {zynqmp_uart_rxd}]

set_property PACKAGE_PIN AA10 [get_ports {zynqmp_uart_txd}]
set_property IOSTANDARD LVCMOS33 [get_ports {zynqmp_uart_txd}]

#RPI HEADER
######################## Raspberry Pi GPIO Header ########################
### AXI GPIO ### 
set_property PACKAGE_PIN AD15 [get_ports {rpi_gpio_tri_io[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io[0]}]

set_property PACKAGE_PIN AD14 [get_ports {rpi_gpio_tri_io[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io[1]}]

set_property PACKAGE_PIN AE15 [get_ports {rpi_gpio_tri_io[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io[2]}]

set_property PACKAGE_PIN AE14 [get_ports {rpi_gpio_tri_io[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io[3]}]

set_property PACKAGE_PIN AG14 [get_ports {rpi_gpio_tri_io[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io[4]}]

set_property PACKAGE_PIN AH14 [get_ports {rpi_gpio_tri_io[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io[5]}]

set_property PACKAGE_PIN AG13 [get_ports {rpi_gpio_tri_io[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io[6]}]

set_property PACKAGE_PIN AH13 [get_ports {rpi_gpio_tri_io[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io[7]}]

set_property PACKAGE_PIN AC14 [get_ports {rpi_gpio_tri_io[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io[8]}]

set_property PACKAGE_PIN AC13 [get_ports {rpi_gpio_tri_io[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io[9]}]

set_property PACKAGE_PIN AE13 [get_ports {rpi_gpio_tri_io[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io[10]}]

set_property PACKAGE_PIN AF13 [get_ports {rpi_gpio_tri_io[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io[11]}]

set_property PACKAGE_PIN AA13 [get_ports {rpi_gpio_tri_io[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io[12]}]

set_property PACKAGE_PIN AB13 [get_ports {rpi_gpio_tri_io[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io[13]}]

set_property PACKAGE_PIN W14 [get_ports {rpi_gpio_tri_io[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io[14]}]

set_property PACKAGE_PIN W13 [get_ports {rpi_gpio_tri_io[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io[15]}]

set_property PACKAGE_PIN AB15 [get_ports {rpi_gpio_tri_io[16]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io[16]}]

set_property PACKAGE_PIN AB14 [get_ports {rpi_gpio_tri_io[17]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io[17]}]

set_property PACKAGE_PIN Y14 [get_ports {rpi_gpio_tri_io[18]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io[18]}]

set_property PACKAGE_PIN Y13 [get_ports {rpi_gpio_tri_io[19]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io[19]}]

set_property PACKAGE_PIN W12 [get_ports {rpi_gpio_tri_io[20]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io[20]}]

set_property PACKAGE_PIN W11 [get_ports {rpi_gpio_tri_io[21]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io[21]}]

set_property PACKAGE_PIN Y12 [get_ports {rpi_gpio_tri_io[22]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io[22]}]

set_property PACKAGE_PIN AA12 [get_ports {rpi_gpio_tri_io[23]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io[23]}]

set_property PACKAGE_PIN Y9 [get_ports {rpi_gpio_tri_io[24]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io[24]}]

set_property PACKAGE_PIN AA8 [get_ports {rpi_gpio_tri_io[25]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io[25]}]

set_property PACKAGE_PIN AB10 [get_ports {rpi_gpio_tri_io[26]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io[26]}]

set_property PACKAGE_PIN AB9 [get_ports {rpi_gpio_tri_io[27]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io[27]}]

### Special Functions ###
#set_property PACKAGE_PIN AD15 [get_ports {rpi_gpio_tri_io0_id_sd}]
#set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io0_id_sd}]

#set_property PACKAGE_PIN AD14 [get_ports {rpi_gpio_tri_io1_id_sc}]
#set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io1_id_sc}]

#set_property PACKAGE_PIN AE15 [get_ports {rpi_gpio_tri_io2_sda}]
#set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io2_sda}]

#set_property PACKAGE_PIN AE14 [get_ports {rpi_gpio_tri_io3_scl}]
#set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io3_scl}]

#set_property PACKAGE_PIN AG14 [get_ports {rpi_gpio_tri_io4_gpclk0}]
#set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io4_gpclk0}]

#set_property PACKAGE_PIN AH14 [get_ports {rpi_gpio_tri_io5}]
#set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io5}]

#set_property PACKAGE_PIN AG13 [get_ports {rpi_gpio_tri_io6}]
#set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io6}]

#set_property PACKAGE_PIN AH13 [get_ports {rpi_gpio_tri_io7_ce1}]
#set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io7_ce1}]

#set_property PACKAGE_PIN AC14 [get_ports {rpi_gpio_tri_io8_ce0}]
#set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io8_ce0}]

#set_property PACKAGE_PIN AC13 [get_ports {rpi_gpio_tri_io9_miso}]
#set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io9_miso}]

#set_property PACKAGE_PIN AE13 [get_ports {rpi_gpio_tri_io10_mosi}]
#set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io10_mosi}]

#set_property PACKAGE_PIN AF13 [get_ports {rpi_gpio_tri_io11_sclk}]
#set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io11_sclk}]

#set_property PACKAGE_PIN AA13 [get_ports {rpi_gpio_tri_io12_pwm0}]
#set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io12_pwm0}]

#set_property PACKAGE_PIN AB13 [get_ports {rpi_gpio_tri_io13_pwm1}]
#set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io13_pwm1}]

#set_property PACKAGE_PIN W14 [get_ports {rpi_gpio_tri_io14_txd}]
#set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io14_txd}]

#set_property PACKAGE_PIN W13 [get_ports {rpi_gpio_tri_io15_rxd}]
#set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io15_rxd}]

#set_property PACKAGE_PIN AB15 [get_ports {rpi_gpio_tri_io16}]
#set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io16}]

#set_property PACKAGE_PIN AB14 [get_ports {rpi_gpio_tri_io17}]
#set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io17}]

#set_property PACKAGE_PIN Y14 [get_ports {rpi_gpio_tri_io18_pcm_clk}]
#set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io18_pcm_clk}]

#set_property PACKAGE_PIN Y13 [get_ports {rpi_gpio_tri_io19_pcm_fs}]
#set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io19_pcm_fs}]

#set_property PACKAGE_PIN W12 [get_ports {rpi_gpio_tri_io20_pcm_din}]
#set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io20_pcm_din}]

#set_property PACKAGE_PIN W11 [get_ports {rpi_gpio_tri_io21_pcm_dout}]
#set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io21_pcm_dout}]

#set_property PACKAGE_PIN Y12 [get_ports {rpi_gpio_tri_io22}]
#set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io22}]

#set_property PACKAGE_PIN AA12 [get_ports {rpi_gpio_tri_io23}]
#set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io23}]

#set_property PACKAGE_PIN Y9 [get_ports {rpi_gpio_tri_io24}]
#set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io24}]

#set_property PACKAGE_PIN AA8 [get_ports {rpi_gpio_tri_io25}]
#set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io25}]

#set_property PACKAGE_PIN AB10 [get_ports {rpi_gpio_tri_io26}]
#set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io26}]

#set_property PACKAGE_PIN AB9 [get_ports {rpi_gpio_tri_io27}]
#set_property IOSTANDARD LVCMOS33 [get_ports {rpi_gpio_tri_io27}]