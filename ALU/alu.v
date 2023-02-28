`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.10.2022 16:02:45
// Design Name: 
// Module Name: alu
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


module alu(input [3:0] A, B, input [2:0] Op, output [3:0] Out, output Overflow);
 reg [3:0] Out_R;
 reg Overflow_R;
 assign Out = Out_R;
 assign Overflow = Overflow_R;
 
always @(*)
    case(Op)
    3'b000:
    begin
        {Overflow_R, Out_R} = A + B;
    end
    3'b001:
        if(A == B)
            Out_R = 4'b1111;
        else
            Out_R = 4'b0000;
    3'b010:
    begin
        Out_R = A >> 1;
    end
    3'b011:
    begin
        Out_R = ~B + 1;
    end
    3'b100:
    begin
        Out_R = A&B;
    end
    endcase
endmodule
