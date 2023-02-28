`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.12.2022 16:53:24
// Design Name: 
// Module Name: ALUcontrol
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


module ALUcontrol(input [1:0]ALUop, [6:0]FUNCT7, [2:0]FUNCT3, output reg [3:0]ALUinput);
always@(ALUop, FUNCT3, FUNCT7)
    begin
    casex({ALUop, FUNCT3, FUNCT7})
    12'b000000000000: ALUinput <= 4'b0010; //ld, sd 
    12'b1100xxxxxxxx: ALUinput <= 4'b0110; //beq bne func3: 000 001  
    12'b1110xxxxxxxx: ALUinput <= 4'b1000; //blt bge func3: 100 101 
    12'b1111xxxxxxxx: ALUinput <= 4'b0111; //bltu bgeu func3: 110 111 
    12'b100000000000: ALUinput <= 4'b0010; //add func3: 000
    12'b11000xxxxxxx: ALUinput <= 4'b0010; //addi func3: 000
    12'b100000100000: ALUinput <= 4'b0110; //sub func3: 000
    12'b101110000000: ALUinput <= 4'b0000; //and func3: 111
    12'b11111xxxxxxx: ALUinput <= 4'b0000; //andi func3: 111
    12'b101100000000: ALUinput <= 4'b0001; //or ori func3: 110
    12'b11110xxxxxxx: ALUinput <= 4'b0001; //or ori func3: 110 
    12'b101000000000: ALUinput <= 4'b0011; //xor xori func3: 100 
    12'b11100xxxxxxx: ALUinput <= 4'b0011; //xor xori func3: 100
    12'b101010000000: ALUinput <= 4'b0101; // srl func3: 101
    12'b11101xxxxxxx: ALUinput <= 4'b0101; // srli
    12'b100010000000: ALUinput <= 4'b0100; // sll func3: 001
    12'b11001xxxxxxx: ALUinput <= 4'b0100; // slli
    12'b101010100000: ALUinput <= 4'b1001; // sra func3: 101
    12'b111010100000: ALUinput <= 4'b1001; // srai
    12'b100110000000: ALUinput <= 4'b0111; // sltu func3: 011
    12'b100100000000: ALUinput <= 4'b1000; // slt func3: 010 
    12'b11010xxxxxxx: ALUinput <= 4'b1000; // slti  
    endcase
    end
endmodule
