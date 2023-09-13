`include "project_parameters.vh"

module q_top_tb();


reg  [15:0] a;
reg  [15:0] b;
reg  [15:0] c;


//-------------------------IO DECLARATION-------------------------//
// Main 
reg                                         aresetn             ;
reg                                         aclk                ;
// To SRAM
reg  [   `HW_BLK_MEM_GEN_0_AWIDTH - 1 : 0]  addr                ;  
wire                                        clk                 ;
reg  [   `HW_BLK_MEM_GEN_0_DWIDTH - 1 : 0]  din                 ;
wire [   `HW_BLK_MEM_GEN_0_DWIDTH - 1 : 0]  dout                ;  
reg                                         en                  ;
reg                                         rst                 ;
reg  [ `HW_BLK_MEM_GEN_0_WE_WIDTH - 1 : 0]  we                  ;
// To ov7670
wire PCLK                                                       ;
wire HREF                                                       ;
wire VSYNC                                                      ;
wire [          `HW_OV7670_DWIDTH - 1 : 0]  D                   ;
reg  RST                                                        ;
wire XCLK                                                       ;

initial begin
    aclk = 0;
    forever begin
        aclk = ~aclk; #10;
    end

end

initial begin
    $display("HELLO WORLD TESTBENCH");
    a = 0;
    b = 0;
    c = 0;
    $display("a=%d, b=%d, c=%d", a, b, c);
    #10;
    a = 1;
    b = 1;
    c = 1;
    $display("a=%d, b=%d, c=%d", a, b, c);
    #10;
    a = 2;
    b = 2;
    c = 2;
    $display("a=%d, b=%d, c=%d", a, b, c);
    $stop;
end

hw_ov7670_src u_hw_ov7670_src(
.aresetn(aresetn),
.aclk   (aclk   ),
.addr   (addr   ),
.clk    (clk    ),
.din    (din    ),
.dout   (dout   ),
.en     (en     ),
.rst    (rst    ),
.we     (we     ),
.PCLK   (PCLK   ),                                       
.HREF   (HREF   ),                                       
.VSYNC  (VSYNC  ),                                       
.D      (D      ),
.RST    (RST    ),                                       
.XCLK   (XCLK   )                                       
);

endmodule