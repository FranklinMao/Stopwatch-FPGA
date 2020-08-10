`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Franklin Mao
// 
// Create Date: 10/23/2019 10:50:24 PM
// Design Name: 
// Module Name: clkdiv
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


module clkdiv(
    input clk,
    input reset,
    output reg clk_out
    );
    
    //Initialize count register
    // Be sure to change the width of the counter 
    // between simulation and on-board implementation
    reg [24:0] count = 0; // reg [24:0]
    
    //use this line if you want to use bitmasking to
    //create your divider. (see background section.)
    //assign clk_out = count[15];
    initial clk_out = 0;
    always @(posedge clk) begin
        //if(reset) count = 0;
        count = count+1;
        
        // use this line if you want to use an if statement
        // to define your frequency
        // Change '10 to match desired frequency
        // remember that the count value only gives half the clock cycle.
        if(count == 5000)   //5000 
            begin
            clk_out = ~clk_out;
            count = 0;
            end
    end
endmodule
