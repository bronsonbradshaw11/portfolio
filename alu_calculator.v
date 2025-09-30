`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2025 02:07:07 PM
// Design Name: 
// Module Name: alu_calculator
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


module alu_calculator(
    input clk,
    input rst,
    input btn1,
    input btn2,
    input [7:0] in,
    input [2:0] sel,
    output [7:0] Y,
    output [6:0] seg,
    output [3:0] an
    );
    
    wire [7:0] A,B;
    wire [15:0] result;
    wire btn1_db, btn2_db;
    
    mealy deb_btn1(.clk(clk), .b(btn1), .d(btn1_db));
    mealy deb_btn2(.clk(clk), .b(btn2), .d(btn2_db));
    
    register a(
        .clk(clk),
        .rst(rst),
        .load(btn1_db),
        .d(in),
        .q(A)
    );
    
    register b(
        .clk(clk),
        .rst(rst),
        .load(btn2_db),
        .d(in),
        .q(B)
    );
    
    alu DUT(
        .A(A),
        .B(B),
        .sel(sel),
        .Y(result)
    );
    
    SevenSegmentTruthTable t(
        .clk(clk),
        .N(result),
        .D(seg),
        .an(an)
    );
    
    assign Y = result[7:0];
    
    
    
endmodule
