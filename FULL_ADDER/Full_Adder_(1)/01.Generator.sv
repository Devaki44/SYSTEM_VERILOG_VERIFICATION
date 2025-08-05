class generator;
  transaction trans;
  mailbox g2d;
  
  function new(mailbox g2d);
    this.g2d = g2d;
  endfunction
  
  task main();
   begin
    trans = new();		
    trans.randomize();
    $display(" generator class signals");
    g2d.put(trans);
    trans.display();
   end
  endtask
  
endclass
    
