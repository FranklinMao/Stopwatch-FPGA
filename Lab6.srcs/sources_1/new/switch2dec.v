`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2019 08:45:35 PM
// Design Name: 
// Module Name: switch2dec
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


module switch2dec(
    input [3:0] binary,
    output reg [3:0] dec
    );
    
    always@(*) begin
    case(binary)
        4'b0000: dec = 4'd0000;
        4'b0001: dec = 4'd0001;
        4'b0010: dec = 4'd0002;
        4'b0011: dec = 4'd0003;
        4'b0100: dec = 4'd0004;
        4'b0101: dec = 4'd0005;
        4'b0110: dec = 4'd0006;
        4'b0111: dec = 4'd0007;
        4'b1000: dec = 4'd0008;
        4'b1001: dec = 4'd0009;
        4'b1010: dec = 4'd0009;
        4'b1011: dec = 4'd0009;
        4'b1100: dec = 4'd0009;
        4'b1101: dec = 4'd0009;
        4'b1110: dec = 4'd0009;
        4'b1111: dec = 4'd0009;
    endcase
    end
endmodule
