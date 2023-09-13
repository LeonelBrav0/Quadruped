#include <iostream>
#include <unistd.h>
#include <sys/mman.h>
#include "axi_iic.h"
#include "mmap_utils.h"

namespace axi_iic_ns
{
    
    AXI_IIC::AXI_IIC(int constructor_devmem, int constructor_baseaddr): devmem(constructor_devmem), baseaddr(constructor_baseaddr)
    {
        std::cout << "[AXI_IIC] Mapping memory for  " << std::hex << baseaddr << std::endl;
        this->mapped_base = mapMemory(devmem, baseaddr, 0xFFFF);

        initialize_iic();
    }

    void AXI_IIC::bit_set(uint32_t offset, uint32_t mask)
    {
        *(this->mapped_base + offset) |= mask;
    }

    void AXI_IIC::bit_unset(uint32_t offset, uint32_t mask)
    {
        *(this->mapped_base + offset) &= ~mask;
    }

    uint32_t AXI_IIC::read_core_reg(uint32_t offset)
    {
        return *(this->mapped_base + offset);
    }

    void AXI_IIC::write_core_reg(uint32_t offset, uint32_t data)
    {
        *(this->mapped_base + offset) = data;
    }

    void AXI_IIC::print_timing_regs()
    {
        std::cout << "[AXI_IIC] TSUSTA  " << std::hex << read_core_reg(TSUSTA_OFFSET) << std::endl;
        std::cout << "[AXI_IIC] TSUSTO  " << std::hex << read_core_reg(TSUSTO_OFFSET) << std::endl;
        std::cout << "[AXI_IIC] THDSTA  " << std::hex << read_core_reg(THDSTA_OFFSET) << std::endl;
        std::cout << "[AXI_IIC] TSUDAT  " << std::hex << read_core_reg(TSUDAT_OFFSET) << std::endl;
        std::cout << "[AXI_IIC] TBUF    " << std::hex << read_core_reg(TBUF_OFFSET  ) << std::endl;  
        std::cout << "[AXI_IIC] THIGH   " << std::hex << read_core_reg(THIGH_OFFSET ) << std::endl;  
        std::cout << "[AXI_IIC] TLOW    " << std::hex << read_core_reg(TLOW_OFFSET  ) << std::endl;  
        std::cout << "[AXI_IIC] THDDAT  " << std::hex << read_core_reg(THDDAT_OFFSET) << std::endl;  
    }

    void AXI_IIC::setup_core_timing_regs(AXI_IIC_TIMING_PARAMS &params)
    {
        write_core_reg(TSUSTA_OFFSET, params.TSUSTA);
        write_core_reg(TSUSTO_OFFSET, params.TSUSTO);
        write_core_reg(THDSTA_OFFSET, params.THDSTA);
        write_core_reg(TSUDAT_OFFSET, params.TSUDAT);
        write_core_reg(TBUF_OFFSET  , params.TBUF  );
        write_core_reg(THIGH_OFFSET , params.THIGH );
        write_core_reg(TLOW_OFFSET  , params.TLOW  );
        write_core_reg(THDDAT_OFFSET, params.THDDAT);
    }

    void AXI_IIC::initialize_iic()
    {
        // Set RX_FIFO depth to max
        write_core_reg(RX_FIFO_PIRQ_OFFSET, 0x0F);
        
        // Reset TX_FIFO
        bit_set(CR_OFFSET, CR_TX_FIFO_RST);
        usleep(1000);

        // Enable AXI IIC, remote TX_FIFO_RST, disable General Call (GC)
        bit_set(CR_OFFSET, CR_EN);
        bit_unset(CR_OFFSET, CR_TX_FIFO_RST);
        bit_unset(CR_OFFSET, CR_GC_EN);
    }

    AXI_IIC::~AXI_IIC()
    {
        if (mapped_base)
        {
            munmap((void*)mapped_base, 0xFFFF);
        }
    }
}