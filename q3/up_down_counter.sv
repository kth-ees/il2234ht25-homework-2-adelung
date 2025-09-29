`timescale 1ns / 1ps
module up_down_counter
  #(parameter N = 3)
   (
     input logic clk,
     input logic rst_n,
     input logic up_down,
     input logic load,
     input logic [N-1:0] input_load,
     input logic carry_in,
     output logic [N-1:0] count_out,
     output logic carry_out
   );

  always_ff @( posedge clk or negedge rst_n )
  begin
    if (!rst_n)
      count_out <= 0;
    else if (load)
      count_out <= input_load;
    else if (carry_in)
    begin
      if (up_down)
        count_out <= count_out + 1;
      else
        count_out <= count_out - 1;
    end
  end

  assign carry_out = (up_down && count_out == '1) || (!up_down && count_out == '0);

endmodule
