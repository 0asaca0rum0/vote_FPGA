`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2026 11:48:32 AM
// Design Name: 
// Module Name: led_driver
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


module led_driver(
    input clk_2hz,
    input enable,
    output reg  [15:0] LED
    );
    
    parameter s0 = 16'h5555;
    parameter s1 = 16'hAAAA;
    
    reg ctr =0 ;
    always  @(posedge clk_2hz)
    ctr <= ~ctr;
    always @(posedge clk_2hz)
    if(enable)
        if(ctr ==0)
        LED = s0;
        else
        LED = s1;
    else
        LED = 16'h8001;
    
endmodule
