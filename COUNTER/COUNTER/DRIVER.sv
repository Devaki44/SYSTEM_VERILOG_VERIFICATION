class driver;
  transaction trans;
  virtual intf vintf;
  mailbox g2d;
  
  function new(virtual intf vintf,mailbox g2d);
    this.vintf = vintf ;
    this.g2d = g2d ;
  endfunction
  
  task main();
    trans = new();
    repeat(20)begin
      g2d.get(trans);
       vintf.rst = trans.rst;
       vintf.up_down = trans.up_down;
       $display("  DRIVER CLASS DATA  ");
      $display("$time = %0t,rst = %0b,up_down = %0b,count =%b",$time,trans.rst,trans.up_down,trans.count);
     
    end
  endtask
  
endclass
      
