`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/21/2025 03:12:51 PM
// Design Name: 
// Module Name: SevenSegmentTruthTable
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


module SevenSegmentTruthTable(
    input clk,
    input [15:0] N,
    output reg [6:0] D,
    output reg [3:0] an
    );
    
    reg [3:0] current;
    reg [1:0] digit_sel = 0;
    reg [19:0] refresh = 0;
    
 always @(posedge clk) begin
    refresh <= refresh + 1;
    
    digit_sel <= refresh[15:14];
    
    case(digit_sel)
        2'b00: begin
            an <= 4'b1110;
            current <= N[3:0];
        end 
        2'b01: begin
            an <= 4'b1101;
            current <= N[7:4];
        end 
        2'b10: begin
            an <= 4'b1011;
            current <= N[11:8];
        end 
        2'b11: begin
            an <= 4'b0111;
            current <= N[15:12];
        end
    endcase 
end

    
    
always @(*) begin
    case (current)
        4'h0: D = 7'b1000000;  
        4'h1: D = 7'b1111001;  
        4'h2: D = 7'b0100100;  
        4'h3: D = 7'b0110000;  
        4'h4: D = 7'b0011001;  
        4'h5: D = 7'b0010010;  
        4'h6: D = 7'b0000010;  
        4'h7: D = 7'b1111000;  
        4'h8: D = 7'b0000000;  
        4'h9: D = 7'b0010000;  
        4'hA: D = 7'b0001000;  
        4'hB: D = 7'b0000011;  
        4'hC: D = 7'b1000110;  
        4'hD: D = 7'b0100001;  
        4'hE: D = 7'b0000110;  
        4'hF: D = 7'b0001110;  
        default: D = 7'b0111111;
    endcase
end



endmodule