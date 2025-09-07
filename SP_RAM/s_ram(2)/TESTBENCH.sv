`include "test.sv"
`include "interface.sv"

module testbench;
  logic clk,rst,en;
  
  
  intf vintf(clk,rst,en);
  test tst(vintf);
  s_ram dut(vintf.clk,vintf.rst,vintf.en,vintf.addr,vintf.data_in,vintf.data_out);
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk ;
  end
  initial begin
    rst = 1;
//     forever #20 rst = ~rst;
    #20;
    rst = 0;
  end
  initial begin
    en = 1;
    forever #10 en = ~en ;
  end
  initial begin
    #200;
    $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
  
