class monitor;
  virtual intf vintf;
  mailbox m2s;
  
  function new(virtual intf vintf,mailbox m2s);
    this.vintf = vintf ;
    this.m2s = m2s ;
  endfunction
  
  task main();
    transaction trans;
    trans = new();
    
    repeat(20)begin
      @(posedge vintf.clk)begin
    	trans.d   = vintf.d ;
      	#1;
   	    trans.q   = vintf.q ;
    	m2s.put(trans);
    	$display(" MONITOR CLASS DATA ");
    	$display("time =%0t,clk=%0b,rst=%0b,d=%0b,q=%0b",$time,vintf.clk,vintf.rst,trans.d,trans.q);
      end
   end
  endtask
endclass


