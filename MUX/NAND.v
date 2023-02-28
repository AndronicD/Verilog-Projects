`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.10.2022 16:44:18
// Design Name: 
// Module Name: NAND
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


module NAND(intrare1, intrare2, iesire);
    input intrare1, intrare2;
    output iesire;
    assign iesire = ~(intrare1 & intrare2);
    
    
endmodule
