class monitor;
  transaction trans;
  mailbox m2s;
  virtual intf vintf;
  
  function new(mailbox m2s,virtual intf vintf);
    this.m2s = m2s ;
    this.vintf = vintf ;
  endfunction
  
  task main();
    trans = new();
    forever begin
      @(posedge vintf.clk)begin
        
      	trans.clk = vintf.clk ;
     	trans.rst = vintf.rst ;
      	trans.t	  = vintf.t   ;
        #2;        
        trans.q   = vintf.q   ;
        
        
        
        m2s.put(trans);
      
     	$display("  MONITOR CLASS DATA  ");
      	$display("time=%0t,clk=%0b,rst=%0b,t=%0b,q=%0b",$time,vintf.clk,trans.rst,trans.t,trans.q);
      end
    end
  endtask
endclass
      
