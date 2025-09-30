`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2025 12:41:18 PM
// Design Name: 
// Module Name: debounce
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


module  debounce #(parameter PRESCALER = 25)(
    input clk,
    input btn_in,
    output reg btn_out
    );
    
    reg [19:0] counter;
    reg btn_sync;
    reg btn_state;
    
    always @(posedge clk) begin
        btn_sync <= btn_in;
        
        if (btn_sync ^ btn_in) begin
            counter <= 0;
        end else if (counter < PRESCALER) begin
            counter <= counter + 1;
        end else begin
            
        end
    end
    
endmodule
