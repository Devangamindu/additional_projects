`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2026 12:03:30
// Design Name: 
// Module Name: sequence_detector_1101_tb
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


module sequence_detector_1101_tb;
reg clk, rst, mode, din;
wire found;
sequence_detector_1101 uut(.clk(clk),.rst(rst),.din(din),.mode(mode),.found(found));
initial begin
  repeat(100)
    begin
       clk=1'b0;#5;
       clk=1'b1;#5;
    end
end
initial begin
rst=1'b1;
mode=0;din=0;#20;
rst=1'b0;
 mode = 0;
   din = 1; #10;
   din = 1; #10;
   din = 0; #10;
   din = 1; #10;  
   din = 1; #10;
   din = 0; #10;
   din = 1; #10;
   din = 1; #10;
   din = 0; #10;
   din = 1; #10;
   #20;
   mode = 1;
din = 1; #10;
   din = 1; #10;
   din = 0; #10;
   din = 1; #10;  
   din = 1; #10;
   din = 0; #10;
   din = 1; #10;   
#50;
   $finish;
end

endmodule
