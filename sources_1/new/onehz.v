`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2026 04:50:07 PM
// Design Name: 
// Module Name: onehz
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


module onehz(
    input clk_100mhz,
    output  clk_1hz
    );
    
    
    reg [25:0] counter_reg = 0;
    reg clk_reg = 0 ;
    
    always @ (posedge clk_100mhz ) 
    begin 
    if (counter_reg == 49_999_999)
    begin 
    counter_reg <= 0;
    clk_reg <= ~clk_reg ;
    end
    else
        counter_reg <= counter_reg +1 ;
    end
        
    assign clk_1hz =clk_reg ;
    
    
endmodule
