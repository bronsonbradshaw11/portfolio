`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2025 02:16:14 PM
// Design Name: 
// Module Name: alu_test
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


module alu_test;
    reg clk;
    reg rst;
    reg btn1;
    reg btn2;
    reg [7:0] in;
    reg [2:0] sel;
    wire [7:0] Y;
    wire [6:0] seg;
    wire [3:0] an;
    
    alu_calculator UUT(
        .clk(clk),
        .rst(rst),
        .btn1(btn1),
        .btn2(btn2),
        .in(in),
        .sel(sel),
        .Y(Y),
        .seg(seg),
        .an(an)
    );
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end 
    
    integer i;
    initial begin
        rst = 1;
        btn1 = 0;
        btn2 = 0;
        in = 0;
        sel = 0;
        
        #20 rst = 0;
        #100;
        
        in = 8'b01010001;
        btn1 = 1; #100 btn1 = 0;
        #50;
        in = 8'b00000110;
        btn2 = 1; #100 btn2 = 0;
        #50;
        sel = 3'b000;
        for (i = 0; i < 8; i = i + 1) begin
            sel = sel + 3'b001;
            #100;
        end 
        
        #100;
        $finish;
    end
    
    
    
endmodule
