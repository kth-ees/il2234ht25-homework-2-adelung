`timescale 1ns/1ns
module arithmetic_right_shifter_tb;

  localparam N = 5;

  logic [N-1:0] input_data;
  logic [1:0] control;
  logic [N-1:0] shifted_result;

  arithmetic_right_shifter #(.N(N)) DUT (
                             .input_data(input_data),
                             .control(control),
                             .shifted_result(shifted_result)
                           );

  initial
  begin
    input_data = 5'b10111;
    control = 2'b01;
    #10 input_data = 5'b10111;
    control = 2'b10;
    #10 input_data = 5'b10111;
    control = 2'b11;
    #10 input_data = 5'b10111;
    control = 2'b00;

    #10 input_data = 5'b00111;
    control = 2'b01;
    #10 input_data = 5'b00111;
    control = 2'b10;
    #10 input_data = 5'b00111;
    control = 2'b11;
    #10 input_data = 5'b00111;
    control = 2'b00;
  end

endmodule
