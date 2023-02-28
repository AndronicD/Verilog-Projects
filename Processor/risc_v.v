//////////////////////////////////////////////RISC-V_MODULE///////////////////////////////////////////////////
module RISC_V(input clk,    //semnalul de ceas global
              input reset,  //semnalul de reset global
               
              output [31:0] PC_EX,          //adresa PC in etapa EX
              output [31:0] ALU_OUT_EX,     //valoarea calculata de ALE in etapa EX
              output [31:0] PC_MEM,         //adresa de salt calculata
              output PCSrc,                 //semnal de selectie pentru PC
              output [31:0] DATA_MEMORY_MEM,//valoarea citita din memoria de date in MEM
              output [31:0] ALU_DATA_WB,    //valoarea finala scrisa in etapa WB
              output [1:0] forwardA, forwardB,  //semnalele de forwarding
              output pipeline_stall             //semnal de stall la detectia de hazarduri
             );
             
  wire IF_ID_write;       //semnal de scriere pt registrul IF_ID -> din hazard detection
  wire PC_write;   //semnale de control pt PC, PCSrc -> mux, PC_Write -> PC module
  wire RegWrite_WB;        //semnal de activare a scrierii in bancul de registri     
  wire [4:0] RD_WB;        //registrul rezultat in care se face scrierea
  
  wire [31:0] PC_ID;
  wire [31:0] INSTRUCTION_ID;
  wire [31:0] IMM_ID;
  wire [31:0] REG_DATA1_ID;
  wire [31:0] REG_DATA2_ID;
  wire [2:0] FUNCT3_ID;
  wire [6:0] FUNCT7_ID;
  wire [6:0] OPCODE_ID;
  wire [4:0] RD_ID;
  wire [4:0] RS1_ID;
  wire [4:0] RS2_ID;
  //////////////////////////////////////////IF signals////////////////////////////////////////////////////////
  wire [31:0] PC_IF;               //current PC
  wire [31:0] INSTRUCTION_IF;
  
 
 /////////////////////////////////////IF Module/////////////////////////////////////
 IF instruction_fetch(clk, reset, 
                      PCSrc, PC_write,
                      PC_MEM,
                      PC_IF, INSTRUCTION_IF);
  
  
 //////////////////////////////////////pipeline registers////////////////////////////////////////////////////
 IF_ID_reg IF_ID_REGISTER(clk,reset,
                          IF_ID_write,
                          PC_IF,INSTRUCTION_IF,
                          PC_ID,INSTRUCTION_ID);
  
  
 ////////////////////////////////////////ID Module//////////////////////////////////
 wire RegWrite_ID, MemtoReg_ID, MemRead_ID, MemWrite_ID, ALUSrc_ID, Branch_ID; 
 wire [1:0] ALUop_ID;
 
 ID instruction_decode(clk,
                       PC_ID,INSTRUCTION_ID,
                       RegWrite_WB, 
                       ALU_DATA_WB,
                       RD_WB,
                       IMM_ID,
                       REG_DATA1_ID,REG_DATA2_ID,
                       RegWrite_ID,MemtoReg_ID,MemRead_ID,MemWrite_ID,
                       ALUop_ID,
                       ALUSrc_ID,
                       Branch_ID);
  
 wire MemtoReg_EX, RegWrite_EX, MemRead_EX, MemWrite_EX, Branch_EX, ALUSrc_EX;
 wire [1:0] ALUop_EX;
 wire [31:0] REG_DATA1_EX, REG_DATA2_EX;
 wire [31:0] IMM_EX;
 wire [2:0] FUNCT3_EX;
 wire [6:0] FUNCT7_EX;
 wire [6:0] OPCODE_EX;
 wire [4:0] RD_EX;
 wire [4:0] RS1_EX;
 wire [4:0] RS2_EX;
 wire [31:0] PC_EX;
 
 id_ex_pipe second_pipe(clk, reset, 
                        MemtoReg_ID, RegWrite_ID, MemRead_ID, MemWrite_ID, Branch_ID, ALUSrc_ID,
                        ALUop_ID,
                        REG_DATA1_ID, REG_DATA2_ID,
                        IMM_ID,
                        FUNCT3_ID,
                        FUNCT7_ID,
                        OPCODE_ID,
                        RD_ID,
                        RS1_ID,
                        RS2_ID,
                        PC_ID,
                        
                        MemtoReg_EX, RegWrite_EX, MemRead_EX, MemWrite_EX, Branch_EX, ALUSrc_EX,
                        ALUop_EX,
                        REG_DATA1_EX, REG_DATA2_EX,
                        IMM_EX,
                        FUNCT3_EX,
                        FUNCT7_EX,
                        OPCODE_EX,
                        RD_EX,
                        RS1_EX,
                        RS2_EX,
                        PC_EX);
  
  hazard_detection detect(RD_EX, RS1_ID, RS2_ID, MemRead_EX, PC_write, IF_ID_write, pipeline_stall);
  
  wire[4:0] RD_MEM;
  wire RegWrite_MEM;
  forwarding forward(RS1_EX, RS2_EX, RD_MEM, RD_WB, RegWrite_MEM, RegWrite_WB, forwardA, forwardB);    
  
  wire [31:0] ALU_OUT_MEM;
  wire ZERO_EX;
  wire [31:0] REG_DATA2_EX_FINAL;
  wire [31:0] PC_Branch_EX;
  EX ex(IMM_EX, REG_DATA1_EX, REG_DATA2_EX, PC_EX, FUNCT3_EX, FUNCT7_EX, RD_EX, RS1_EX, RS2_EX,
    RegWrite_EX, MemtoReg_EX, MemRead_EX, MemWrite_EX, ALUop_EX, ALUSrc_EX, Branch_EX, forwardA, forwardB,
    ALU_DATA_WB, ALU_OUT_MEM, ZERO_EX, PC_Branch_EX, REG_DATA2_EX_FINAL);
    
   wire ZERO_MEM;
   wire [2:0] FUNCT3_MEM;
   wire [31:0] REG_DATA2_MEM_FINAL; 
   wire MemRead_MEM, MemtoReg_MEM, MemWrite_MEM, RegWrite_MEM, Branch_MEM;   
   
   ex_mem pipe3(clk, reset, ZERO_EX, ALU_OUT_EX, PC_Branch_EX, REG_DATA2_EX_FINAL, RD_EX, FUNCT3_EX,
                            MemtoReg_EX, RegWrite_EX, MemRead_EX, MemWrite_EX, Branch_EX,
                            ZERO_MEM, ALU_OUT_MEM, PC_MEM, REG_DATA2_MEM_FINAL, RD_MEM, FUNCT3_MEM,
                            MemtoReg_MEM, RegWrite_MEM, MemRead_MEM, MemWrite_MEM, Branch_MEM);
     
   data_memory data_mem(clk, MemRead_MEM, MemWrite_MEM, ALU_OUT_MEM, REG_DATA2_MEM_FINAL, DATA_MEMORY_MEM);
   branch_control branch(ZERO_MEM, ALU_OUT_MEM, Branch_MEM, FUNCT3_MEM, PCSrc);
   assign PCSrc = Branch_MEM & ZERO_MEM;
   
   mem_wb pipe4(clk, reset, MemtoReg_MEM, RegWrite_MEM, DATA_MEMORY_MEM, ALU_OUT_MEM, RD_MEM, 
                            MemtoReg_WB, RegWrite_WB, DATA_MEMORY_WB, ALU_OUT_WB, RD_WB);                
   
   mux2_1 mux_wb(DATA_MEMORY_WB, ALU_OUT_WB, MemtoReg_WB, ALU_DATA_WB);
endmodule
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
