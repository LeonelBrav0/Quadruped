//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
//Date        : Wed Sep  6 20:59:43 2023
//Host        : ubuntu running 64-bit Ubuntu 18.04.6 LTS
//Command     : generate_target Project_Q_wrapper.bd
//Design      : Project_Q_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module Project_Q_wrapper
   (fan_en_b);
  output [0:0]fan_en_b;

  wire [0:0]fan_en_b;

  Project_Q Project_Q_i
       (.fan_en_b(fan_en_b));
endmodule
