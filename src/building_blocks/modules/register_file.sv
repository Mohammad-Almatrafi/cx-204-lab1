module register_file #(
    parameter REGF_WIDTH = 16,
    parameter MEM_INIT   = "fib_rf.mem"
) (
    input clk,
    input rst_n,
    input [1:0] rs1,
    input [1:0] rs2,
    input [1:0] rd,
    input [REGF_WIDTH-1:0] alu_result,
    output [REGF_WIDTH-1:0] op1,
    output [REGF_WIDTH-1:0] op2
);

  logic [REGF_WIDTH-1:0] x[3:0];

  always @(posedge clk, negedge rst_n) begin
    if (~rst_n) $readmemb(MEM_INIT, x);
    else if (rd != 'b0) x[rd] = alu_result;
  end

  assign op1 = x[rs1];
  assign op2 = x[rs2];

endmodule
