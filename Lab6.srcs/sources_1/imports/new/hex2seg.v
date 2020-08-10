`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2019 03:03:30 AM
// Design Name: 
// Module Name: hex2seg
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


module hex2seg(
    input [3:0] SW,
    output reg [6:0] seg
    );
    
    always @(*) begin
        case(SW)
            4'b0000: begin 
                seg = 7'b0000001;
            end
            4'b0001: begin 
                seg = 7'b1001111;
            end
            4'b0010: begin 
                seg = 7'b0010010;
            end
            4'b0011: begin 
                seg = 7'b0000110;
            end
            4'b0100: begin 
                seg = 7'b1001100;
            end
            4'b0101: begin 
                seg = 7'b0100100;
            end
            4'b0110: begin 
                seg = 7'b0100000;
            end
            4'b0111: begin 
                seg = 7'b0001111;
            end
            4'b1000: begin 
                seg = 7'b0000000;
            end
            4'b1001: begin 
                seg = 7'b0000100;
            end
            4'b1010: begin 
                seg = 7'b0001000;
            end
            4'b1011: begin 
                seg = 7'b1100000;
            end
            4'b1100: begin 
                seg = 7'b0110001;
            end
            4'b1101: begin 
                seg = 7'b1000010;
            end
            4'b1110: begin 
                seg = 7'b0110000;
            end
            4'b1111: begin 
                seg = 7'b0111000;
            end
        endcase
    end 
endmodule
