`timescale 1ns/1ns
module multiplier_tb;

  localparam N = 5;

  logic signed [N-1:0] a;
  logic signed [N-1:0] b;
  logic signed [2*N-1:0] product;

  multiplier
    #(
      .N(N)
    )
    DUT (
      .a(a),
      .b(b),
      .product(product)
    );

  initial
  begin
    a = 5'h3;
    b = 5'h4;
    #10;
    $display("product: %h", $signed(product));
    #10;
    a = 5'b11010;
    b = 5'ha;
    #10;
    $display("product: %h", $signed(product));
    #10;
    a = 5'hf;
    b = 5'hf;
    #10;
    $display("product: %h", $signed(product));
    $stop;
  end

endmodule
