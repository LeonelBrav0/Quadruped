interface if_dpsram #(parameter DWIDTH = 32, parameter AWIDTH = 32) (input clk);
    logic [                     AWIDTH - 1 : 0] addr        ;
    logic                                       clk         ;
    logic [                     DWIDTH - 1 : 0] din         ;
    logic [                     DWIDTH - 1 : 0] dout        ;
    logic                                       en          ;
    logic                                       rst         ;
    
    modport master (output addr, output clk, output din, input dout, output en, output rst);
endinterface