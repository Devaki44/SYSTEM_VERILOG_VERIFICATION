class monitor;
  transaction trans;
  virtual intf vintf;
  mailbox m2s;
  
  function new(mailbox m2s,virtual intf vintf);
    this.m2s = m2s;
    this.vintf = vintf;
  endfunction
  
  task main();
    trans = new();
    forever begin

      @(negedge vintf.clk)begin
      m2s.put(trans);  
      trans.rst     <= vintf.rst;
      trans.en      <= vintf.en;
      trans.data_in <= vintf.data_in;
      trans.addr    <= vintf.addr;
      trans.data_out<= vintf.data_out;
      $display("	MONITOR CLASS DATA");
        $display("time=%0t,rst=%0b,en=%0b,data_in=%0b,addr=%0b,data_out=%0b",$time,trans.rst,trans.en,trans.data_in,trans.addr,trans.data_out);
      end
    end
  endtask
  
endclass
      
