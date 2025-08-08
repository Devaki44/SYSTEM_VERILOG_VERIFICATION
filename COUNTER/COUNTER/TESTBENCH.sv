`include "interface.sv"
`include "test.sv"

module testbench;
  logic clk ;
  
  intf vintf(clk);
  test tst(vintf);
  up_down_counter dut(.clk(vintf.clk),
                      .rst(vintf.rst),
                      .up_down(vintf.up_down),
                      .count(vintf.count));
  
  initial begin
    clk = 0;
    
    forever #5 clk = ~clk ;
  end
  initial begin
    #5 vintf.rst = 1;
    #1000;
    $finish;
  end 
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
  
  
