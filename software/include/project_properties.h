#pragma once

#define PROJECT_VERSION_MAJOR 1
#define PROJECT_VERSION_MINOR 0
#define AUTHOR "Marc Francis Leonel Bravo"

// Frame properties
#define FRAME_WIDTH     480
#define FRAME_HEIGHT    640

// Depth estimation
#define BLOCK_SIZE  16



// AXI GPIO
#define AXI_GPIO_PMOD1  0x80010000
#define AXI_GPIO_PMOD2  0x80020000
#define AXI_GPIO_PMOD3  0x80030000
#define AXI_GPIO_RPI    0x80050000

// AXI IIC 

#define AXI_IIC_AS5600_TSUSTA   0x76
#define AXI_IIC_AS5600_TSUSTO   0x64
#define AXI_IIC_AS5600_THDSTA   0x64
#define AXI_IIC_AS5600_TSUDAT   0x7
#define AXI_IIC_AS5600_TBUF     0x76
#define AXI_IIC_AS5600_THIGH    0x76
#define AXI_IIC_AS5600_TLOW     0x76
#define AXI_IIC_AS5600_THDDAT   0xC

// AXI UART