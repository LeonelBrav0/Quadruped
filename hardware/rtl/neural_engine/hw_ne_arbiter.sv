//--------------------------------------------------------------------------
//
//          PROJECT N: AXI4_LITE NEURAL ENGINE
//
//--------------------------------------------------------------------------
//
//  File: hw_ne_arbiter.sv
//  
//  Author: Marc Francis Leonel Bravo
//
//--------------------------------------------------------------------------
//
//  Abstract    :   Hardware arbitration for coeff buffer spsram banks
//
//--------------------------------------------------------------------------
//  Revision History
//  @ 09/29/2023    :   initial
//  Initial commit
//--------------------------------------------------------------------------

module ne_arbiter(
    //  Global
    input logic rst;
    input logic clk;

    // Arbitration control
    input logic wreq;
    input logic rreq;
    output logic wack;
    output logic rack;

    // Write bus
    

    // Read bus
    

    // coeff buffer inteface
    input logic [511:0] coeff_buf_dout;
    output logic [8:0] coeff_buf_addr;
    output logic [31:0] coeff_buf_din;
    output logic coeff_buf_en;
    output logic coeff_buf_we;
    


);


endmodule