`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2016 01:28:42 PM
// Design Name: 
// Module Name: fifo_cas_testbench
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


module fifo_cas_testbench();
 reg rst, wr_clk, wr_en, int_clk, rd_clk, rd_en;
 reg [35:0] din;
 wire empty, full;
 wire [35:0] dout; 
    
 fifo_cascading DUT(
  .rst(rst),
  .wr_clk(wr_clk),
  .wr_en(wr_en),
  .int_clk(int_clk),
  .rd_clk(rd_clk),
  .rd_en(rd_en),
  .din(din),
  .dout(dout),
  .empty(empty),
  .full(full)
  );
    
 initial begin
  $dumpfile ("fifo.dump");
  $dumpvars (0, fifo_cascading);
 end
 
 initial begin
  wr_clk=0;
  forever #20 wr_clk= ~wr_clk;
 end
     
 initial begin
  int_clk=0;
  forever #20 int_clk=~int_clk;
 end
        
 initial begin
  rd_clk=0;
  forever #30 rd_clk= ~rd_clk;
 end
     
 initial begin
  rst=1;
  wr_en=0;
  rd_en=0;
  #200 rst=0;
  #120 wr_en=1;
  #41300 wr_en=0;
  #40 rd_en=1;
 end
     
 initial begin
  din= 36'b1;
  #360 din=36'b10;
  forever #40 din=din+1;
 end   
                
endmodule
