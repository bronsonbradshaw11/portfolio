`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2025 01:49:29 PM
// Design Name: 
// Module Name: register
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


module register(
    input clk,
    input load,
    input rst,
    input [7:0] d,
    output reg [7:0] q
    );
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            q <= 8'b0;
        end else if (load) begin
            q <= d;
        end
    end
    
endmodule
