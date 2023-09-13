#ifndef GPIO_DRIVER_H
#define GPIO_DRIVER_H

#include <string>

namespace gpio_driver_ns 
{

class GPIODriver {
private:
    int devmem;
    uint32_t gpio_width;
    uint32_t base;

    volatile uint32_t* mapped_base;
    volatile uint32_t* data_reg_base;
    volatile uint32_t* ctrl_reg_base;

public:
    GPIODriver(int, int, int);

    virtual void        write_data_reg(uint32_t);
    virtual void        write_ctrl_reg(uint32_t);
    virtual uint32_t    read_data_reg ();
    virtual uint32_t    read_ctrl_reg ();

    ~GPIODriver();
};

} // namespace gpio_driver_ns

#endif // GPIO_DRIVER_H