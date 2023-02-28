`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2021 09:47:37
// Design Name: 
// Module Name: bcd
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


module bcd(input [5:0] val_bin, output [3:0]bcd0, bcd1);

integer i;
reg [7:0] bcd;

always@(val_bin)
    begin
        bcd = 0;
        for(i = 0 ; i < 6; i = i + 1)
        begin
        bcd = {bcd [6:0], val_bin[5-i]};
        if (i<5 && bcd[3:0] > 4)
            bcd[3:0] = bcd [3:0] + 3;
        if (i< 5 && bcd[7:4] > 4)
            bcd[7:4] = bcd[7:4]+3;
        end
        end
        
        assign bcd0 = bcd[7:4];
        assign bcd1 = bcd[3:0];
            
endmodule
