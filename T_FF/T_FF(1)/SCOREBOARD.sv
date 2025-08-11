class scoreboard;
  transaction trans;
  mailbox m2s;
  event gn;
  bit out;
  
  
  function new(mailbox m2s);
    this.m2s = m2s ;
  endfunction
  
  task main();
    trans = new();
    forever begin
      m2s.get(trans);
      $display("  SCOREBOARD CLASS DATA  ");
      
      if(trans.rst)
      		out = 1'b0 ;
   	  else begin
        if(trans.t)
          out = ~out;
        else
          out =  out;
      end
      
      $display("time=%0t,rst=%0b,t=%0b,q=%0b",$time,trans.rst,trans.t,trans.q);
      $display("time=%0t,rst=%0b,t=%0b,out=%0b",$time,trans.rst,trans.t,out);
      
      $display("--------------------------------------------------------------------------------------");
      if(out == trans.q)
        $display("PASS");
      else
        $display("FAIL");
      
      $display("--------------------------------------------------------------------------------------");
      ->gn;
    end
    
  endtask
endclass
