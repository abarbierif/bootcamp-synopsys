module memory #(
  parameter WIDTH=8
  )(
  input clk,
  input memWrite,
  input memRead,
  input [2*WIDTH-1:0] memWriteData,
  input [7:0] memAddress,
  output [2*WIDTH-1:0] memOutData
);

  reg [WIDTH-1:0] mem [255:0];
  
  always @(posedge clk) begin
    if(memWrite) mem[memAddress] <= memWriteData;
  end

  always @(*) begin
    if(memRead) memOutData <= mem[memAddress];
  end

endmodule

