module tb_instruction_memory;
  parameter file = "fib_im.mem";
  parameter IMEM_DEPTH = 4;
  logic [$clog2(IMEM_DEPTH)-1:0] PC_value;
  logic [7:0] instruction;

  instruction_memory #(
      .IMEM_DEPTH(IMEM_DEPTH),
      .inst_data_file(file)
  ) DUT (
      .PC_value(PC_value),
      .instruction(instruction)
  );

  initial begin
    for (int i = 0; i < 4; i++) begin
      PC_value = i;
      #5;
      $display("%b", instruction);
    end
    $finish;
  end


endmodule
