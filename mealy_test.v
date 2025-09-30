`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2025 01:58:11 PM
// Design Name: 
// Module Name: mealy_test
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


module mealy_test;
    reg b, clk;
    wire d;
    
    always begin
    #5 clk = ~clk;
    end 
    
    debounce #(.PRESCALER(2)) DUT(
        .btn_in(b),
        .clk(clk),
        .btn_out(d)
    );
    
    
    
    initial begin
    clk = 0;
    b = 0;
    #50;
    
    b = 1;
    #50;
    
    b = 0;
    #50;
    
    b = 1;
    #50;
    
    b = 0;
    #50;
    
    $finish;
    end
    
    
endmodule
