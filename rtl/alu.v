module alu #(
  parameter WIDTH=8
  )(
  input [WIDTH-1:0] in0, in1,
  input [3:0] op,
  input nvalid_data,
  output [2*WIDTH-1:0] out,
  output zero,
  output error
);

endmodule
