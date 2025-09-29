`timescale 1ns/1ps
module frequency_divider_tb;

  logic clk, rst_n;
  logic divider_out;

  frequency_divider
    DUT (
      .clk(clk),
      .rst_n(rst_n),
      .divider_out(divider_out)
    );

  always #0.5 clk = ~clk;

  initial
  begin
    clk = 0;
    #3000;
    $finish;
  end

  initial
  begin
    $monitor("At time %t, divider_out = %b", $time, divider_out);

    rst_n = 1'b0;
    #10;
    assert (divider_out == 1'b0);

    rst_n = 1'b1;
    assert (divider_out == 1'b0);

    #17;
    assert (divider_out == 1'b1);
    #866;
    assert (divider_out == 1'b1);
    #18;
    assert (divider_out == 1'b1);
    #866;
    assert (divider_out == 1'b1);
    #18;
    assert (divider_out == 1'b1);
    #866;
    assert (divider_out == 1'b1);
    #18;
    assert (divider_out == 1'b1);

  end

endmodule
