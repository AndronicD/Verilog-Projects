`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2023 15:51:24
// Design Name: 
// Module Name: mux3_1
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


module mux3_1(input [31:0] ina, inb, inc,
              input [1:0] sel,
              output reg [31:0] out);

always@(ina, inb, inc, sel)
    begin
        case(sel)
            2'b00: out <= ina;
            2'b01: out <= inb;
            2'b10: out <= inc;
        endcase
    end

endmodule
