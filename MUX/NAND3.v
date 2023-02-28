`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.10.2022 16:45:04
// Design Name: 
// Module Name: NAND3
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


module NAND3(intrare1, intrare2, intrare3, iesire);
input intrare1, intrare2, intrare3;
output iesire;
assign iesire = ~(intrare1 & intrare2 & intrare3);
endmodule
