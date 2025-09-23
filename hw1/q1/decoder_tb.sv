`timescale 1ns/1ns
module decoder_tb;

  localparam N = 16;

  logic [$clog2(N)-1:0] binary;
  logic [N-1:0] one_hot;

  decoder #(
            .N(N)
          ) DUT (
            .binary(binary),
            .one_hot(one_hot)
          );

  initial
  begin
    binary = 16'h0;
    #10;
    $display("one_hot %b", one_hot);
    binary = 16'h1;
    #10;
    $display("one_hot %b", one_hot);
    binary = 16'h2;
    #10;
    $display("one_hot %b", one_hot);
    binary = 16'h3;
    #10;
    $display("one_hot %b", one_hot);
    binary = 16'h4;
    #10;
    $display("one_hot %b", one_hot);
    binary = 16'h5;
    #10;
    $display("one_hot %b", one_hot);
    binary = 16'hf;
    #10;
    $display("one_hot %b", one_hot);
    $stop;
  end

endmodule
