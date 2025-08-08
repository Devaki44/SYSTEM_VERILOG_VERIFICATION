class scoreboard;
  transaction trans;
  mailbox m2s;
  event gn;
  bit[3:0]out=0;
  
  function new(mailbox m2s);
    this.m2s = m2s;
  endfunction
  
  task main();
    repeat(20)begin
      m2s.get(trans);
      $display("  SCOREBOARD CLASS DATA  ");
      trans.display();
      
      if(trans.rst)
        	out = 0;
      else begin
        if(trans.up_down)	out = out+1 ;
        else				out = out-1 ;
      end
      
      
      if(out == trans.count)
        $display("---------------------PASS--------------------");
      else
        $display("---------------------FAIL--------------------");
      
      ->gn;
    end
    
  endtask
  
endclass
