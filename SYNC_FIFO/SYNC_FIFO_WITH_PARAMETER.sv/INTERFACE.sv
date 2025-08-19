interface intf(input logic clk,rst,en);
  logic  [3:0]	data_in;
  logic  [3:0]	data_out;
  logic  full;
  logic  empty;
endinterface
