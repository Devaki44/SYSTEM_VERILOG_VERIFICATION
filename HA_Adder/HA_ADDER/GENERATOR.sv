class generator;
  transaction trans;
  mailbox g2d;
  
  function new(mailbox g2d);
    this.g2d = g2d;
  endfunction
  
  task main();
   repeat(2)begin
    transaction trans;
    trans = new();
    void'(trans.randomize());
    g2d.put(trans);
    $display(" generator class data");
    trans.display();
    #5;
   end
  endtask
  
endclass
