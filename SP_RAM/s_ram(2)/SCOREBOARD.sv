class scoreboard;
  transaction trans;
  mailbox m2s;
  event gn;
  
  bit [7:0]out;
  bit [7:0]mem_t[15:0];
  
  function new(mailbox m2s);
    this.m2s = m2s ;
  endfunction
  
  task main();
    forever begin
      m2s.get(trans);
      $display("	SCOREBOARD CLASS DATA	");
      $display("time=%0t,addr=%h,data_in=%h,data_out=%h",$time,trans.addr,trans.data_in,trans.data_out);
      
      if(trans.rst)
    		out = 8'b0 ;
  	  else begin
        if(trans.en)
          write();
    	else
          read();
  	  end
      
      $display("time=%0t,addr=%h,data_in=%h,out=%h",$time,trans.addr,trans.data_in,out);
      
      $display("-----------------------------------------------");
      if(out == trans.data_out)
        $display("		PASS		");
      else
        $display("		FAIL		");
      $display("------------------------------------------------");
    ->gn;     
    end

  endtask
  task write();
     mem_t[trans.addr] = trans.data_in ;
  endtask
  task read();
     out  			= mem_t[trans.addr] ;
  endtask
    
endclass
