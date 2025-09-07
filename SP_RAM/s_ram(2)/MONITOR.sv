class monitor ;
  transaction trans;
  virtual intf vintf;
  mailbox m2s;
  
  function new(virtual intf vintf,mailbox m2s);
    this.vintf = vintf;
    this.m2s = m2s ;
  endfunction
 
  task main();
    trans = new();
    forever begin
      @(posedge vintf.clk)begin
       #1;
       trans.clk	=  vintf.clk;
       trans.rst	=  vintf.rst ;
       trans.en		=  vintf.en  ;
       trans.addr	=  vintf.addr;
       trans.data_in=  vintf.data_in;
       trans.data_out = vintf.data_out;
        
        m2s.put(trans);
        $display("  MONITOR CLASS DATA  ");
        $display("time=%0t,clk=%0b,rst=%0b,en=%0b,addr=%h,data_in=%h,data_out=%h",$time,trans.clk,trans.rst,trans.en,trans.addr,trans.data_in,trans.data_out);
                 
      end
    end
  endtask
endclass
    
