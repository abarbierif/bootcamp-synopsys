module tb_mux4();

  parameter WIDTH=8;
  reg [WIDTH-1:0] din0, din1, din2, din3;
  reg [1:0] sel;
  wire [WIDTH-1:0] dout;

  mux4 dut(
    .din0(din0),
    .din1(din1),
    .din2(din2),
    .din3(din3),
    .sel(sel),
    .dout(dout)
  );

  initial begin
  
    $dumpfile("mux4.vcd");
    $dumpvars();

    din0 = 16;
    din1 = 32;
    din2 = 64;
    din3 = 128;
    sel = 2'b00;
    #10;
    sel = 2'b11;
    #10;
    sel = 2'b01;
    #10;
    sel = 2'b10;
    #100; $finish;

  end

endmodule
