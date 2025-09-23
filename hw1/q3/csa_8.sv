`timescale 1ns/1ns
module csa_8 (
    input logic [7:0] A, B,
    output logic [7:0] sum,
    output logic carry
  );

  logic lsb_carry_out;
  logic msb_carry_out0, msb_carry_out1;
  logic [3:0] sum_lsb, sum_msb0, sum_msb1;

  adder_4 adder_lsb(.A(A[3:0]), .B(B[3:0]), .carry_in(1'b0), .sum(sum_lsb), .carry_out(lsb_carry_out));
  adder_4 adder_msb0(.A(A[7:4]), .B(B[7:4]), .carry_in(1'b0), .sum(sum_msb0), .carry_out(msb_carry_out0));
  adder_4 adder_msb1(.A(A[7:4]), .B(B[7:4]), .carry_in(1'b1), .sum(sum_msb1), .carry_out(msb_carry_out1));

  always_comb
  begin : adder
    sum = '0;
    carry  = 0;

    if (lsb_carry_out)
    begin
      sum = {sum_msb1, sum_lsb};
      carry = msb_carry_out1;
    end
    else
    begin
      sum = {sum_msb0, sum_lsb};
      carry = msb_carry_out0;
    end

  end

endmodule