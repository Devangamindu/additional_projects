`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.05.2026 09:53:54
// Design Name: 
// Module Name: FIFO_tb
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


module FIFO_tb;
reg clk,rst,wr_enable,rd_enable;
reg [7:0]data_in;
wire full,empty;
wire [7:0] data_out;
FIFO uut(.clk(clk),.rst(rst),.wr_enable(wr_enable),.rd_enable(rd_enable),
.data_in(data_in),.full(full),.empty(empty),.data_out(data_out));
initial begin
  repeat(100)
    begin
      clk=1'b0;#5;
      clk=1'b1;#5;
    end
end 
initial begin
rst=1'b1;
wr_enable=0;
rd_enable=0;
data_in=8'd0;
#10;
rst=1'b0;
data_in=8'd10;wr_enable=1;
#10;
data_in=8'd20;#10;
data_in=8'd30;#10;
data_in=8'd44;#10;
data_in=8'd54;#10;
data_in=8'd48;#10;
data_in=8'd65;#10;
data_in=8'd32;#10;
wr_enable=0;
rd_enable=1;
#80;
rd_enable=0;#10;
wr_enable = 1;
rd_enable = 1;
data_in = 8'd55;
#10;
end
endmodule
