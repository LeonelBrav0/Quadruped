//-------------------------INCLUDES-------------------------//
`include "project_parameters.vh"

//-------------------------DEFINITIONS-------------------------//

module hw_ov7670_src(
    // Main clk
    aresetn                                                     ,
    aclk                                                        ,
    // To SRAM  
    addr                                                        ,
    clk                                                         ,
    din                                                         ,
    dout                                                        ,
    en                                                          ,
    rst                                                         ,
    we                                                          ,
    // To ov7670
    PCLK                                                        ,
    HREF                                                        ,
    VSYNC                                                       ,
    D                                                           ,
    RST                                                         ,
    XCLK                                                        ,
);

//-------------------------IO DECLARATION-------------------------//
// Main 
input  wire                                        aresetn             ;
input  wire                                        aclk                ;
// To SRAM
output reg  [   `HW_BLK_MEM_GEN_0_AWIDTH - 1 : 0]  addr                ;        
output wire                                        clk                 ;
output reg  [   `HW_BLK_MEM_GEN_0_DWIDTH - 1 : 0]  din                 ;
input  wire [   `HW_BLK_MEM_GEN_0_DWIDTH - 1 : 0]  dout                ;    
output reg                                         en                  ;
output reg                                         rst                 ;
output reg  [ `HW_BLK_MEM_GEN_0_WE_WIDTH - 1 : 0]  we                  ;
// To ov7670
input  wire PCLK                                                       ;
input  wire HREF                                                       ;
input  wire VSYNC                                                      ;
input  wire [          `HW_OV7670_DWIDTH - 1 : 0]  D                   ;
output reg  RST                                                        ;
output wire XCLK                                                       ;

//-------------------------PARAMETERS-------------------------//
localparam IDLE         = 0;
localparam CAPTURE      = 1;
localparam WRITE        = 2;

//-------------------------WIRE + REG-------------------------//
reg  [                              2 : 0]  current_state       ;
reg  [                              2 : 0]  next_state          ;

//-------------------------STATE LOGIC-------------------------//
always @(posedge aclk, negedge aresetn) 
begin
    if (!aresetn) 
    begin
        current_state <= IDLE;
    end 
    else 
    begin
        current_state <= next_state;
    end
end

always @(posedge aclk, negedge aresetn) 
begin
    case(current_state)
        IDLE:
        begin
            
        end

        CAPTURE:
        begin


        end

        WRITE:
        begin

        end
        default:
            next_state <= IDLE;
    endcase

end

//-------------------------ASSIGNMENT-------------------------//


//-------------------------MODULE INSTANTIATION-------------------------//


endmodule