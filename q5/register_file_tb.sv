module registerfile_tb;

  parameter DATA_WIDTH = 4;
  parameter REG_COUNT = 3;
  parameter DATA_WIDTH_LOG = $clog2(DATA_WIDTH);

  logic clk, rst_n;

  logic chip_en, write_en_n;

  logic [DATA_WIDTH_LOG-1:0] write_addr, read_addr1, read_addr2;
  logic [DATA_WIDTH-1:0] data_in, data_out1, data_out2;

  register_file
    DUT (
      .clk(clk),
      .rst_n(rst_n),
      .write_en_n(write_en_n),
      .chip_en(chip_en),
      .write_addr(write_addr),
      .data_in(data_in),
      .read_addr1(read_addr1),
      .read_addr2(read_addr2),
      .data_out1(data_out1),
      .data_out2(data_out2)
    );

  always #1 clk = ~clk;

  initial
  begin
    clk = 0;
    #100;
    $finish;
  end

  initial
  begin
    $monitor("At time %3t, data_out1 = %b, data_out2 = %b", $time, data_out1, data_out2);

    rst_n = 0;
    chip_en = 0;
    write_en_n = 1;
    write_addr = 4'h0;
    data_in = 4'hf;
    #10;
    assert (data_out1 == '0 && data_out2 == '0);

    rst_n = 1;
    chip_en = 0;
    write_addr = 4'h0;
    data_in = 4'ha;
    #10;
    assert (data_out1 == '0 && data_out2 == '0);

    chip_en = 1;
    write_addr = 4'h0;
    data_in = 4'ha;
    #10;
    assert (data_out1 == '0 && data_out2 == '0);

    write_en_n = 0;
    write_addr = 2'h0;
    data_in = 4'ha;
    read_addr1 = 2'h0;
    read_addr2 = 2'h1;
    #10;
    assert (data_out1 == 4'ha && data_out2 == '0);

    write_addr = 2'h1;
    data_in = 4'hb;
    #10;
    assert (data_out1 == 4'ha && data_out2 == 4'hb);

    write_addr = 2'h2;
    data_in = 4'hf;
    read_addr1 = 2'h2;
    #10;
    assert (data_out1 == 4'hf);

  end

endmodule
