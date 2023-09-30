//--------------------------------------------------------------------------
//
//          PROJECT N: AXI4_LITE NEURAL ENGINE
//
//--------------------------------------------------------------------------
//
//  File: hw_ne_write_coeff_buffer.sv
//  
//  Author: Marc Francis Leonel Bravo
//
//--------------------------------------------------------------------------
//
//  Abstract    :   Store matrix coefficients fetched from DDR, used by
//  neural processing engine.
//
//--------------------------------------------------------------------------
//  Revision History
//  @ 09/29/2023    :   initial
//  Initial commit
//--------------------------------------------------------------------------
module hw_ne_write_coeff_buffer (
    input  logic                         rst                           ,
    input  logic                         clk                           ,
    input  logic [              8 : 0]   addr                          ,
    input  logic [             31 : 0]   din                           ,
    output logic [            511 : 0]   dout                          ,
    input  logic                         en                            ,
    input  logic                         we                           
);

logic [15:0] wen;

generate
    genvar i;
    for (i = 0; i < 16; i = i + 1)
    begin
        assign wen[i] = (addr[3:0] == i) ? 1'b1 : 1'b0;
    end

    for (i = 0; i < 16; i = i + 1)
    begin
`ifdef __SYNTHESIS__
        spsram512x32
`else
        localparam string file_name = $sformatf("./data/coeff_buffer_init_b%d.txt", i);
        spsram512x32 #(
            .FILE_DIR(file_name)
        )
`endif
        u_coeff_buff[i] (
            .rst        (rst                    ),
            .clk        (clk                    ),
            .addr       (addr                   ),
            .din        (din                    ),
            .dout       (dout[32 * i :+ 32]     ),
            .en         (en                     ),
            .we         (wen[i]                 )
        );
    end
endgenerate

endmodule