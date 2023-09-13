#ifndef AXI_IIC_H
#define AXI_IIC_H

#include <string>

namespace axi_iic_ns
{

typedef struct AXI_IIC_TIMING_PARAMS
{
    uint32_t TSUSTA ;
    uint32_t TSUSTO ;
    uint32_t THDSTA ;
    uint32_t TSUDAT ;
    uint32_t TBUF   ;
    uint32_t THIGH  ;
    uint32_t TLOW   ;
    uint32_t THDDAT ;

} AXI_IIC_TIMING_PARAMS;

typedef struct AXI_IIC_BUF
{
    uint8_t *txbuf;
    uint8_t *rxbuf;

} AXI_IIC_BUF;

class AXI_IIC {
private:
    int devmem;
    uint32_t baseaddr;

    volatile uint32_t* mapped_base;

    // Register Space
    const uint32_t GIE_OFFSET           = 0x01C / 4;
    const uint32_t ISR_OFFSET           = 0x020 / 4;
    const uint32_t IER_OFFSET           = 0x028 / 4;
    const uint32_t SOFTR_OFFSET         = 0x040 / 4;
    const uint32_t CR_OFFSET            = 0x100 / 4;
    const uint32_t SR_OFFSET            = 0x104 / 4;
    const uint32_t TX_FIFO_OFFSET       = 0x108 / 4;
    const uint32_t RX_FIFO_OFFSET       = 0x10C / 4;
    const uint32_t ADR_OFFSET           = 0x110 / 4;
    const uint32_t TX_FIFO_OCY_OFFSET   = 0x114 / 4;
    const uint32_t RX_FIFO_OCY_OFFSET   = 0x118 / 4;
    const uint32_t TEN_ADR_OFFSET       = 0x11C / 4;
    const uint32_t RX_FIFO_PIRQ_OFFSET  = 0x120 / 4;
    const uint32_t GPO_OFFSET           = 0x124 / 4;
    const uint32_t TSUSTA_OFFSET        = 0x128 / 4;
    const uint32_t TSUSTO_OFFSET        = 0x12C / 4;
    const uint32_t THDSTA_OFFSET        = 0x130 / 4;
    const uint32_t TSUDAT_OFFSET        = 0x134 / 4;
    const uint32_t TBUF_OFFSET          = 0x138 / 4;
    const uint32_t THIGH_OFFSET         = 0x13C / 4;
    const uint32_t TLOW_OFFSET          = 0x140 / 4;
    const uint32_t THDDAT_OFFSET        = 0x144 / 4;

    // Masks
    //  CR
    const uint32_t CR_GC_EN             = (1 << 6);   
    const uint32_t CR_RSTA              = (1 << 5);   
    const uint32_t CR_TXAK              = (1 << 4);   
    const uint32_t CR_TX                = (1 << 3);   
    const uint32_t CR_MSMS              = (1 << 2);   
    const uint32_t CR_TX_FIFO_RST       = (1 << 1);           
    const uint32_t CR_EN                = (1 << 0);
    //  SR
    const uint32_t SR_TX_FIFO_Empty     = (1 << 7);            
    const uint32_t SR_RX_FIFO_Empty     = (1 << 6);            
    const uint32_t SR_RX_FIFO_Full      = (1 << 5);            
    const uint32_t SR_TX_FIFO_Full      = (1 << 4);            
    const uint32_t SR_SRW               = (1 << 3);    
    const uint32_t SR_BB                = (1 << 2);    
    const uint32_t SR_AAS               = (1 << 1);    
    const uint32_t SR_ABGC              = (1 << 0);    


public:
    AXI_IIC(int constructor_devmem, int constructor_baseaddr);

    virtual uint32_t read_core_reg(uint32_t offset);

    virtual void write_core_reg(uint32_t offset, uint32_t data);

    virtual void bit_set(uint32_t offset, uint32_t mask);

    virtual void bit_unset(uint32_t offset, uint32_t mask);

    virtual void setup_core_timing_regs(AXI_IIC_TIMING_PARAMS &params);

    virtual void print_timing_regs();

    virtual void initialize_iic();


    ~AXI_IIC();
};

} // namespace axi_iic_ns

#endif //   AXI_IIC_H