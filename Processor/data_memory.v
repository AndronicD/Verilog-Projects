`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2023 16:25:33
// Design Name: 
// Module Name: data_memory
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


module data_memory(input clk,        
                   input mem_read,   //semnal de activare a citirii din memorie
                   input mem_write,  //semnal de activare a scrierii din memorie
                   input [31:0] address, //adresa de scriere/citire
                   input [31:0] write_data, //valoarea scrisa in memorie
                   output reg [31:0] read_data //valoarea citita din memorie
                   );
  reg [31:0] data_memory [0:1023];     
  integer i;
    
  initial begin
    for (i = 0; i < 1024; i = i + 1) begin
      data_memory[i] <= 32'b0;
    end
  end
  
  always@(posedge clk) begin
    if(mem_write)
      data_memory[address[11:2]] <= write_data;
  end
  
  always@(*) begin
    if(mem_read)
        read_data <= data_memory[address[11:2]];
  end
  
endmodule
