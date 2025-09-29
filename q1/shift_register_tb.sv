`timescale 1ns/1ns
module shift_register_tb;

  localparam N = 4;

  logic clk;
  logic rst_n;
  logic serial_parallel;
  logic load_enable;
  logic serial_in;
  logic [N-1:0] parallel_in;
  logic [N-1:0] parallel_out;
  logic serial_out;

  shift_register
    #(.N(N))
    DUT(
      .clk(clk),
      .rst_n(rst_n),
      .serial_parallel(serial_parallel),
      .load_enable(load_enable),
      .serial_in(serial_in),
      .parallel_in(parallel_in),
      .parallel_out(parallel_out),
      .serial_out(serial_out)
    );

  always #1 clk = ~clk;

  initial
  begin
    clk = 0;
    #100;
    $finish;
  end

  initial
  begin
    $monitor("At time %3t, parallel_out = %b, serial_out = %b", $time, parallel_out, serial_out);
    rst_n = 0;
    parallel_in = 4'hf;
    #10;

    rst_n = 1;
    load_enable = 1'b0;
    parallel_in = 4'hf;
    #10;

    load_enable = 1'b1;
    serial_parallel = 1'b1;
    parallel_in = 4'ha;
    #10;

    parallel_in = 4'h9;
    #10;

    serial_parallel = 1'b0;
    serial_in = 1'b1;
    #2;
    serial_in = 1'b1;
    #2;
    serial_in = 1'b1;
    #2;
    serial_in = 1'b1;
    #2;
  end

endmodule
