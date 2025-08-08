class monitor;
  transaction trans;
  virtual intf vintf;
  mailbox m2s;
  
  function new(virtual intf vintf,mailbox m2s);
    this.vintf = vintf;
    this.m2s = m2s;
  endfunction
  
  task main();
    trans = new();
    repeat(20)begin
      
      @(negedge vintf.clk)begin
//         #1;
       trans.rst = vintf.rst;
       trans.up_down = vintf.up_down ;
       trans.count = vintf.count ;
       m2s.put(trans);
       $display("  MONITOR CLASS DATA  ");
       $display("$time = %0t,clk=%0b,rst = %0b,up_down = %0b,count = %b",$time,vintf.clk,trans.rst,trans.up_down,trans.count);
      end
    end
  endtask
endclass
