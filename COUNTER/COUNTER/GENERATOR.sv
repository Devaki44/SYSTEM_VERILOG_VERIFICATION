class generator;
  transaction trans;
  mailbox g2d;
  event gn;
  
  function new(mailbox g2d);
    this.g2d = g2d;
  endfunction
  
  task main();
    trans = new();
    
    repeat(20)begin
      void'(trans.randomize());
      g2d.put(trans);
      $display("  GENERATOR CLASS DATA  ");
      trans.display();
      @gn;
    end
  endtask
  
endclass
