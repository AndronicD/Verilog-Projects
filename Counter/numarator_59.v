`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2021 08:36:37
// Design Name: 
// Module Name: numarator_59
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


module numarator_59(clock, pauza, reset, val_bin, carry_out );
input clock, reset, pauza;
output reg [5:0] val_bin;
output reg carry_out;

always@(posedge clock, posedge reset)
    begin 
        if(reset)
        begin
            val_bin = 0;
            carry_out = 0;
        end
    else 
        begin
            if(~pauza)
                begin 
                    val_bin = val_bin + 1;
                    carry_out = 0;
                    if(val_bin > 59)
                        begin
                            carry_out = 1;
                            val_bin = 0;
                        end
                end
        end
    end
endmodule
