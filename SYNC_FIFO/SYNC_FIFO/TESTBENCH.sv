`include "interface.sv"
`include "test.sv"

module testbench;
  logic clk;
  logic rst;
  logic en;
  
  intf vintf(clk,rst,en);
  test tst(vintf);
 fifo dut(
    .clk(vintf.clk),
    .rst(vintf.rst),
    .en(vintf.en),
    .data_in(vintf.data_in),
    .data_out(vintf.data_out),
    .full(vintf.full),
    .empty(vintf.empty)
);

  
  initial begin
    clk = 0 ;
    forever #5 clk = ~clk ;
  end
  initial begin
    rst = 1;en = 1;
    #10;
    rst = 0;
    #20;
    en = 1;
    #300;
    $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
