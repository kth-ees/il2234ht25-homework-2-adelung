`timescale 1ns/1ns
module bin2gray (
    input logic [3:0] binary,
    output logic [3:0] gray
  );

  localparam b2g0 = 16'h6666;
  localparam b2g1 = 16'hc3c3;
  localparam b2g2 = 16'h0ff0;
  localparam b2g3 = 16'hff00;

  assign gray[0] = b2g0[binary];
  assign gray[1] = b2g1[binary];
  assign gray[2] = b2g2[binary];
  assign gray[3] = b2g3[binary];

endmodule
