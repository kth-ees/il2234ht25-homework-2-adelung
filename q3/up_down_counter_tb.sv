`timescale 1ns / 1ns
module up_down_counter_tb;

  localparam N = 4;

  logic clk, rst_n;
  logic up_down, load;

  logic carry_in;
  logic [N-1:0] input_load;

  logic [N-1:0] count_out;
  logic carry_out;

  up_down_counter
    #(.N(N))
    DUT (
      .clk(clk),
      .rst_n(rst_n),

      .up_down(up_down),
      .load(load),

      .input_load(input_load),
      .count_out(count_out),
      .carry_out(carry_out)
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
    $monitor("At time %3t, count_out = %b, carry_out = %b", $time, count_out, carry_out);

    rst_n = 0;
    up_down = 1;
    load = 0;
    input_load = 4'hf;
    #10;
    assert (count_out == '0 && carry_out == 1'b0);

    rst_n = 1;
    up_down = 1;
    load = 1;
    input_load = 4'h0;
    #10;
    assert (count_out == '0 && carry_out == 1'b0);

    up_down = 1;
    load = 0;
    input_load = 4'h0;
    #10;
    assert (count_out == 4'h5 && carry_out == 1'b0);
    #20;
    assert (count_out == 4'hf && carry_out == 1'b1);

    up_down = 0;
    load = 1;
    input_load = 4'hf;
    #10;
    assert (count_out == 4'hf && carry_out == 1'b0);

    up_down = 0;
    load = 0;
    input_load = 4'hf;
    #10;
    assert (count_out == 4'ha && carry_out == 1'b0);
    #20;
    assert (count_out == 4'h0 && carry_out == 1'b1);

  end

endmodule
