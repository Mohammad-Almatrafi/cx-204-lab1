module tb_top;





  parameter IMEM_DEPTH = 4;
  parameter REGF_WIDTH = 16;
  parameter ALU_WIDTH = 16;
  parameter PROG_VALUE = 3;
  parameter inst_data_file = "fib_im.mem";
  parameter MEM_INIT = "fib_rf.mem";

  logic clk = 0, rst_n;
  integer fd;
  integer i;
  top #(
      .IMEM_DEPTH(IMEM_DEPTH),
      .REGF_WIDTH(REGF_WIDTH),
      .ALU_WIDTH(ALU_WIDTH),
      .PROG_VALUE(PROG_VALUE),
      .inst_data_file(inst_data_file),
      .MEM_INIT(MEM_INIT)
  ) DUT (
      .clk  (clk),
      .rst_n(rst_n)
  );



  initial begin
    // Create a new file
    fd = $fopen("regfile.mem", "w");
    repeat(60) @(negedge clk);
    $fclose(fd);
  end



  always #5 clk = ~clk;

  always @(posedge clk) begin
    for (i = 0; i < 4; i = i + 1) begin
      $fdisplay(fd, DUT.reg_f.x[i]);
    end
  end

  initial begin
    rst_n = 1;
    #1;
    rst_n = 0;
    #1;
    rst_n = 1;

    repeat (60) @(negedge clk);
    $finish;
  end



endmodule
