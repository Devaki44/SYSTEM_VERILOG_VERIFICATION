`include "interface.sv"
`include "test.sv"

module testbench;
  logic clk; 
  logic rst;
  
  initial begin
    clk  = 0;
    forever #5 clk = ~clk ;
  end
  initial begin
    rst = 1;
    #15 rst = 0;
  end
    
  intf vintf(clk,rst);
  test tst(vintf);
  dff dut(.clk(vintf.clk),
          .rst(vintf.rst),
          .d(vintf.d),
          .q(vintf.q) );
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #1000;
    $finish;
  end
endmodule
    
