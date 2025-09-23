module csa_8_tb;

  logic [7:0] A, B;
  logic [7:0] sum;
  logic carry;

  csa_8 DUT (
          .A(A),
          .B(B),
          .sum(sum),
          .carry(carry)
        );

  initial
  begin
    A = 8'h02;
    B = 8'h01;
    #10;
    $display("sum: %d, carry: %b", sum, carry);
    #10;
    A = 8'h0f;
    B = 8'h01;
    #10;
    $display("sum: %d, carry: %b", sum, carry);
    #10;
    A = 8'hf0;
    B = 8'h01;
    #10;
    $display("sum: %d, carry: %b", sum, carry);
    #10;
    A = 8'hfe;
    B = 8'h02;
    #10;
    $display("sum: %d, carry: %b", sum, carry);
  end

endmodule
