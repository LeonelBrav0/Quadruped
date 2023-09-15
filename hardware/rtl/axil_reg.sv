module axil_reg #(
    parameter C_DATA_W = 32,
    parameter C_ADDR_W = 32
) (
    input logic s_axi_aclk,
    input logic s_axi_aresetn,
    input logic [C_ADDR_W-1:0] s_axi_awaddr,
    input logic s_axi_awvalid,
    output logic s_axi_awready,
    input logic [C_DATA_W-1:0] s_axi_wdata,
    input logic s_axi_wvalid,
    output logic s_axi_wready,
    output logic [1:0] s_axi_bresp,
    output logic s_axi_bvalid,
    input logic s_axi_bready,
    input logic [C_ADDR_W-1:0] s_axi_araddr,
    input logic s_axi_arvalid,
    output logic s_axi_arready,
    output logic [C_DATA_W-1:0] s_axi_rdata,
    output logic [1:0] s_axi_rresp,
    output logic s_axi_rvalid,
    input logic s_axi_rready
);

    // AXI4LITE signals
    logic [C_ADDR_W-1:0] axi_awaddr;
    logic axi_awready;
    logic [1:0] axi_bresp;
    logic axi_bvalid;
    logic [C_ADDR_W-1:0] axi_araddr;
    logic axi_arready;
    logic [C_DATA_W-1:0] axi_rdata;
    logic axi_rvalid;

    // Signals for user logic register space
    // Number of Slave Registers 16
    const logic [C_ADDR_W-1:0] VER_ADDR = 32'h00;
    const logic [C_ADDR_W-1:0] DATE_ADDR = 32'h04;
    const logic [C_ADDR_W-1:0] SCRPAD_ADDR = 32'h08;
    const logic [C_ADDR_W-1:0] PWM_FREQ_DIV_ADDR = 32'h0C;
    const logic [C_ADDR_W-1:0] PWM_DUTY_ADDR = 32'h10;
    logic [C_DATA_W-1:0] reg_version = 32'h00000001;
    logic [C_DATA_W-1:0] reg_date = 32'h21100922;
    logic [C_DATA_W-1:0] reg_scratchpad;
    logic [7:0] reg_pwm_freq_div;
    logic [7:0] reg_pwm_duty;
    logic [C_DATA_W-1:0] reg_data_out;

    const int REGS_TIMEOUT = 15;
    int timeout_rd;
    int timeout_wr;
    logic waddr_strb;
    logic bresp_strb;
    logic wr_en;
    logic raddr_strb;
    logic rdata_strb;

    typedef enum {idle, start_rd, rd_data} rd_sm_t;
    rd_sm_t rd_st;

    typedef enum {idle, wr_data, wr_resp} wr_sm_t;
    wr_sm_t wr_st;

    // Write registers state machine for control
    always_ff @(posedge s_axi_aclk or negedge s_axi_aresetn) begin
        if (!s_axi_aresetn) begin
            axi_awready <= 1'b1;
            axi_bvalid <= 1'b0;
            wr_en <= 1'b0;
            wr_st <= idle;
        end else begin
            case(wr_st)
                idle: begin
                    if (waddr_strb) begin
                        axi_awaddr <= s_axi_araddr;
                        axi_awready <= 1'b0;
                        axi_bvalid <= 1'b0;
                        if (s_axi_wvalid) begin
                            axi_bvalid <= 1'b1;
                            timeout_wr <= REGS_TIMEOUT - 1;
                            wr_en <= 1'b1;
                            wr_st <= wr_resp;
                        end else begin
                            timeout_wr <= REGS_TIMEOUT - 1;
                            wr_en <= 1'b1;
                            wr_st <= wr_data;
                        end
                    end
                end
                wr_data: begin
                    if (s_axi_wvalid) begin
                        axi_bvalid <= 1'b1;
                        timeout_wr <= REGS_TIMEOUT - 1;
                        wr_en <= 1'b1;
                        wr_st <= wr_resp;
                    end else if (timeout_wr == 0) begin
                        axi_awready <= 1'b1;
                        wr_st <= idle;
                    end else begin
                        timeout_wr <= timeout_wr - 1;
                    end
                end
                wr_resp: begin
                    wr_en <= 1'b0;
                    axi_bvalid <= 1'b1;
                    if (bresp_strb || timeout_wr == 0) begin
                        axi_bvalid <= 1'b0;
                        axi_awready <= 1'b1;
                        wr_st <= idle;
                    end else if (timeout_wr > 0) begin
                        timeout_wr <= timeout_wr - 1;
                    end
                end
            endcase
        end
    end

    // Implement memory mapped register select for write accesses 
    always_ff @(posedge s_axi_aclk) begin
        if (!s_axi_aresetn) begin
            reg_scratchpad <= '0;
            reg_pwm_freq_div <= '0;
            reg_pwm_duty <= '0;
        end else if (wr_en) begin
            case(axi_awaddr)
                SCRPAD_ADDR: begin
                    axi_bresp <= 2'b00;
                    reg_scratchpad <= s_axi_wdata;
                end
                PWM_FREQ_DIV_ADDR: begin
                    axi_bresp <= 2'b00;
                    reg_pwm_freq_div <= s_axi_wdata[7:0];
                end
                PWM_DUTY_ADDR: begin
                    axi_bresp <= 2'b00;
                    reg_pwm_duty <= s_axi_wdata[7:0];
                end
                default: axi_bresp <= 2'b10; // slave decoder error
            endcase
        end
    end

    // Registers read section
    always_ff @(posedge s_axi_aclk) begin
        if (!s_axi_aresetn) begin
            axi_arready <= 1'b1;
            axi_rvalid <= 1'b0;
            rd_st <= idle;
        end else begin
            case(rd_st)
                idle: begin
                    if (raddr_strb) begin
                        axi_araddr <= s_axi_araddr;
                        axi_arready <= 1'b0;
                        axi_rvalid <= 1'b0;
                        rd_st <= start_rd;
                    end
                end
                start_rd: begin
                    axi_rvalid <= 1'b1;
                    timeout_rd <= REGS_TIMEOUT - 1;
                    rd_st <= rd_data;
                end
                rd_data: begin
                    if (rdata_strb || timeout_rd == 0) begin
                        axi_rvalid <= 1'b0;
                        axi_arready <= 1'b1;
                        rd_st <= idle;
                    end else begin
                        timeout_rd <= timeout_rd - 1;
                    end
                end
            endcase
        end
    end

    // Read registers data
    always_ff @(posedge s_axi_aclk) begin
        axi_rdata <= '0;
        s_axi_rresp <= 2'b00;
        case(axi_araddr)
            VER_ADDR: axi_rdata <= reg_version;
            DATE_ADDR: axi_rdata <= reg_date;
            SCRPAD_ADDR: axi_rdata <= reg_scratchpad;
            PWM_FREQ_DIV_ADDR: axi_rdata[7:0] <= reg_pwm_freq_div;
            PWM_DUTY_ADDR: axi_rdata[7:0] <= reg_pwm_duty;
            default: s_axi_rresp <= 2'b10; // slave decode error
        endcase
    end

endmodule

endmodule