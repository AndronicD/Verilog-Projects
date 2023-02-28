`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2023 19:35:50
// Design Name: 
// Module Name: mem_wb
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


module mem_wb(input clk, reset,
              input MemtoReg_WB, RegWrite_WB,
              input [31:0] data_in,
              input [31:0] alu_in,
              input [4:0] rd_in,
              output reg MemtoReg_WB_out, RegWrite_WB_out,
              output reg [31:0] data_out,
              output reg [31:0] alu_out,
              output reg [4:0] rd_out);
    always@(posedge clk)
    begin
        if (reset)
            begin
                MemtoReg_WB_out <= 1'b0;
                RegWrite_WB_out <= 1'b0;
                data_out <= 32'b0;
                alu_out <= 32'b0;
                rd_out <= 5'b0;
            end
        else
            begin
                MemtoReg_WB_out <= MemtoReg_WB;
                RegWrite_WB_out <= RegWrite_WB;
                data_out <= data_in;
                alu_out <= alu_in;
                rd_out <= rd_in;
            end
    end           
endmodule
