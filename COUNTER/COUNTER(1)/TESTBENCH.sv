`include "interface.sv"
`include "test.sv"

module testbench;
  logic clk;
  logic rst;
  logic en;
  
  intf vintf(clk,rst,en);
  test tst(vintf);
  s_ram dut(.clk(vintf.clk),
            .rst(vintf.rst),
            .en(vintf.en),
            .data_in(vintf.data_in),
            .addr(vintf.addr),
            .data_out(vintf.data_out));
  
  
 
  initial begin
    clk=0;
    forever #5  clk = ~clk  ;
  end
  initial begin
    rst = 1;
    #20;
    rst = 0;
  end
  initial begin
    en = 0;
    forever #20 en = ~en ;
    #2000;
    $finish;
  end
    
  initial begin
    $dumpfile("dumpvars.vcd");
    $dumpvars;
  end
endmodule
