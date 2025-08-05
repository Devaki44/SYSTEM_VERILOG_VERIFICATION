`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
// Code your design here

  generator gen;
  driver dri;
  monitor mon;
  scoreboard scb;
  
  mailbox g2d;
  mailbox m2s;
  virtual intf vintf;
  
  function new(virtual intf vintf);
    this.vintf = vintf;
    g2d = new() ;
    m2s = new();
    
    gen = new(g2d);
    dri = new(vintf,g2d);
    mon = new(vintf,m2s);
    scb = new(m2s);
  endfunction
    
  task run();
      fork
        gen.main();
        dri.main();
        mon.main();
        scb.main();
      join
  endtask
endclass
        
