//--------------------------------------------------------------------------
//
//          PROJECT L: COMMON LIBRARY 
//
//--------------------------------------------------------------------------
//
//  File: spsram512x32.sv
//  
//  Author: Marc Francis Leonel Bravo
//
//--------------------------------------------------------------------------
//
//  Abstract    :   uses macro definition __SYNTHESIS__ to switch between
//  real and model memory.
//
//--------------------------------------------------------------------------
//  Revision History
//  @ 09/29/2023    :   initial
//  Initial commit
//--------------------------------------------------------------------------
`default_nettype none

module spsram512x32 #(
    parameter FILE_DIR = "ram_init.txt"
) (
    input  logic                         rst                           ,
    input  logic                         clk                           ,
    input  logic [              8 : 0]   addr                          ,
    input  logic [             31 : 0]   din                           ,
    output logic [             31 : 0]   dout                          ,
    input  logic                         en                            ,
    input  logic                         we                            
);

`ifdef __SYNTHESIS__
    xpm_memory_spram #(
        .ADDR_WIDTH_A           (9                      ),  // DECIMAL
        .AUTO_SLEEP_TIME        (0                      ),  // DECIMAL
        .BYTE_WRITE_WIDTH_A     (32                     ),  // DECIMAL
        .CASCADE_HEIGHT         (0                      ),  // DECIMAL
        .ECC_MODE               ("no_ecc"               ),  // String
        .MEMORY_INIT_FILE       ("none"                 ),  // String
        .MEMORY_INIT_PARAM      ("0"                    ),  // String
        .MEMORY_OPTIMIZATION    ("true"                 ),  // String
        .MEMORY_PRIMITIVE       ("auto"                 ),  // String
        .MEMORY_SIZE            (512                    ),  // DECIMAL
        .MESSAGE_CONTROL        (0                      ),  // DECIMAL
        .READ_DATA_WIDTH_A      (32                     ),  // DECIMAL
        .READ_LATENCY_A         (2                      ),  // DECIMAL
        .READ_RESET_VALUE_A     ("0"                    ),  // String
        .RST_MODE_A             ("SYNC"                 ),  // String
        .SIM_ASSERT_CHK         (0                      ),  // DECIMAL
        .USE_MEM_INIT           (1                      ),  // DECIMAL
        .USE_MEM_INIT_MMI       (0                      ),  // DECIMAL
        .WAKEUP_TIME            ("disable_sleep"        ),  // String
        .WRITE_DATA_WIDTH_A     (32                     ),  // DECIMAL
        .WRITE_MODE_A           ("write_first"          ),  // String
        .WRITE_PROTECT          (1                      )   // DECIMAL
    )
    xpm_memory_spram_inst (
        .dbiterra              (/*NC*/                 ),  // 1-bit output: Status signal to indicate double bit error occurrence on the data output of port A.
        .douta                 (dout                   ),  // READ_DATA_WIDTH_A-bit output: Data output for port A read operations.
        .sbiterra              (/*NC*/                 ),  // 1-bit output: Status signal to indicate single bit error occurrence on the data output of port A.
        .addra                 (addr                   ),  // ADDR_WIDTH_A-bit input: Address for port A write and read operations.
        .clka                  (clk                    ),  // 1-bit input: Clock signal for port A.
        .dina                  (din                    ),  // WRITE_DATA_WIDTH_A-bit input: Data input for port A write operations.
        .ena                   (en                     ),  // 1-bit input: Memory enable signal for port A. Must be high on clock cycles when read or write operations are initiated. Pipelined internally.
        .injectdbiterra        (1'b0                   ),  // 1-bit input: Controls double bit error injection on input data when ECC enabled (Error injection capability is not available in "decode_only" mode).
        .injectsbiterra        (1'b0                   ),  // 1-bit input: Controls single bit error injection on input data when ECC enabled (Error injection capability is not available in "decode_only" mode).
        .regcea                (1'b1                   ),  // 1-bit input: Clock Enable for the last register stage on the output data path.
        .rsta                  (rst                    ),  // 1-bit input: Reset signal for the final port A output register stage. Synchronously resets output port douta to the value specified by parameter READ_RESET_VALUE_A.
        .sleep                 (1'b0                   ),  // 1-bit input: sleep signal to enable the dynamic power saving feature.
        .wea                   (we                     )   // WRITE_DATA_WIDTH_A/BYTE_WRITE_WIDTH_A-bit input: Write enable vector for port A input data port dina. 1 bit wide when word-wide writes are used. In byte-wide write configurations, each bit controls the writing one byte of dina to address addra. For example, to synchronously write only bits [15-8] of dina when WRITE_DATA_WIDTH_A is 32, wea would be 4'b0010.
    );
`else

    logic [31:0] ram [0:511];

    initial begin
        $readmemh(FILE_DIR, ram);
    end

    always_ff @(posedge clk) begin
        if (en) begin
            dout <= ram[addr];
        end
    end

    always_ff @(posedge clk) begin
        if (en && we) begin
            ram[addr] <= din;
        end
    end

`endif

endmodule

`default_nettype wire