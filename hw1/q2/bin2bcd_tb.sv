`timescale 1ns/1ns
module bin2bcd_tb;

  logic [3:0] binary;
  logic [3: 0] bcd;
  logic carry;

  bin2bcd DUT (
            .binary(binary),
            .bcd(bcd),
            .carry(carry)
          );

  initial
  begin
    #10 binary = 4'h0;
    $display("binary: %b, bcd: %b", binary, bcd);
    #10 binary = 4'h1;
    $display("binary: %b, bcd: %b", binary, bcd);
    #10 binary = 4'h2;
    $display("binary: %b, bcd: %b", binary, bcd);
    #10 binary = 4'h3;
    $display("binary: %b, bcd: %b", binary, bcd);
    #10 binary = 4'h9;
    $display("binary: %b, bcd: %b", binary, bcd);
    #10 binary = 4'ha;
    $display("binary: %b, bcd: %b", binary, bcd);
    #10 binary = 4'hf;
    $display("binary: %b, bcd: %b", binary, bcd);
  end

endmodule
