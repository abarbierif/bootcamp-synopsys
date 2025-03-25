module alu #(
  parameter WIDTH=8
  )(
  input [WIDTH-1:0] in0, in1,
  input [2:0] op,
  input nvalid_data,
  output reg [2*WIDTH-1:0] out,
  output zero,
  output error
);
  
  always @(*) begin
    case(op)
      3'b000: out = in0 + in1;
      3'b001: out = in0 - in1;
      3'b010: out = in0 * in1;
      3'b011: out = in0 / in1;
    endcase
  end
  
  assign zero = (out==0);
  assign error = (((op==3'b011)&&(in1==0)) || nvalid_data);

endmodule
