#include "gpio_driver.h"
#include <iostream>
#include <cstdint>
#include <fcntl.h>
#include <sys/mman.h>
#include <unistd.h>
#include "mmap_utils.h"

namespace gpio_driver_ns
{
    GPIODriver::GPIODriver(int devmem_fd, int base_address, int width) : devmem(devmem_fd), base(base_address), gpio_width(width)
    {
        std::cout << "[AXI_GPIO] Mapping memory for " << std::hex << base << std::endl;
        this->mapped_base = mapMemory(devmem, base, gpio_width);
        
        data_reg_base = mapped_base;
        ctrl_reg_base = mapped_base + 1;
    }

    void GPIODriver::write_data_reg(uint32_t val)
    {
        *data_reg_base = val;
    }

    void GPIODriver::write_ctrl_reg(uint32_t val)
    {
        *ctrl_reg_base = val;
    }

    uint32_t  GPIODriver::read_data_reg()
    {
        return *data_reg_base;
    }

    uint32_t  GPIODriver::read_ctrl_reg()
    {
        return *ctrl_reg_base;
    }

    GPIODriver::~GPIODriver()
    {
        if (mapped_base)
        {
            munmap((void*)mapped_base, gpio_width);
        }
    }
}