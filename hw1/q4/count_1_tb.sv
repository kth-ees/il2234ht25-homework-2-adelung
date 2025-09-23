`timescale 1ns/1ns
module count_1_tb;
  logic [3:0] a;
  logic [2:0] out;

  count_1 DUT (
            .a(a),
            .out(out)
          );

  initial
  begin
    a = 4'b0001;
    #10;
    $display("out: %d", out);
    a = 4'b0011;
    #10;
    $display("out: %d", out);
    a = 4'b0111;
    #10;
    $display("out: %d", out);
    a = 4'b1111;
    #10;
    $display("out: %d", out);
  end

endmodule
