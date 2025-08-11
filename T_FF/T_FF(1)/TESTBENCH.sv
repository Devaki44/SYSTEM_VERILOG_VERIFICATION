`include "interface.sv"
`include "test.sv"

module testbench;
  logic clk;
  logic  rst;
  
  intf vintf(clk,rst);
  test tst(vintf);
  tff dut(.clk(vintf.clk),
          .rst(vintf.rst),
          .t(vintf.t),
          .q(vintf.q));
  
  initial begin
    clk = 0;
    forever #5 clk  = ~clk ;
  end
  initial begin
    rst =1;
    #20;
    rst = 0;
    #100;
    $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
