class generator;
  transaction trans;
  mailbox g2d;
  virtual intf vintf;
  event gn;
  
  function new(virtual intf vintf,mailbox g2d);
    this.vintf = vintf;
    this.g2d = g2d ;
  endfunction
  
  task main();
    trans = new();

    repeat(20)begin
        void'(trans.randomize());
      	g2d.put(trans);
    	$display(" GENERATOR CLASS DATA ");
    	$display("time =%0t,clk=%0b,rst=%0b,d=%0b,q=%0b",$time,vintf.clk,vintf.rst,trans.d,trans.q);
      
  		@(gn);       
    end
  endtask
  
endclass

