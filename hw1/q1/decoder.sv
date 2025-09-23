`timescale 1ns/1ns
module decoder #(
    parameter N = 16,
    localparam N_LOG = $clog2(N)
  ) (
    input logic [N_LOG-1:0] binary,
    output logic [N-1:0] one_hot
  );

  always_comb
  begin
    one_hot = '0;
    one_hot[binary] = 1'b1;
  end

endmodule
