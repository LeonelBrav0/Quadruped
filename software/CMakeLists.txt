cmake_minimum_required(VERSION 3.3.2)
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_VERSION 1)
set(CMAKE_SYSROOT ${MYROOT})
set(CMAKE_FIND_ROOT_PATH  ${MYROOT})
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NAVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

option(device "device <--Specify [1] x86_64 or [2] ARM" 2)

option(ARM "ZynqMP Device" OFF)
option(X86_64 "Local Machine Test" OFF)

# ARM
if (${device} EQUAL 2)
    set(CMAKE_C_COMPILER  aarch64-linux-gnu-gcc)
    set(CMAKE_CXX_COMPILER aarch64-linux-gnu-g++)

    add_definitions(-DARM)
# X86_64
elseif (${device} EQUAL 1)
    set(CMAKE_C_COMPILER  gcc)
    set(CMAKE_CXX_COMPILER g++)
    add_definitions(-DX68_64)
else ()
    message( FATAL_ERROR "Missing option: -Ddevice <--[1] x86_64 or [2] ARM" )
endif()

project(quadruped C CXX)

set(SRC
    src/main.cpp
    src/gpio_driver.cpp
    src/mmap_utils.cpp
    src/socket_server.cpp
    src/command_parser.cpp
    src/axi_iic.cpp
    src/hw_ov7670_src.cpp
    src/mat8b.c
)

add_executable(${PROJECT_NAME} ${SRC})

add_custom_target(send nc -w 3 192.168.1.228 1234 < quadruped)

target_include_directories(${PROJECT_NAME} PRIVATE ./include)
