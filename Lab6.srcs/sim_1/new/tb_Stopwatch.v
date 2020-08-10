`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2019 11:34:57 AM
// Design Name: 
// Module Name: tb_Stopwatch
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


module tb_Stopwatch;
    reg clk = 0;
    reg reset = 0;
    reg start = 0;
    reg [7:0] sw = 0;
    reg [1:0] mode = 0;
    wire [3:0] an;
    wire [6:0] sseg;
    wire dp;
    
    
    Stopwatch_main uut(.clk(clk), .reset(reset), .start(start), .sw(sw), .mode(mode), .an(an), .sseg(sseg), .dp(dp));
    
    always #5 clk = ~clk;
    
    initial begin
    mode = 2'b01;

    
    sw[7:4] = 1;
    sw[3:0] = 1;
    #200;
    mode = 2'b10;
    #100;
//    reset = 1;
    #10;
  //  reset = 0;
    #100;
    mode = 2'b11;
    #200;
 //   reset = 1;
    #100000;
    end
endmodule
