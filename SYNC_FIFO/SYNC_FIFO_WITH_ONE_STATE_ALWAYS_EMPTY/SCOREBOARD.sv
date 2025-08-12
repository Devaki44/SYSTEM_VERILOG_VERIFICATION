class scoreboard;
  transaction trans;
  mailbox m2s;
  event gn;
  bit [3:0] out;
  bit f;
  bit e;
  logic [3:0] queue[0:15];
  logic [3:0] w_p, r_p;
  
  function new(mailbox m2s);
    this.m2s = m2s;
  endfunction
  
  function bit is_f();
    return (w_p + 1'b1 == r_p);
  endfunction
  
  function bit is_e();
    return (w_p == r_p);
  endfunction
  
  task main();
    forever begin
      m2s.get(trans);
      $display("	SCOREBOARD	");
      
      // Logic
      if (trans.rst) begin
        out  = 0;
        w_p  = 0;
        r_p  = 0;
      end 
      else begin
        if (trans.en && !f) begin
          queue[w_p] = trans.data_in;
          w_p = w_p + 1'b1;
        end
        else if (!trans.en && !e) begin
          out = queue[r_p];
          r_p = r_p + 1'b1;
        end
      end
      
      // Update flags
      f = is_f();
      e = is_e();
      
      // Display results
      $display("time=%0t,rst=%0b,en=%0b,data_in=%h,data_out=%h,full=%0b,empty=%0b",
               $time, trans.rst, trans.en, trans.data_in, trans.data_out, trans.full, trans.empty);
      $display("time=%0t,rst=%0b,en=%0b,data_in=%h,data_out=%h,full=%0b,empty=%0b",
               $time, trans.rst, trans.en, trans.data_in, out, f, e);
      $display("-----------------------------------------------");
      
      if ((out == trans.data_out) && (f == trans.full) && (e == trans.empty))
        $display("PASS");
      else
        $display("FAIL");
      $display("-----------------------------------------------");
      
      ->gn;
    end
  endtask
endclass


