`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2022 22:56:35
// Design Name: 
// Module Name: mealy
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


module mealy(input clk, reset, w, output reg z);
reg [2:0] current_state, next_state;
reg z_next;

always @(posedge clk, posedge reset)
begin
    if(reset == 1) current_state <= 3'b000;
    else
    current_state <= next_state;
    z <= z_next;
end

always @(current_state, w)
begin
    case(current_state)
    3'b000: 
    begin
        if (w == 1) begin
            z_next = 0;
            next_state = 3'b001;
        end
        else begin
            z_next = 0;
            next_state = 3'b000;
        end
    end 
    3'b001:
    begin
        if (w == 1) begin
            z_next = 0;
            next_state = 3'b011;
        end
        else begin
            z_next = 0;
            next_state = 3'b010;
        end
    end 
    3'b010: 
    begin
        if (w == 1) begin
            z_next = 1;
            next_state = 3'b001;    
        end
        else begin
            z_next = 0;
            next_state = 3'b000;
        end
    end 
    3'b011: 
    begin
        if (w == 1) begin
            z_next = 0;
            next_state = 3'b011;
        end
        else begin
            z_next = 1;
            next_state = 3'b010;
        end
    end 
    endcase
end
endmodule
