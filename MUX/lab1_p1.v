`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.10.2022 16:42:40
// Design Name: 
// Module Name: lab1_p1
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


module lab1_p1(A, B, C, D, a, b, Q);
input A, B, C, D, a, b;
output Q;


wire iesire_a, iesire_b, nand1, nand2, nand3, nand4;

NAND NAND(a, a, iesire_a);
NAND NAND1(b, b, iesire_b);

NAND3 NAND3_1(A, iesire_b, iesire_a, nand1);
NAND3 NAND3_2(B, iesire_b, a, nand2);
NAND3 NAND3_3(C, iesire_a, b,nand3);
NAND3 NAND3_4(D, a, b, nand4);

NAND4 nand42(nand1, nand2, nand3, nand4, Q);

endmodule

