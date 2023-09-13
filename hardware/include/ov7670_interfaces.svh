interface if_ov7670 #(parameter DWIDTH = 32, parameter AWIDTH = 32) (input clk);
    logic [                     AWIDTH - 1 : 0] addr        ;
    logic                                       HREF        ;
    logic                                       VSYNC       ;
    logic [                              9 : 0] data        ;
    logic                                       PCLK        ;

    modport master (output addr, input HREF, input VSYNC, input data, output PCLK);
endinterface