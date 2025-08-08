`include "environment.sv"

program test(intf vintf);
  environment en;
  
  initial begin
    en = new(vintf);
    en.run();
  end
endprogram
             
