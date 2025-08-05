class scoreboard;
  mailbox m2s;
  
  function new(mailbox m2s);
    this.m2s = m2s;
  endfunction
  
  task main();
    begin 
      transaction trans;
      m2s.get(trans);
      #1;
      $display(" Scoreboard signals ");
      
      if (((trans.a ^ trans.b ^ trans.c) == trans.sum) &&
    (((trans.a & trans.b) | (trans.b & trans.c) | (trans.c & trans.a)) == trans.carry))

        $display(" PASS ");
      else
        $display(" FAIL ");
      
    end
  endtask
endclass
        
      
