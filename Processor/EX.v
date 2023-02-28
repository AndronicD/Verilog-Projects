`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2023 15:59:15
// Design Name: 
// Module Name: EX
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


module EX(input [31:0] IMM_EX,          //valoarea immediate in EX
          input [31:0] REG_DATA1_EX,    //valoarea registrului sursa 1
          input [31:0] REG_DATA2_EX,    //valoarea registrului sursa 2
          input [31:0] PC_EX,           //adresa instructiunii curente in EX
          input [2:0] FUNCT3_EX,        //funct3 pentru instructiunea din EX
          input [6:0] FUNCT7_EX,        //funct7 pentru instructiunea din EX
          input [4:0] RD_EX,            //adresa registrului destinatie
          input [4:0] RS1_EX,           //adresa registrului sursa 1
          input [4:0] RS2_EX,           //adresa registrului sursa 2
          input RegWrite_EX,            //semnal de scriere in bancul de registrii
          input MemtoReg_EX,            //...
          input MemRead_EX,             //semnal pentru activarea citirii din memorie
          input MemWrite_EX,            //semnal pentru activarea scrierii in memorie
          input [1:0] ALUop_EX,         //semnalul de control ALUop
          input ALUSrc_EX,              //semnal de selectie intre RS2 si valoarea imediata
          input Branch_EX,              //semnal de indentificare a instructiunii de tip branch
          input [1:0] forwardA, forwardB,//semnalele de selectie pentru multiplexoarele de forwarding
          
          input [31:0] ALU_DATA_WB,     //valoarea calculata de ALU, prezenta in WB  
          input [31:0] ALU_OUT_MEM,     //valoarea calculata ALU in MEM, prezenta in MEM
          
          output ZERO_EX,               //flag-ul ZERO calculat de ALU
          output [31:0] ALU_OUT_EX,     //rezultatul calculat de ALU in EX
          output [31:0] PC_Branch_EX,   //adresa de salt calculata in EX
          output [31:0] REG_DATA2_EX_FINAL  //valoarea registrului susrsa 2 selectata dintre
                                            //valorile prezente in etapele EX, MEM si WB
          );
          
          wire[31:0] ALU_Source1;
          wire[31:0] ALU_Source2;
          wire[31:0] MUX_B_temp;
          wire[3:0] ALUInput;
          
          mux3_1 MUX1(REG_DATA1_EX, ALU_DATA_WB, ALU_OUT_MEM, forwardA, ALU_Source1);
          
          mux3_1 MUX2(REG_DATA2_EX, ALU_DATA_WB, ALU_OUT_MEM, forwardB, MUX_B_temp);
          
          mux2_1 MUX3(IMM_EX, MUX_B_temp, ALUSrc_EX, ALU_Source2);
          
          ALUcontrol Control(ALUop_EX, FUNCT7_EX, FUNCT3_EX, ALUInput);
          
          ALU alu(ALUInput, ALU_Source1, ALU_Source2, ZERO_EX, ALU_OUT_EX);
          
          adder Adder(IMM_EX, PC_EX, PC_Branch_EX);
          
          assign REG_DATA2_EX_FINAL = MUX_B_temp;
          
endmodule
