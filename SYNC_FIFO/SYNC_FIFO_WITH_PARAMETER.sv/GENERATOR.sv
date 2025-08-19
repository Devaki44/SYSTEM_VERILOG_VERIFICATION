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
          void'(trans.randomize());
          g2d.put(trans);
          $display("	GENERATOR	");
          $display("time=%0t,data_in=%h",$time,trans.data_in);
          @gn;
        end
  endtask
endclass
