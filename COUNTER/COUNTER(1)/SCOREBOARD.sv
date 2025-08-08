class scoreboard;
  transaction trans;
  mailbox m2s;
  event gn;
  bit[7:0]out;
  bit [3:0]mem_t[15:0];
  
  
  function new(mailbox m2s);
    this.m2s = m2s;
  endfunction
  
  task main();
    forever begin
    m2s.get(trans);
    $display("	SCOREBOARD CLASS DATA");
      $display("time=%0t,data_in=%0b,addr=%0b,data_out=%0b",$time,trans.data_in,trans.addr,trans.data_out);
    
      if(trans.rst)
      out <= 4'b0000 ;
    else begin
      if(trans.en)
        mem_t[trans.addr] <= trans.data_in ;
      else
        out 	  		  <= mem_t[trans.addr] ;
    end
    $display("-----------------------------------------------");
    if(out == trans.data_out)
      $display("PASS");
    else
      $display("FAIL");
      $display("-----------------------------------------------");
    ->gn;
    end
  endtask
endclass
