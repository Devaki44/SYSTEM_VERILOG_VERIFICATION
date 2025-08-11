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
    
     $display("  GENERATOR CLASS  ");
     $display("time=%0t,rst=%0b,t=%0b,q=%0b",$time,trans.rst,trans.t,trans.q);
     @gn;
    end
  endtask
  
endclass
