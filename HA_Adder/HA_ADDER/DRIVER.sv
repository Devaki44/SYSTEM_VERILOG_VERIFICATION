class driver;
  virtual intf vintf;
  mailbox g2d;
  
  function new(virtual intf vintf,mailbox g2d);
   this.vintf= vintf;
   this.g2d = g2d ;
  endfunction
  
  task main();
    repeat(2)begin
    
    transaction trans;
    g2d.get(trans);
    vintf.a = trans.a ;
    vintf.b = trans.b ;
    $display(" driver class data");
    trans.display();
    #5;    
   end
  endtask
  
endclass
