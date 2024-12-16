module instruction_memory #(
    parameter IMEM_DEPTH = 4,
    parameter inst_data_file = "fib_im.mem"
) (
    input [$clog2(IMEM_DEPTH)-1:0] PC_value,
    output [7:0] instruction
);
  logic [7:0] MEM_inst[IMEM_DEPTH-1:0];
  initial begin
    $readmemb(inst_data_file, MEM_inst);
  end

  assign instruction = MEM_inst[PC_value];




endmodule
