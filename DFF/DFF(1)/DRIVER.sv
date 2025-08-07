class driver;
  virtual intf vintf;
  mailbox g2d;
  
  function new(virtual intf vintf,mailbox g2d);
    this.vintf = vintf;
    this.g2d = g2d ;
  endfunction
  
  task main();
    transaction trans;
    repeat(20)begin
      g2d.get(trans);
      @(posedge vintf.clk)begin
    	vintf.d   <= trans.d ; 
    	$display(" DRIVER CLASS DATA "); 
    	$display("time =%0t,clk=%0b,rst=%0b,d=%0b,q=%0b",$time,vintf.clk,vintf.rst,trans.d,trans.q);
      end     
    end
  endtask
  
endclass
