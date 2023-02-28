`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2021 10:27:59
// Design Name: 
// Module Name: last_step
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


module last_step(clock, pauza, reset, bcd0_s, bcd0_m, bcd1_s, bcd1_m);

input clock, pauza, reset;
wire carry_out1, carry_out2;
wire [5:0] val_bin1, val_bin2;
output [3:0] bcd0_s, bcd0_m, bcd1_s, bcd1_m;

numarator_59 nr1 (clock, pauza, reset, val_bin1, carry_out1);
numarator_59 nr2 (carry_out1, pauza, reset, val_bin2, carry_out2);

bcd b1 (val_bin1, bcd1_s, bcd0_s);
bcd B (val_bin2, bcd1_m, bcd0_m);
endmodule
