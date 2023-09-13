######################## PMOD 1 Upper ########################
set_property PACKAGE_PIN H12 [get_ports {pmod1_tri_io[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmod1_tri_io[0]}]

set_property PACKAGE_PIN E10 [get_ports {pmod1_tri_io[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmod1_tri_io[1]}]

set_property PACKAGE_PIN D10 [get_ports {pmod1_tri_io[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmod1_tri_io[2]}]

set_property PACKAGE_PIN C11 [get_ports {pmod1_tri_io[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmod1_tri_io[3]}]

######################## PMOD 1 Lower ########################
set_property PACKAGE_PIN B10 [get_ports {pmod1_tri_io[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmod1_tri_io[4]}]

set_property PACKAGE_PIN E12 [get_ports {pmod1_tri_io[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmod1_tri_io[5]}]

set_property PACKAGE_PIN D11 [get_ports {pmod1_tri_io[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmod1_tri_io[6]}]

set_property PACKAGE_PIN B11 [get_ports {pmod1_tri_io[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmod1_tri_io[7]}]

######################## PMOD 2 Upper ########################
set_property PACKAGE_PIN J11 [get_ports {p_pmod2[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_pmod2[0]}]

set_property PACKAGE_PIN J10 [get_ports {p_pmod2[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_pmod2[1]}]

set_property PACKAGE_PIN K13 [get_ports {p_pmod2[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_pmod2[2]}]

set_property PACKAGE_PIN K12 [get_ports {p_pmod2[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_pmod2[3]}]

######################## PMOD 2 Lower ########################
set_property PACKAGE_PIN H11 [get_ports {p_pmod2[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_pmod2[4]}]

set_property PACKAGE_PIN G10 [get_ports {p_pmod2[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_pmod2[5]}]

set_property PACKAGE_PIN F12 [get_ports {p_pmod2[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_pmod2[6]}]

set_property PACKAGE_PIN F11 [get_ports {p_pmod2[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_pmod2[7]}]

######################## PMOD 3 Upper ########################
set_property PACKAGE_PIN AE12 [get_ports {p_pmod3[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_pmod3[0]}]

set_property PACKAGE_PIN AF12 [get_ports {p_pmod3[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_pmod3[1]}]

set_property PACKAGE_PIN AG10 [get_ports {p_pmod3[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_pmod3[2]}]

set_property PACKAGE_PIN AH10 [get_ports {p_pmod3[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_pmod3[3]}]

######################## PMOD 3 Lower ########################
set_property PACKAGE_PIN AF11 [get_ports {p_pmod3[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_pmod3[4]}]

set_property PACKAGE_PIN AG11 [get_ports {p_pmod3[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_pmod3[5]}]

set_property PACKAGE_PIN AH12 [get_ports {p_pmod3[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_pmod3[6]}]

set_property PACKAGE_PIN AH11 [get_ports {p_pmod3[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_pmod3[7]}]

######################## PMOD 4 Upper ########################
set_property PACKAGE_PIN AC12 [get_ports {p_pmod4[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_pmod4[0]}]

set_property PACKAGE_PIN AD12 [get_ports {p_pmod4[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_pmod4[1]}]

set_property PACKAGE_PIN AE10 [get_ports {p_pmod4[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_pmod4[2]}]

set_property PACKAGE_PIN AF10 [get_ports {p_pmod4[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_pmod4[3]}]

######################## PMOD 4 Lower ########################
set_property PACKAGE_PIN AD11 [get_ports {p_pmod4[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_pmod4[4]}]

set_property PACKAGE_PIN AD10 [get_ports {p_pmod4[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_pmod4[5]}]

set_property PACKAGE_PIN AA11 [get_ports {p_pmod4[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_pmod4[6]}]

set_property PACKAGE_PIN AA10 [get_ports {p_pmod4[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_pmod4[7]}]

######################## Raspberry Pi GPIO Header ########################
### AXI GPIO ### 
set_property PACKAGE_PIN AD15 [get_ports {p_rpi_header[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header[0]}]

set_property PACKAGE_PIN AD14 [get_ports {p_rpi_header[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header[1]}]

set_property PACKAGE_PIN AE15 [get_ports {iic_sda_io}]
set_property IOSTANDARD LVCMOS33 [get_ports {iic_sda_io}]

set_property PACKAGE_PIN AE14 [get_ports {iic_scl_io}]
set_property IOSTANDARD LVCMOS33 [get_ports {iic_scl_io}]

set_property PACKAGE_PIN AG14 [get_ports {p_rpi_header[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header[4]}]

set_property PACKAGE_PIN AH14 [get_ports {p_rpi_header[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header[5]}]

set_property PACKAGE_PIN AG13 [get_ports {p_rpi_header[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header[6]}]

set_property PACKAGE_PIN AH13 [get_ports {p_rpi_header[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header[7]}]

set_property PACKAGE_PIN AC14 [get_ports {p_rpi_header[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header[8]}]

set_property PACKAGE_PIN AC13 [get_ports {p_rpi_header[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header[9]}]

set_property PACKAGE_PIN AE13 [get_ports {p_rpi_header[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header[10]}]

set_property PACKAGE_PIN AF13 [get_ports {p_rpi_header[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header[11]}]

set_property PACKAGE_PIN AA13 [get_ports {p_rpi_header[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header[12]}]

set_property PACKAGE_PIN AB13 [get_ports {p_rpi_header[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header[13]}]

set_property PACKAGE_PIN W14 [get_ports {p_rpi_header[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header[14]}]

set_property PACKAGE_PIN W13 [get_ports {p_rpi_header[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header[15]}]

set_property PACKAGE_PIN AB15 [get_ports {p_rpi_header[16]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header[16]}]

set_property PACKAGE_PIN AB14 [get_ports {p_rpi_header[17]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header[17]}]

set_property PACKAGE_PIN Y14 [get_ports {p_rpi_header[18]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header[18]}]

set_property PACKAGE_PIN Y13 [get_ports {p_rpi_header[19]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header[19]}]

set_property PACKAGE_PIN W12 [get_ports {p_rpi_header[20]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header[20]}]

set_property PACKAGE_PIN W11 [get_ports {p_rpi_header[21]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header[21]}]

set_property PACKAGE_PIN Y12 [get_ports {p_rpi_header[22]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header[22]}]

set_property PACKAGE_PIN AA12 [get_ports {p_rpi_header[23]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header[23]}]

set_property PACKAGE_PIN Y9 [get_ports {p_rpi_header[24]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header[24]}]

set_property PACKAGE_PIN AA8 [get_ports {p_rpi_header[25]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header[25]}]

set_property PACKAGE_PIN AB10 [get_ports {p_rpi_header[26]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header[26]}]

set_property PACKAGE_PIN AB9 [get_ports {p_rpi_header[27]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header[27]}]

######################## Raspberry Pi GPIO Header ########################
### AXI GPIO ### 
set_property PACKAGE_PIN A12 [get_ports {p_fan_en_b}]
set_property IOSTANDARD LVCMOS33 [get_ports {p_fan_en_b}]


### Special Functions ###
#set_property PACKAGE_PIN AD15 [get_ports {p_rpi_header0_id_sd}]
#set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header0_id_sd}]

#set_property PACKAGE_PIN AD14 [get_ports {p_rpi_header1_id_sc}]
#set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header1_id_sc}]

#set_property PACKAGE_PIN AE15 [get_ports {p_rpi_header2_sda}]
#set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header2_sda}]

#set_property PACKAGE_PIN AE14 [get_ports {p_rpi_header3_scl}]
#set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header3_scl}]

#set_property PACKAGE_PIN AG14 [get_ports {p_rpi_header4_gpclk0}]
#set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header4_gpclk0}]

#set_property PACKAGE_PIN AH14 [get_ports {p_rpi_header5}]
#set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header5}]

#set_property PACKAGE_PIN AG13 [get_ports {p_rpi_header6}]
#set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header6}]

#set_property PACKAGE_PIN AH13 [get_ports {p_rpi_header7_ce1}]
#set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header7_ce1}]

#set_property PACKAGE_PIN AC14 [get_ports {p_rpi_header8_ce0}]
#set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header8_ce0}]

#set_property PACKAGE_PIN AC13 [get_ports {p_rpi_header9_miso}]
#set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header9_miso}]

#set_property PACKAGE_PIN AE13 [get_ports {p_rpi_header10_mosi}]
#set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header10_mosi}]

#set_property PACKAGE_PIN AF13 [get_ports {p_rpi_header11_sclk}]
#set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header11_sclk}]

#set_property PACKAGE_PIN AA13 [get_ports {p_rpi_header12_pwm0}]
#set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header12_pwm0}]

#set_property PACKAGE_PIN AB13 [get_ports {p_rpi_header13_pwm1}]
#set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header13_pwm1}]

#set_property PACKAGE_PIN W14 [get_ports {p_rpi_header14_txd}]
#set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header14_txd}]

#set_property PACKAGE_PIN W13 [get_ports {p_rpi_header15_rxd}]
#set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header15_rxd}]

#set_property PACKAGE_PIN AB15 [get_ports {p_rpi_header16}]
#set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header16}]

#set_property PACKAGE_PIN AB14 [get_ports {p_rpi_header17}]
#set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header17}]

#set_property PACKAGE_PIN Y14 [get_ports {p_rpi_header18_pcm_clk}]
#set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header18_pcm_clk}]

#set_property PACKAGE_PIN Y13 [get_ports {p_rpi_header19_pcm_fs}]
#set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header19_pcm_fs}]

#set_property PACKAGE_PIN W12 [get_ports {p_rpi_header20_pcm_din}]
#set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header20_pcm_din}]

#set_property PACKAGE_PIN W11 [get_ports {p_rpi_header21_pcm_dout}]
#set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header21_pcm_dout}]

#set_property PACKAGE_PIN Y12 [get_ports {p_rpi_header22}]
#set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header22}]

#set_property PACKAGE_PIN AA12 [get_ports {p_rpi_header23}]
#set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header23}]

#set_property PACKAGE_PIN Y9 [get_ports {p_rpi_header24}]
#set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header24}]

#set_property PACKAGE_PIN AA8 [get_ports {p_rpi_header25}]
#set_property IOSTANDARD LVCMOS33 [get_ports {p_rpi_header25}]