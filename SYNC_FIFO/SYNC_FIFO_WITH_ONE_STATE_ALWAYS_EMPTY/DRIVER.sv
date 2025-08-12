class driver;
  transaction trans;
  mailbox g2d;
  virtual intf vintf;
  
  function new(mailbox g2d,virtual intf vintf);
    this.g2d   = g2d ;
    this.vintf = vintf;
  endfunction
  
  task main();
    forever begin 
      trans =  new() ;
//       @(negedge vintf.clk)begin
        g2d.get(trans);
        vintf.data_in = trans.data_in ;
        
        $display("	DRIVER  	");
        $display("time=%0t,clk=%0b,data_in=%h,rst =%0b,",$time,vintf.clk,trans.data_in,vintf.rst);
        
//       end
    end
  endtask
endclass
      
