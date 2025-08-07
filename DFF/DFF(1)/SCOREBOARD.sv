class scoreboard;
  virtual intf vintf;
  mailbox m2s;
  event gn;
  
  function new(virtual intf vintf,mailbox m2s);
    this.vintf = vintf ;
    this.m2s = m2s ;
  endfunction
  
  task main();
    repeat(20)begin
     	transaction trans;
      	m2s.get(trans);
        $display(" SCOREBOARD CLASS DATA ");
      	$display("time =%0t,clk=%0b,rst=%0b,d=%0b,q=%0b",$time,vintf.clk,vintf.rst,trans.d,trans.q);

      
      	if(((vintf.rst == 0)&&(trans.q == trans.d))||((vintf.rst  == 1)&&(trans.q == 0)))
        	$display("		PASS		");
      	else 
        	$display("		FAIL		");
        
        ->gn;
      $display("-----------------------------------------------		");
      

      
    end
  endtask
endclass
