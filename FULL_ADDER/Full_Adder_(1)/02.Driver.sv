class driver;
  mailbox g2d;
  virtual intf vintf;
  
  function new(virtual intf vintf ,mailbox g2d);
    this.vintf = vintf;
    this.g2d = g2d;
  endfunction
  
  task main();
   begin
    transaction trans;
    g2d.get(trans);
    vintf.a = trans.a ;
    vintf.b = trans.b ;
    vintf.c = trans.c ;
    #1;
    $display(" driver class signals ");
    trans.display();
   end
  endtask
endclass
