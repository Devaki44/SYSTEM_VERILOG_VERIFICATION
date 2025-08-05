`include "interface.sv"


//design code
module fa(intf.des d1);
  
  assign {d1.carry,d1.sum} = d1.a + d1.b + d1.c;
endmodule
