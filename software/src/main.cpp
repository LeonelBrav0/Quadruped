// C++ Standard Library Headers
#include <iostream>
#include <vector>
#include <cmath>
#include <map>
#include <fstream>
#include <string>
#include <sstream>
#include <cstdint>
#include <cstring>

// POSIX and System Headers
#include <fcntl.h>
#include <sys/mman.h>
#include <unistd.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

// Custom Headers
// Firmware
#include "project_properties.h"
#include "gpio_driver.h"
#include "mmap_utils.h"
#include "command_parser.h"
#include "socket_server.h"
#include "axi_iic.h"

// CModel
#include "hw_ov7670_src.h"

void print_banner()
{
    std::cout << "==================================================\n";
    std::cout << "Project Q\tVERSION [" << PROJECT_VERSION_MAJOR << "." << PROJECT_VERSION_MINOR << "]\n";
    std::cout << "Author: " << AUTHOR << '\n'; 
    std::cout << "==================================================\n";
}

int main() 
{
#ifdef ARM
    print_banner();
    std::cout << "[INFO] Opening /dev/mem\n";
    int devmem = open_devmem();
    
    std::cout << "[INFO] Initializing AXI GPIO\n";
    gpio_driver_ns::GPIODriver pmod1    (devmem, 0x80010000, 2);
    gpio_driver_ns::GPIODriver pmod2    (devmem, 0x80020000, 2);
    gpio_driver_ns::GPIODriver pmod3    (devmem, 0x80030000, 2);
    // gpio_driver_ns::GPIODriver pmod4    (devmem, 0x80040000, 2);
    gpio_driver_ns::GPIODriver rpi_gpio (devmem, 0x80050000, 2);

    std::map<std::string, gpio_driver_ns::GPIODriver*> gpioMap = {
        {"pmod1",    &pmod1},
        {"pmod2",    &pmod2},
        {"pmod3",    &pmod3},
        // {"pmod4",    &pmod4},
        {"rpi_gpio", &rpi_gpio}
    };

    for (auto& pair : gpioMap) 
    {
        std::cout << "[INFO] Found AXI GPIO device: " << pair.first << std::endl;
        pair.second->write_ctrl_reg(0x00);
    }

    std::cout << "[INFO] Initializing AXI IIC\n";
    axi_iic_ns::AXI_IIC_TIMING_PARAMS axi_iic_0_params;
    axi_iic_0_params.TSUSTA = AXI_IIC_AS5600_TSUSTA;
    axi_iic_0_params.TSUSTO = AXI_IIC_AS5600_TSUSTO;
    axi_iic_0_params.THDSTA = AXI_IIC_AS5600_THDSTA;
    axi_iic_0_params.TSUDAT = AXI_IIC_AS5600_TSUDAT;
    axi_iic_0_params.TBUF   = AXI_IIC_AS5600_TBUF  ;
    axi_iic_0_params.THIGH  = AXI_IIC_AS5600_THIGH ;
    axi_iic_0_params.TLOW   = AXI_IIC_AS5600_TLOW  ;
    axi_iic_0_params.THDDAT = AXI_IIC_AS5600_THDDAT;

    axi_iic_ns::AXI_IIC axi_iic_0 (devmem, 0x80040000);
    axi_iic_0.setup_core_timing_regs(axi_iic_0_params);
    axi_iic_0.print_timing_regs();
    

    int cmd_socket = initialize_socket_server(40);

    int new_socket;
    char buffer[1024] = {0};
    struct sockaddr_in address;
    int addrlen = sizeof(address);


    

    std::cout << "[INFO] Initialization finished. Starting main loop...\n";

    while (true) 
    {
        if ((new_socket = accept(cmd_socket, (struct sockaddr *)&address, (socklen_t*)&addrlen)) < 0) 
        {
            perror("accept");
            exit(EXIT_FAILURE);
        }

        std::cout << "[INFO] Client connected from IP: " << inet_ntoa(address.sin_addr) << " on port: " << ntohs(address.sin_port) << std::endl;

        while (true) {
            memset(buffer, 0, sizeof(buffer));
            int valread = read(new_socket, buffer, 1024);
            if (valread <= 0) 
            {
                break;
            }
            std::string input(buffer, valread);
            command_parse cmd = parse_command(input);

            if (cmd.command == "gpio_write" && gpioMap.find(cmd.args[0]) != gpioMap.end()) 
            {
                uint32_t value;
                std::istringstream(cmd.args[1]) >> std::hex >> value;
                gpioMap[cmd.args[0]]->write_data_reg(value);
            }
            else
            {
                std::string errorMsg = "Unknown command: " + cmd.command + "\n";
                std::cout << errorMsg;
                send(new_socket, errorMsg.c_str(), errorMsg.size(), 0);
            }
        }

        std::cout << "[INFO] Client disconnected." << std::endl;
        close(new_socket);
    }

    close(devmem);

#endif

#ifdef X68_64
    print_banner();
    std::cout << "[INFO] x68_64 TEST ENVIRONMENT ENABLED\n";

    // left frame
    char frame_buffer_l[FRAME_WIDTH * FRAME_HEIGHT];
    char frame_blocks_l[FRAME_HEIGHT / BLOCK_SIZE][FRAME_WIDTH / BLOCK_SIZE * BLOCK_SIZE * BLOCK_SIZE];
    hw_ov7670_src_ns::read_frame("../python-model/hex/tsukaba_l.hex", frame_buffer_l);
    hw_ov7670_src_ns::partition_into_blocks(frame_buffer_l, frame_blocks_l);

    // right frame
    char frame_buffer_r[FRAME_WIDTH * FRAME_HEIGHT];
    char frame_blocks_r[FRAME_HEIGHT / BLOCK_SIZE][FRAME_WIDTH / BLOCK_SIZE * BLOCK_SIZE * BLOCK_SIZE];
    hw_ov7670_src_ns::read_frame("../python-model/hex/tsukaba_r.hex", frame_buffer_r);
    hw_ov7670_src_ns::partition_into_blocks(frame_buffer_r, frame_blocks_r);


#endif

    return 0;
}

