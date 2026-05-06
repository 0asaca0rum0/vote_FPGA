`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2026 05:01:11 PM
// Design Name: 
// Module Name: twohz
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


module twohz(
    input clk_100mhz,
    output clk2hz
    );
        
    
    reg [25:0] counter_reg = 0;
    reg clk_reg = 0 ;
    
    always @ (posedge clk_100mhz ) 
    begin 
    if (counter_reg == 24_999_999)
    begin 
    counter_reg <= 0;
    clk_reg <= ~clk_reg ;
    end
    else
        counter_reg <= counter_reg +1 ;
    end
        
    assign clk2hz =clk_reg ;
endmodule
