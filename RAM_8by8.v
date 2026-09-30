`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.01.2026 16:52:01
// Design Name: 
// Module Name: RAM_8by8
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module RAM_8by8(
    input clk,rst,w_enable,
    input [2:0] w_add,r_add,
    input [7:0] data_in,
    output reg [7:0] data_out
    );
  reg [7:0] mem[7:0];
  integer i;
 always @(posedge clk or posedge rst)
 begin
   if(rst) begin
     for(i=0;i<8;i=i+1)
       mem[i]<=8'd0;
       data_out<=8'd0;
     end
   else begin
     if(w_enable)
      
        mem[w_add]<=data_in;
        data_out <=mem[r_add];
      end
end
endmodule
