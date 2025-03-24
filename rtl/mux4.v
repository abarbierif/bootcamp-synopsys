module mux4 #(
  parameter WIDTH=8
  )(
  input [WIDTH-1:0] din0, din1, din2, din3,
  input [1:0] sel,
  output [WIDTH-1:0] dout
);

  /*
  always @(*) begin
    case(sel):
      2'd0: dout = din0;
      2'd1: dout = din1;
      2'd2: dout = din2;
      2'd3: dout = din3;
    endcase
  end
  */

  assign dout = sel[1] ? (sel[0] ? din3 : din2) : (sel[0] ? din1 : din0); 

endmodule
