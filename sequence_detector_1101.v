`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2026 11:25:43
// Design Name: 
// Module Name: sequence_detector_1101
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


module sequence_detector_1101(
input clk, rst, mode, din,
output reg found
);
reg [2:0] ns, ps;
parameter idle = 0,
          s1   = 1,
          s11  = 2,
          s110 = 3,
          s1101= 4;
always @(posedge clk) begin
   if (rst)
      ps <= idle;
   else
      ps <= ns;
end
always @(*) begin
   ns = ps;
    if (mode == 1'b0) begin   //  Non-overlapping
      case(ps)
         idle:  ns = din ? s1   : idle;
         s1:    ns = din ? s11  : idle;
         s11:   ns = din ? s11  : s110;
         s110:  ns = din ? s1101: idle;
         s1101: ns = idle;   
         default: ns = idle;
      endcase
   end
   else begin                // Overlapping
      case(ps)
         idle:  ns = din ? s1   : idle;
         s1:    ns = din ? s11  : idle;
         s11:   ns = din ? s11  : s110;
         s110:  ns = din ? s1101: idle;
         s1101: ns = din ? s11  : idle; 
         default: ns = idle;
      endcase
   end
end
always @(*) begin
   found = (ps == s1101);
end
endmodule