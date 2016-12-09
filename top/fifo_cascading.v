`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Poyi Xiong
// 
// Create Date: 12/02/2016 10:35:19 AM
// Design Name: 
// Module Name: fifo_cascading
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//   This module cascading 2 fifo36s to increase deepth. 
//   The first FIFO is in FWFT mode, the second FIFO is in standard mode.
//   Use external resources to connect them together.
//   
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fifo_cascading(
    input [35:0] din,
    input rst,    
    input wr_en,
    input wr_clk,
    input int_clk,
    input rd_en,
    input rd_clk,
    output [35:0] dout,
    output empty,
    output full
    );
    wire en_contral; //this is control signal of fifo_fwft's rd_en and fifo_standard's wr_en.
    wire [35:0]dout_0;
    wire empty_0;
    wire full_1;
    
    assign en_control= ~(empty_0 + full_1);
    
    fifo_generator_0 fifo_0(
    .rst(rst),
    .wr_clk(wr_clk),
    .rd_clk(int_clk),
    .wr_en(wr_en),
    .rd_en(en_control),
    .din(din),
    .dout(dout_0),
    .empty(empty_0),
    .full(full)
    );
    
    fifo_standard fifo_1(
    .rst(rst),
    .wr_clk(int_clk),
    .rd_clk(rd_clk),
    .wr_en(en_control),
    .rd_en(rd_en),
    .din(dout_0),
    .dout(dout),
    .empty(empty),
    .full(full_1)
    );
    
    
endmodule
