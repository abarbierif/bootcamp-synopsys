module mux_registered #(
  parameter WIDTH=8
  )(
  input clk,
  input rst,
  input [1:0] sel,
  input [WIDTH-1:0] in0, in1, in2, in3,
  output [WIDTH-1:0] out
);

  wire [WIDTH-1:0] muxtoreg;

  mux4 mux4_0(
    .din0(in0),
    .din1(in1),
    .din2(in2),
    .din3(in3),
    .sel(sel),
    .dout(muxtoreg)
  );

  register_bank rb_0(
    .clk(clk),
    .rst(rst),
    .wr_en(1'b1),
    .in(muxtoreg),
    .out(out)
  );

endmodule
