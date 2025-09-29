`timescale 1ns/1ns
module shift_register #(parameter N=4)
  (input logic clk,
   input logic rst_n,
   input logic serial_parallel,
   input logic load_enable,
   input logic serial_in,
   input logic [N-1:0] parallel_in,
   output logic [N-1:0] parallel_out,
   output logic serial_out);

  always_ff @( posedge clk or negedge rst_n )
  begin : parallel_load
    if (!rst_n)
      parallel_out <= '0;
    else if(serial_parallel)
      parallel_out <= (load_enable) ? parallel_in : parallel_out;
    else if(!serial_parallel)
      parallel_out <= (load_enable) ? {serial_in, parallel_out[N-1: 1]} : parallel_out;
  end

  assign serial_out = parallel_out[0];

endmodule
