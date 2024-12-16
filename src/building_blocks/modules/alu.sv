module alu #(
    parameter ALU_WIDTH = 16
) (
    input [1:0] opcode,
    input [ALU_WIDTH-1:0] op1,
    input [ALU_WIDTH-1:0] op2,
    output [ALU_WIDTH-1:0] alu_result
);

  logic [ALU_WIDTH-1:0] operations[3:0];
  assign operations[0] = op1 + op2;
  assign operations[1] = op1 - op2;
  assign operations[2] = op1 & op2;
  assign operations[3] = op1 | op2;
  assign alu_result = operations[opcode];



endmodule
