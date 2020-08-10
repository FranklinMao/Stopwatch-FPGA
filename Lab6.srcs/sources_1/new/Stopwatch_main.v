`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2019 06:51:22 PM
// Design Name: 
// Module Name: Stopwatch_main
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


module Stopwatch_main(
    input clk,
    input reset,
    input start,
    input [7:0] sw,
    input [1:0] mode,
    output [3:0] an,
    output [6:0] sseg,
    output dp
    );
    
    wire [3:0] out0, out1, out2, out3;
    wire [6:0] in0, in1, in2, in3;
    wire slow_clk;
    wire count_clk;
    reg [7:0] init;
    
    clkdiv c5 (.clk(clk), .reset(reset), .clk_out(slow_clk));
    clkdivcount c6 (.clk(clk), .reset(reset), .clk_out(count_clk));
    
    always@(*)
    begin
    if(mode[0] == 1) begin
        init = sw;
    end
    else if (mode == 2'b00) begin
        init = 0;
    end
    else if (mode == 2'b10) begin
        init = 8'b10011001;
    end
    end
    UPcount u0 (.initValue(init), .clk(count_clk), .reset(reset), .start(start), .mode(mode), .hundredth(out0), .tenth(out1), .one(out2), .ten(out3));
    
    hex2seg c1 (.SW(out0), .seg(in0));
    hex2seg c2 (.SW(out1), .seg(in1));
    hex2seg c3 (.SW(out2), .seg(in2));
    hex2seg c4 (.SW(out3), .seg(in3));
    

    time_mux_state_machine c7(
        .clk(slow_clk),
        .reset(reset),
        .in0(in0),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .an(an),
        .sseg(sseg),
        .dp(dp));
    
    
endmodule
