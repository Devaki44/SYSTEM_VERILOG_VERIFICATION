class monitor;
  virtual intf vintf;
  mailbox m2s;
  
  function new(virtual intf vintf,mailbox m2s);
    this.vintf = vintf;
    this.m2s = m2s;
  endfunction
  
  task main();
    begin
      transaction trans;
      trans         = new();
      #1;
      trans.a 		= vintf.a ;
      trans.b	    = vintf.b ;
      trans.c 		= vintf.c ;
      trans.sum 	= vintf.sum ;
      trans.carry   = vintf.carry ;
      
      m2s.put(trans);
      #1;
      $display(" monitor class signals ");
      trans.display();
    end
  endtask
endclass
