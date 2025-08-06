class scoreboard;
  mailbox m2s;
  
  function new(mailbox m2s);
    this.m2s = m2s ;
  endfunction
  
  task main();
    repeat(2)begin
    transaction trans;
    m2s.get(trans);
    $display(" scoreboard class signals");
    trans.display();
    
    if(((trans.a ^ trans.b)==(trans.sum))&&((trans.a & trans.b)== (trans.carry)))
      $display("PASS");
    else
      $display("FAIL");
    #5;
   end
  endtask
endclass
