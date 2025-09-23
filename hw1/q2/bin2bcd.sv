`timescale 1ns/1ns
module bin2bcd (
    input logic [3:0] binary,
    output logic [3: 0] bcd,
    output logic carry
  );

  localparam bcd0 = 16'haaaa;
  localparam bcd1 = 16'h30cc;
  localparam bcd2 = 16'hc010;
  localparam bcd3 = 16'h0300;
  localparam carryLookup = 16'hfc00;

  always_comb
  begin
    bcd[0] =  bcd0[binary];
    bcd[1] =  bcd1[binary];
    bcd[2] =  bcd2[binary];
    bcd[3] =  bcd3[binary];
    carry = carryLookup[binary];
  end

endmodule
