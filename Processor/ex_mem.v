`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2023 19:35:25
// Design Name: 
// Module Name: ex_mem
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


module ex_mem(input clk, reset,
           input zero_in,
           input[31:0] ALU_in,
           input[31:0] pc_in,
           input[31:0] reg2_data_in,
           input[4:0] rd_in,
           input[2:0] func3_in,
           input MemtoReg_WB, RegWrite_WB, MemRead_MEM, MemWrite_MEM, Branch_MEM,
           
           output reg zero_out,
           output reg[31:0] ALU_out,
           output reg[31:0] pc_out,
           output reg[31:0] reg2_data_out,
           output reg[4:0] rd_out,
           output reg[2:0] func3_out,
           output reg MemtoReg_WB_out, RegWrite_WB_out, MemRead_MEM_out, MemWrite_MEM_out, Branch_MEM_out
    );
    
     always@(posedge clk)
        begin
        if (reset)
            begin
                ALU_out <= 32'b0;
                zero_out <= 0;
                pc_out <= 32'b0;
                reg2_data_out <= 32'b0;
                rd_out <= 5'b0;
                func3_out <= 3'b0;
                MemtoReg_WB_out <= 1'b0;
                RegWrite_WB_out <= 1'b0;
                MemRead_MEM_out <= 1'b0;
                MemWrite_MEM_out <= 1'b0;
                Branch_MEM_out <= 1'b0;
            end
        else
            begin
                ALU_out <= ALU_in;
                zero_out <= zero_in;
                pc_out <= pc_in;
                reg2_data_out <= reg2_data_in;
                rd_out <= rd_in;
                func3_out <= func3_in;
                MemtoReg_WB_out <= MemtoReg_WB;
                RegWrite_WB_out <= RegWrite_WB;
                MemRead_MEM_out <= MemRead_MEM;
                MemWrite_MEM_out <= MemWrite_MEM;
                Branch_MEM_out <= Branch_MEM;
            end
        end
endmodule
