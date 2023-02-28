`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.10.2022 23:34:47
// Design Name: 
// Module Name: moore
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


module moore(clk, reset, w, z);
input clk, reset, w;
output reg z;
reg z_next;
reg [2:0] current_state, next_state;

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
        if (w == 1)
        next_state = 3'b001;
        else
        next_state = 3'b000;
    end 
    3'b001: begin
        if(w == 1)
        next_state = 3'b011;
        else 
        next_state = 3'b010;
    end
    3'b010: begin
        if(w == 1)
        next_state = 3'b100;
        else 
        next_state = 3'b000;
    end 
    3'b011: begin
        if(w == 1)
        next_state = 3'b011;
        else 
        next_state = 3'b101;
    end 
    3'b100: begin
        if(w == 1)
        next_state = 3'b011;
        else 
        next_state = 3'b010;
    end 
    3'b101: begin
        if(w == 1)
        next_state = 3'b100;
        else 
        next_state = 3'b010;
    end 
    endcase
end
always @(current_state)
begin 
 case(current_state) 
 3'b000: z_next=0;
 3'b001: z_next=0;
 3'b010: z_next=0;
 3'b011: z_next=0;
 3'b100: z_next=1;
 3'b101: z_next=1;
 default:  z_next = 0;
endcase
end 

endmodule
