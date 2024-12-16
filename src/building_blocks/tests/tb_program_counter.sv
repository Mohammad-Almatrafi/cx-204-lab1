module tb_program_counter;
  parameter PROG_VALUE = 3;
  logic clk = 0, rst_n;
  logic [$clog2(PROG_VALUE)-1:0] PC_value;

  program_counter #(
      .PROG_VALUE(PROG_VALUE)
  ) DUT (
      .clk(clk),
      .rst_n(rst_n),
      .PC_value(PC_value)
  );

  always #5 clk = ~clk;
  initial begin
    rst_n = 1;
    #1;
    rst_n = 0;
    #1;
    rst_n = 1;

    repeat (9) @(negedge clk);

    $finish();
  end



endmodule
