`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2023 19:34:23
// Design Name: 
// Module Name: id_ex_pipe
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


module id_ex_pipe(input clk, reset,
          input MemtoReg_WB, RegWrite_WB, MemRead_MEM, MemWrite_MEM, Branch_MEM, ALUSrc_EX,
          input [1:0] ALUop_EX,
          input [31:0] READ_DATA1, READ_DATA2,
          input [31:0] IMM_ID,
          input [2:0] FUNCT3_ID,
          input [6:0] FUNCT7_ID,
          input [6:0] OPCODE_ID,
          input [4:0] RD_ID,
          input [4:0] RS1_ID,
          input [4:0] RS2_ID, 
          input [31:0] PC_ID,
          
          output reg MemtoReg_WB_out, RegWrite_WB_out, MemRead_MEM_out, MemWrite_MEM_out, Branch_MEM_out, ALUSrc_EX_out,
          output reg [1:0] ALUop_EX_out, 
          output reg [31:0] READ_DATA1_out,READ_DATA2_out,
          output reg [31:0] IMM_ID_out,
          output reg [2:0] FUNCT3_ID_out,
          output reg [6:0] FUNCT7_ID_out,
          output reg [6:0] OPCODE_ID_out,
          output reg [4:0] RD_ID_out,
          output reg [4:0] RS1_ID_out,
          output reg [4:0] RS2_ID_out,
          output reg [31:0] PC_ID_out);
          
  always@(posedge clk) begin
    if (reset) begin
        RegWrite_WB_out <= 1'b0;
        MemtoReg_WB_out <= 1'b0;
        MemRead_MEM_out <= 1'b0;
        MemWrite_MEM_out <= 1'b0;
        Branch_MEM_out <= 1'b0;
        ALUSrc_EX_out <= 1'b0;
        ALUop_EX_out <= 2'b0;
        READ_DATA1_out <= 32'b0;
        READ_DATA2_out <= 32'b0;
        IMM_ID_out <= 32'b0;
        FUNCT3_ID_out <= 3'b0;
        FUNCT7_ID_out <= 7'b0;
        OPCODE_ID_out <= 7'b0;
        RD_ID_out <= 5'b0;
        RS1_ID_out <= 5'b0;
        RS2_ID_out <= 5'b0;
        PC_ID_out <= 32'b0;
    end
    else begin
        RegWrite_WB_out <= RegWrite_WB;
        MemtoReg_WB_out <= MemtoReg_WB;
        MemRead_MEM_out <= MemRead_MEM;
        MemWrite_MEM_out <= MemWrite_MEM;
        Branch_MEM_out <= Branch_MEM;
        ALUSrc_EX_out <= ALUSrc_EX;
        ALUop_EX_out <= ALUop_EX;
        READ_DATA1_out <= READ_DATA1;
        READ_DATA2_out <= READ_DATA2;
        IMM_ID_out <= IMM_ID;
        FUNCT3_ID_out <= FUNCT3_ID;
        FUNCT7_ID_out <= FUNCT7_ID;
        OPCODE_ID_out <= OPCODE_ID;
        RD_ID_out <= RD_ID;
        RS1_ID_out <= RS1_ID;
        RS2_ID_out <= RS2_ID;
        PC_ID_out <= PC_ID;
    end
  end
  
endmodule
