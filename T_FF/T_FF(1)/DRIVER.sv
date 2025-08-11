class driver;
  transaction trans;
  mailbox g2d;
  virtual intf vintf;
  
  function new(mailbox g2d,virtual intf vintf);
    this.g2d = g2d ;
    this.vintf = vintf;
  endfunction
  
  task main();
    trans = new();
    forever begin
   	  g2d.get(trans);
    
      @(negedge vintf.clk)begin
        
      	vintf.t  = trans.t;
        #1;
      	$display("  DRIVER CLASS  ");
        $display("time=%0t,clk=%0b,rst=%0b,t=%0b,q=%0b",$time,vintf.clk,vintf.rst,trans.t,trans.q);
      end
     end
  endtask
endclass
