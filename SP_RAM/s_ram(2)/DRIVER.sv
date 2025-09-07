class driver;
  transaction trans;
  mailbox g2d;
  virtual intf vintf;
  
  function new(mailbox g2d,virtual intf vintf);
    this.g2d   = g2d ;
    this.vintf = vintf;
  endfunction
  
  task main();
    forever begin
      g2d.get(trans);
      vintf.addr    = trans.addr ;
      vintf.data_in =  trans.data_in;
      $display("  DRIVER CLASS DATA  ");
      $display("$time=%0t,addr=%h,data_in=%h",$time,vintf.addr,vintf.data_in);
    end
  endtask
endclass
      
