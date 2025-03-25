module controller(
  input clk,
  input rst,
  input [6:0] cmd_in,
  input p_error,
  output reg aluin_reg_en,
  output reg datain_reg_en,
  output reg memWrite,
  output reg memRead,
  output reg selmux2,
  output reg aluout_reg_en,
  output reg nvalid_data,
  output [1:0] in_select_a,
  output [1:0] in_select_b,
  output reg [3:0] opcode
);

endmodule
