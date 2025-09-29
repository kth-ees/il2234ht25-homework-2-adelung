`timescale 1ns/1ns
module LFSR_6bit_tb;

  logic clk, rst_n;
  logic sel;
  logic [5:0] parallel_in;
  logic [5:0] parallel_out;

  LFSR_6bit
    DUT (
      .clk(clk),
      .rst_n(rst_n),
      .sel(sel),
      .parallel_in(parallel_in),
      .parallel_out(parallel_out)
    );

  always #1 clk = ~clk;

  initial
  begin
    clk = 0;
    #50;
    $finish;
  end

  initial
  begin
    $monitor("At time %3t, parallel_out = %b", $time, parallel_out);

    rst_n = 0;
    parallel_in = 6'b111111;
    #10;

    rst_n = 1;
    sel = 0;
    parallel_in = 6'b111111;
    #10;

    sel = 1;
    parallel_in = 6'b000000;
    #10;

  end

endmodule
