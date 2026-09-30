`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.05.2026 07:53:19
// Design Name: 
// Module Name: FIFO
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


module FIFO(
input clk,rst,wr_enable,rd_enable,
input [7:0]data_in,
output full,empty,
output [7:0] data_out);
reg [2:0] wr_ptr,rd_ptr;
reg [3:0] count;
wire ram_wr_en;
assign ram_wr_en= (wr_enable && !full); 
RAM_8by8 ram1(.clk(clk),.rst(rst),.w_enable(ram_wr_en),.w_add(wr_ptr),.r_add(rd_ptr),.data_in(data_in),.data_out(data_out));
always @(posedge clk) begin
   if(rst) begin
      count<=0;
      wr_ptr<=0;
      rd_ptr<=0;
    end
   else begin
      if(wr_enable && !full) 
       wr_ptr<=wr_ptr+1;
      if(rd_enable && !empty)
      rd_ptr<=rd_ptr+1;
      if (wr_enable && !full && ! (rd_enable&& !empty))
        count<=count+1;
      else if(rd_enable && !empty && ! (wr_enable && !full))
        count<=count-1;
      else
        count<=count;
   end   
   end
assign full=(count==8);
assign empty=(count==0);          
endmodule
