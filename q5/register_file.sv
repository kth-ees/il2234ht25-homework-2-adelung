`timescale 1ns/1ns
module register_file
  #(
     parameter DATA_WIDTH = 32,
     parameter REG_COUNT = 15,
     parameter DATA_WIDTH_LOG = $clog2(DATA_WIDTH)
   )
   (
     input logic clk,
     input logic rst_n,

     input logic write_en_n,
     input logic chip_en,

     input logic [DATA_WIDTH_LOG-1:0] write_addr,
     input logic [DATA_WIDTH-1:0] data_in,

     input logic [DATA_WIDTH_LOG-1:0] read_addr1,
     input logic [DATA_WIDTH_LOG-1:0] read_addr2,
     output logic [DATA_WIDTH-1:0] data_out1,
     output logic [DATA_WIDTH-1:0] data_out2
   );

  logic [DATA_WIDTH - 1: 0] regs [REG_COUNT - 1: 0];

  assign data_out1 = chip_en ? regs[read_addr1] : '0;
  assign data_out2 = chip_en ? regs[read_addr2] : '0;

  always_ff @( posedge clk or negedge rst_n )
  begin : reset_enable
    if (!rst_n)
    begin
      for (int i = 0; i < REG_COUNT; i++)
      begin
        regs[i] <= '0;
      end
    end
    else if (!write_en_n)
    begin
      regs[write_addr] <= data_in;
    end
  end

endmodule
