module program_counter #(
    parameter PROG_VALUE = 3
) (
    input clk,
    input rst_n,
    output logic [$clog2(PROG_VALUE)-1:0] PC_value
);


  always @(posedge clk, negedge rst_n) begin
    if (~rst_n) PC_value <= 'b0;
    else if (PC_value == PROG_VALUE) PC_value = 0;
    else PC_value = PC_value + 1;
  end


endmodule
