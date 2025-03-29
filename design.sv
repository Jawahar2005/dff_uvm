// Code your design here
// Code your design here
module dff(
  input [3:0] din,
  input clk,
  input rst,
  output reg [3:0] dout
);
  
  //Clock Generation Block
  always @(posedge clk or negedge clk)
    begin
      //Reset phase - Active High
      if(rst) begin
       assign dout=din;
      end
      else
        assign dout=1'd0;
    end
endmodule
  
