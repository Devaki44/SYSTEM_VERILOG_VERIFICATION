class driver;
  transaction trans;
  mailbox g2d;
  virtual intf vintf;
  
  function new(virtual intf vintf,mailbox g2d);
    this.vintf = vintf;
    this.g2d = g2d;
  endfunction
  
  task main();
    forever begin
      g2d.get(trans);
      vintf.data_in = trans.data_in;
      vintf.addr    = trans.addr ;
      $display("	DRIVER CLASS DATA");
      $display("time=%0t,data_in=%h,addr=%h",$time,trans.data_in,trans.addr);
    end
  endtask
  
endclass
