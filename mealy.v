`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2025 01:52:09 PM
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


module mealy(
    input b, clk,
    output reg d
    );
    
    reg [1:0] state, nextState;
    
    always @ (posedge clk) begin
        state <= nextState;
    end
    
    always @ (state or b) begin
        case (state)
            2'b00: begin
                nextState <= b ? 2'b01 : 2'b00;
                d = 0;
            end
            2'b01: begin
                nextState <= b ? 2'b11 : 2'b00;
                d = 0;
            end 
            2'b11: begin
                nextState <= b ? 2'b11 : 2'b10;
                d = 0;
            end 
            2'b10: begin
                nextState <= b ? 2'b01 : 2'b00;
                d = 1;
            end
            default: begin
                nextState = 2'b00;
                d = 0;
            end
         endcase 
     end
endmodule
