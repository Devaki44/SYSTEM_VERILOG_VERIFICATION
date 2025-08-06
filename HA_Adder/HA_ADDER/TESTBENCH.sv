`include "interface.sv" 
`include "test.sv"

module testbench;
  intf vintf();
  test t1(vintf);
  ha dut(.a(vintf.a),
         .b(vintf.b),
         .sum(vintf.sum),
         .carry(vintf.carry));
endmodule
  
  
