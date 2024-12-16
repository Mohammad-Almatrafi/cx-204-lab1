
module tb_register_file;
  parameter REGF_WIDTH = 16;
  parameter MEM_INIT = "fib_rf.mem";
  logic clk = 0, rst_n;
  logic [1:0] rs1, rs2, rd;
  logic [REGF_WIDTH-1:0] alu_result;
  logic [REGF_WIDTH-1:0] op1;
  logic [REGF_WIDTH-1:0] op2;

  register_file #(
      .REGF_WIDTH(REGF_WIDTH),
      .MEM_INIT  (MEM_INIT)
  ) DUT (
      .clk(clk),
      .rst_n(rst_n),
      .rs1(rs1),
      .rs2(rs2),
      .rd(rd),
      .alu_result(alu_result),
      .op1(op1),
      .op2(op2)
  );
  always #5 clk = ~clk;
  initial begin


    rst_n = 1;
    #1;
    rst_n = 0;
    #1;
    rst_n = 1;

    rs1 = 0;
    rs2 = 0;
    rd = 0;
    alu_result = 1;

    @(negedge clk);
    rs1 = 1;
    rs2 = 2;
    rd = 1;
    alu_result = 0;

    @(negedge clk);
    rs1 = 1;
    rs2 = 2;
    rd = 2;
    alu_result = 4;

    @(negedge clk);
    rs1 = 1;
    rs2 = 2;
    rd = 0;
    alu_result = 4;
    @(negedge clk);

    $finish();
  end


endmodule
