module LFSR_6bit (
    input  logic clk, rst_n,
    input  logic sel,
    input  logic [5:0] parallel_in,
    output logic [5:0] parallel_out
  );

  always_ff @( posedge clk or negedge rst_n )
  begin : shifter
    if (!rst_n)
      parallel_out <= '0;
    else
    begin
      if (!sel)
        parallel_out <= parallel_in;
      else
        parallel_out <= {
                       parallel_out[0],
                       parallel_out[0] ^ parallel_out[5],
                       parallel_out[4],
                       parallel_out[0] ^ parallel_out[3],
                       parallel_out[2], parallel_out[1]
                     };
    end

  end

endmodule
