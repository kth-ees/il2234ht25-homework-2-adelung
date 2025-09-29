`timescale 1ns/1ps
module frequency_divider (
    input logic clk,
    input logic rst_n,
    output logic divider_out
  );

  logic mode18 = 1'b1;
  logic load = 1'b1;
  logic [3:0] carry;
  logic [15:0] load_value;

  assign load_value = mode18 ? 16'hFFEF : 16'hFC9F;
  assign divider_out = carry[3];

  counter
    counter0 (
      .clk(clk),
      .rst_n(rst_n),
      .load(load),
      .input_load(load_value[3:0]),
      .carry_in(1'b1),
      .carry_out(carry[0])
    );

  counter
    counter1 (
      .clk(clk),
      .rst_n(rst_n),
      .load(load),
      .input_load(load_value[7:4]),
      .carry_in(carry[0]),
      .carry_out(carry[1])
    );

  counter
    counter2 (
      .clk(clk),
      .rst_n(rst_n),
      .load(load),
      .input_load(load_value[11:8]),
      .carry_in(carry[1]),
      .carry_out(carry[2])
    );

  counter
    counter3 (
      .clk(clk),
      .rst_n(rst_n),
      .load(load),
      .input_load(load_value[15:12]),
      .carry_in(carry[2]),
      .carry_out(carry[3])
    );

  always_ff @( posedge clk or negedge rst_n )
  begin : mode_switch
    if (!rst_n)
    begin
      mode18 <= 1'b1;
    end
    else if (carry[3])
    begin
      mode18 <= ~mode18;
      load <= 1'b1;
    end
    else
    begin
      load <= 1'b0;
    end
  end

endmodule

module counter
  (
    input logic clk,
    input logic rst_n,
    input logic load,
    input logic [3:0] input_load,
    input logic carry_in,
    output logic [3:0] count_out,
    output logic carry_out
  );

  always_ff @( posedge clk or negedge rst_n )
  begin
    if (!rst_n)
      count_out <= 0;
    else if (load)
      count_out <= input_load;
    else if (carry_in)
    begin
      count_out <= count_out + 1;
    end
  end

  assign carry_out = &{count_out, carry_in};

endmodule
