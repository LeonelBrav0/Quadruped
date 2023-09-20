//-------------------------INCLUDES-------------------------//
`include "project_parameters.vh"

//-------------------------DEFINITIONS-------------------------//

module q_top_tb;
//-------------------------IO DECLARATION-------------------------//


//-------------------------PARAMETERS-------------------------//
    parameter C_DATA_W = 32;
    parameter C_ADDR_W = 32;

//-------------------------WIRE + REG-------------------------//
    logic s_axi_aclk;
    logic s_axi_aresetn;
    logic [C_ADDR_W-1:0] s_axi_awaddr;
    logic s_axi_awvalid;
    logic s_axi_awready;
    logic [C_DATA_W-1:0] s_axi_wdata;
    logic s_axi_wvalid;
    logic s_axi_wready;
    logic [1:0] s_axi_bresp;
    logic s_axi_bvalid;
    logic s_axi_bready;
    logic [C_ADDR_W-1:0] s_axi_araddr;
    logic s_axi_arvalid;
    logic s_axi_arready;
    logic [C_DATA_W-1:0] s_axi_rdata;
    logic [1:0] s_axi_rresp;
    logic s_axi_rvalid;
    logic s_axi_rready;

//-------------------------TESTBENCH TASKS-------------------------//
    task automatic enforce_axi_read;
      input [C_ADDR_W - 1 : 0] addr;
      input [C_DATA_W - 1 : 0] expected_data;
      begin
        s_axi_araddr = addr;
        s_axi_arvalid = 1;
        s_axi_rready = 1;
        wait(s_axi_arready);
        wait(s_axi_rvalid);

        if (s_axi_rdata != expected_data) begin
          $display("Error: Mismatch in AXI4 read at %x: ", addr,
            "expected %x, received %x",
            expected_data, s_axi_rdata);
        end

        @(posedge s_axi_aclk) #1;
        s_axi_arvalid = 0;
        s_axi_rready = 0;
      end
    endtask

    task automatic axi_write;
      input [C_ADDR_W - 1 : 0] addr;
      input [C_DATA_W - 1 : 0] data;
      begin
        s_axi_wdata = data;
        s_axi_awaddr = addr;
        s_axi_awvalid = 1;
        s_axi_wvalid = 1;
        wait(s_axi_awready && s_axi_wready);
    
        @(posedge s_axi_aclk) #1;
        s_axi_awvalid = 0;
        s_axi_wvalid = 0;
      end
    endtask


//-------------------------INITIAL BLOCKS-------------------------//
    // Clock generation
    initial 
    begin
        s_axi_aclk = 0;
        forever
        begin
            #5;
            s_axi_aclk = ~s_axi_aclk;
        end
    end

//-------------------------MAIN TESTBENCH-------------------------//
    initial begin
        s_axi_aresetn = 0;
        #10 s_axi_aresetn = 1;

        $display("HELLO WORLD TESTBENCH");

        axi_write(32'h0000000C, 32'hDEADBEEF);
        enforce_axi_read(32'h0000000C, 32'hDEADBEEF);

        $finish;
    end

//-------------------------ASSIGNMENT-------------------------//

//-------------------------MODULE INSTANTIATION-------------------------//
    axil_reg_wrapper 
    #(
        C_DATA_W,
        C_ADDR_W
    )
    u_axil_reg (
        .s_axi_aclk(s_axi_aclk),
        .s_axi_aresetn(s_axi_aresetn),
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