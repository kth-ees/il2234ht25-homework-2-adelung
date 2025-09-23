`timescale 1ns/1ns
module multiplier #(
    parameter N = 5
  ) (
    input logic signed [N-1:0] a, b,
    output logic signed [2*N-1:0] product
  );

  logic signed [2*N-1: 0] a_ext;
  logic signed [2*N-1: 0] p;

  always_comb
  begin : shift_and_add
    p = '0;
    a_ext = {{N{1'b0}}, a};

    for (int i = 0; i < N; i++)
    begin
      if (b[i])
      begin
        p = p + a_ext;
      end
      a_ext = a_ext << 1;
    end

    product = p;
  end

endmodule
