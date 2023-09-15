module axil_reg_wrapper #(
    parameter C_DATA_W = 32,
    parameter C_ADDR_W = 32
) 
(
    input  s_axi_aclk,
    input  s_axi_aresetn,
    input  [C_ADDR_W-1:0] s_axi_awaddr,
    input  s_axi_awvalid,
    output s_axi_awready,
    input  [C_DATA_W-1:0] s_axi_wdata,
    input  s_axi_wvalid,
    output s_axi_wready,
    output [1:0] s_axi_bresp,
    output s_axi_bvalid,
    input  s_axi_bready,
    input  [C_ADDR_W-1:0] s_axi_araddr,
    input  s_axi_arvalid,
    output s_axi_arready,
    output [C_DATA_W-1:0] s_axi_rdata,
    output [1:0] s_axi_rresp,
    output s_axi_rvalid,
    input  s_axi_rready
);

    // Instantiate the axil_regs module
    axil_reg  
    #(
        C_DATA_W,
        C_ADDR_W
    )
    u_axil_reg
    (
        .s_axi_aclk(clk),
        .s_axi_aresetn(resetn),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_awready(s_axi_awready),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wvalid(s_axi_wvalid),
        .s_axi_wready(s_axi_wready),
        .s_axi_bresp(s_axi_bresp),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_arready(s_axi_arready),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rresp(s_axi_rresp),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_rready(s_axi_rready)
    );


endmodule