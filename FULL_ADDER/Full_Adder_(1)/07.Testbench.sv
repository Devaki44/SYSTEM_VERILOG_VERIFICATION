`include "interface.sv"
`include "test.sv"

module fa_tb;
  
  intf d2();
  test tst(d2);
  fa dut(d2);
  
endmodule
