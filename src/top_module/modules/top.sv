module top #(
    parameter IMEM_DEPTH = 4,
    parameter REGF_WIDTH = 16,
    parameter ALU_WIDTH = 16,
    parameter PROG_VALUE = 3,
    parameter inst_data_file = "fib_im.mem",
    parameter MEM_INIT = "fib_rf.mem"
) (
    input clk,
    input rst_n
);

  logic [1:0] opcode, rs1, rs2, rd;
  logic [ALU_WIDTH-1:0] op1, op2, alu_result;
  logic [$clog2(PROG_VALUE)-1:0] PC_value;
  logic [7:0] instruction;
  assign rs1 = instruction[3:2];
  assign rs2 = instruction[5:4];
  assign rd = instruction[7:6];
  assign opcode = instruction[1:0];
  alu #(
      .ALU_WIDTH(ALU_WIDTH)
  ) alu_block (
      .opcode(opcode),
      .op1(op1),
      .op2(op2),
      .alu_result(alu_result)
  );

  instruction_memory #(
      .IMEM_DEPTH(IMEM_DEPTH),
      .inst_data_file(inst_data_file)
  ) inst_mem (
      .PC_value(PC_value),
      .instruction(instruction)
  );

  program_counter #(
      .PROG_VALUE(PROG_VALUE)
  ) prog_count (
      .clk(clk),
      .rst_n(rst_n),
      .PC_value(PC_value)
  );

  register_file #(
      .REGF_WIDTH(REGF_WIDTH),
      .MEM_INIT  (MEM_INIT)
  ) reg_f (
      .clk(clk),
      .rst_n(rst_n),
      .rs1(rs1),
      .rs2(rs2),
      .rd(rd),
      .alu_result(alu_result),
      .op1(op1),
      .op2(op2)
  );
endmodule
