module top #(
  parameter WIDTH=8
  )(
  input clk,
  input rst,
  input [6:0] cmdin,
  input [WIDTH-1:0] din0,
  input [WIDTH-1:0] din1,
  input [WIDTH-1:0] din2,
  output [WIDTH-1:0] dout_low,
  output [WIDTH-1:0] dout_high,
  output zero,
  output error
);

  wire [WIDTH-1:0] muxatorba;
  wire [WIDTH-1:0] muxbtorbb;
  wire [WIDTH-1:0] rbatoalu;
  wire [WIDTH-1:0] rbbtoalu;
  wire [2*WIDTH-1:0] alutomuxr;
  wire [2*WIDTH-1:0] memtomuxr;
  wire [2*WIDTH-1:0] muxrtorbr;
  wire alutorbzero;
  wire alutorberror;

  wire [6:0] rbcmdintocu;

  mux4 #(.WIDTH(WIDTH)) muxa(
    .din0(din0),
    .din1(din1),
    .din2(din2),
    .din3(),
    .sel(),
    .dout(muxatorba)
  );

  mux4 #(.WIDTH(WIDTH)) muxb(
    .din0(din0),
    .din1(din1),
    .din2(din2),
    .din3(),
    .sel(),
    .dout(muxatorbb)
  );

  reg_bank #(.WIDTH(WIDTH)) rba(
    .clk(clk),
    .rst(rst),
    .wr_en(),
    .in(muxatorba),
    .out(rbatoalu)
  );    

  reg_bank #(.WIDTH(WIDTH)) rbb(
    .clk(clk),
    .rst(rst),
    .wr_en(),
    .in(muxbtorbb),
    .out(rbbtoalu)
  );    

  reg_bank #(.WIDTH(3'b7)) rbcmdin(
    .clk(clk),
    .rst(rst),
    .wr_en(),
    .in(cmdin),
    .out()
  );

  alu #(.WIDTH(WIDTH)) ulala(
    .in0(rbatoalu),
    .in1(rbbtoalu),
    .op(),
    .nvalid_data(),
    .out(alutomuxr),
    .zero(),
    .error()
  );  

  memory #(.WIDTH(WIDTH)) mem(
    .clk(clk),
    .rst(rst),
    .memWrite(),
    .memRead(),
    .memWriteData(),
    .memAddress(din0),
    .memOutData(memtomuxr)
  );
  
  controller cu(
    .clk(clk),
    .rst(rst),
    .cmd_in(rbcmdintocu),
    .p_error(),
    .aluin_reg_en(),
    .datain_reg_en(),
    .memWrite(),
    .memRead(),
    .selmux2(),
    .aluout_reg_en(),
    .nvalid_data(),
    .in_select_a(),
    .in_select_b(),
    .opcode()
  );

  mux2 #(.WIDTH(2*WIDTH)) muxr(
    .din0(alutomuxr),
    .din1(memtomuxr),
    .sel(),
    .dout(muxrtorbr)
  );

  reg_bank #(.WIDTH(2*WIDTH)) rbr(
    .clk(clk),
    .rst(rst),
    .wr_en(),
    .in(muxrtorbr),
    .out({dout_high, dout_low})
  );

  reg_bank #(.WIDTH(1'b1)) rbzero(
    .clk(clk),
    .rst(rst),
    .wr_en(),
    .in(alutorbzero),
    .out(zero)
  );

  reg_bank #(.WIDTH(1'b1)) rberror(
    .clk(clk),
    .rst(rst),
    .wr_en(),
    .in(alutorberror),
    .out(error)
  );

endmodule
