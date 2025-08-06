class monitor;
  virtual intf vintf;
  mailbox m2s;
  
  function new(virtual intf vintf,mailbox m2s);
    this.vintf = vintf;
    this.m2s = m2s;
  endfunction
  
  task main();
    repeat(2)begin
    
    transaction trans;
    trans = new();
     #2;
    trans.a = vintf.a ;
    trans.b = vintf.b ;
    trans.sum = vintf.sum ;
    trans.carry = vintf.carry ;
    m2s.put(trans);
    $display("monitor class data");
    trans.display();
    #3;
   end
  endtask
endclass
