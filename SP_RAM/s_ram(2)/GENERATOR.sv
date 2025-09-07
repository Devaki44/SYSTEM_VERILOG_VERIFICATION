class generator;
  transaction trans;
  mailbox g2d;
  event gn;
  
  function new(mailbox g2d);
    this.g2d = g2d ;
  endfunction
  
  task main();
    trans = new();
    forever begin
      void'(trans.randomize());;
      g2d.put(trans);
      $display("	GENERATOR CLASS DATA  ");
      $display("time=%0t,addr=%h,data_in=%h",$time,trans.addr,trans.data_in);
      @gn;
    end
  endtask
endclass
      
