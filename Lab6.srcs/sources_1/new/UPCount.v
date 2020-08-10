`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Franklin Mao
// 
// Create Date: 11/24/2019 06:52:45 PM
// Design Name: 
// Module Name: UPcount
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


module UPcount(
    input [7:0] initValue,
    input clk,
    input reset,
    input start,
    input [1:0] mode,
    output [3:0] hundredth,
    output [3:0] tenth,
    output [3:0] one,
    output [3:0] ten
    );
    reg [13:0] value = 0;
    
    reg [3:0] firstval;
    reg [3:0] secondval;
    
/*    loadreg r0 (.clk(clk), .load(load), .D(initValue[7:4]), .Q(firstval));
    loadreg r1 (.clk(clk), .load(load), .D(initValue[3:0]), .Q(secondval)); */
    
    always@(posedge clk) begin
    if(initValue[7:4] > 9) begin
        firstval <= 9;
    end else begin
        firstval <= initValue[7:4];
    end
    if(initValue[3:0] > 9) begin
        secondval <= 9;
    end else begin    
    secondval <= initValue[3:0];
    end
    end
   
    assign hundredth = value % 10;
    assign tenth = (value/10) % 10;
    assign one = (value/100) % 10;
    assign ten = (value/1000) % 10;
    
    reg neg_ss;
    reg releasedflag;
    
    always@(posedge clk) begin
    
    neg_ss <= start;
    
    if (neg_ss && !start) begin
        releasedflag<=~releasedflag;
    end
    
    if (releasedflag) begin
        value <= value;
    end else if(mode[1] == 0 && value < 9999) begin
        value <= value + 1;
    end else if(mode[1] == 1 && value > 0) begin
        value <= value - 1;
    end
    
    if(reset) begin
        if(mode == 2'b10) begin
            value <= 9999;
        end else begin
            value <= (firstval *1000) + (secondval * 100);
        end
       
        releasedflag <= 1;
    end
    end
    

    
    
    
endmodule
