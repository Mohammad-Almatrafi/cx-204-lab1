module tb_alu;
  parameter ALU_WIDTH = 16;
  logic [1:0] opcode;
  logic [ALU_WIDTH -1:0] op1, op2, alu_result;

  alu #(
      .ALU_WIDTH(ALU_WIDTH)
  ) DUT (
      .opcode(opcode),
      .op1(op1),
      .op2(op2),
      .alu_result(alu_result)
  );


  initial begin
    opcode = 0;
    op1 = 19;
    op2 = 50;

    #5;
    opcode = 1;
    #5;
    opcode = 2;
    #5;
    opcode = 3;
    #5;
    opcode = 3;
    #5;
    opcode = 0;
    op1 = 12;
    op2 = 56;
    #5;


    $finish;
  end

endmodule
