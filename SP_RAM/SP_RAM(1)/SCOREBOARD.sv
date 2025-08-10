
class scoreboard;
  transaction trans;
  mailbox m2s;
  event gn;
  bit [7:0] out = '0;
  bit [7:0] mem_t[15:0];
  
  function new(mailbox m2s);
    this.m2s = m2s;
  endfunction

  task main();
    trans = new();
    forever begin
      m2s.get(trans);
      $display("    SCOREBOARD CLASS DATA");

      if (trans.rst) begin
        out = 8'b0;
      end
      else begin
        if (trans.en) 
          mem_t[trans.addr] = trans.data_in;
        else 
          out 				= mem_t[trans.addr];
      end

      $display("time=%0t,rst=%0b,en=%0b,data_in=%h,addr=%h,data_out=%h",
                $time, trans.rst, trans.en, trans.data_in, trans.addr, trans.data_out);
      $display("time=%0t,rst=%0b,en=%0b,data_in=%h,addr=%h,out=%h",
                $time, trans.rst, trans.en, trans.data_in, trans.addr, out);

      $display("-----------------------------------------------");


        if (out == trans.data_out)
          $display("PASS");
        else
          $display("FAIL");


      $display("-----------------------------------------------");
      ->gn;
    end
  endtask
endclass
