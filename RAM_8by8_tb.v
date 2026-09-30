`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.01.2026 17:15:07
// Design Name: 
// Module Name: RAM_8by8_tb
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


module RAM_8by8_tb;
reg clk,rst,w_enable;
reg [7:0] data_in;
reg [2:0] w_add,r_add;
wire [7:0] data_out;
RAM_8by8 uut(.clk(clk),.rst(rst),.w_enable(w_enable),.data_in(data_in),.w_add(w_add),.r_add(r_add),.data_out(data_out));
initial begin
  {clk,rst,w_enable,data_in,w_add,r_add}=1'b0;
end
initial begin
 repeat(100)
   begin
     clk=1'b0;#5;
     clk=1'b1;#5;
   end
end
initial begin
  rst=1'b1;#15;
  rst=1'b0;
  w_enable=1'b1;
  w_add=3'b010;
  data_in=8'b1101_0001;#10;
  w_enable=1'b1;
  w_add=3'b101;
  data_in=8'b0010_1101;#10;
  w_enable=1'b0;
  r_add=3'b010;#10;
  $finish;
end
endmodule
