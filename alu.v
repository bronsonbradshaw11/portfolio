`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2025 03:28:14 PM
// Design Name: 
// Module Name: alu
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


module alu(
    input [7:0] A,
    input [7:0] B,
    input [2:0] sel,
    output reg [7:0] Y
    );
    
    
    always @(*) begin
        case(sel)
            3'b000: Y = A + B;
            3'b001: Y = A - B;
            3'b010: Y = A * B;
            3'b011: if (B == 0) begin
                        Y = 8'hFF;
                        
                    end else 
                        Y = A / B;
            3'b100: Y = A<<B;
            3'b101: Y = A>>B;
            3'b110: Y = A | B;
            3'b111: Y = A & B;
            default: Y = 8'b0;
        endcase 
    end
    
    
endmodule
