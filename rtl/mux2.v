module mux2 #(
  parameter WIDTH=8
  )(
  input [WIDTH-1:0] din0,
  input [WIDTH-1:0] din1,
  input sel,
  output [WIDTH-1:0] dout;
);

  assign dout = sel ? din1 : din0;

endmodule
