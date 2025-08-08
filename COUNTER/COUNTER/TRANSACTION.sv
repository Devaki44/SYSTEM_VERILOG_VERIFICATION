class transaction;
  rand bit rst;
  rand bit up_down;
  bit [3:0]count; 
  constraint rst_c{ rst dist {0:=10,1:=10};}
  function void display();
    $display("$time = %0t,rst = %0b,up_down = %0b,count = %b",$time,rst,up_down,count);
  endfunction
endclass
