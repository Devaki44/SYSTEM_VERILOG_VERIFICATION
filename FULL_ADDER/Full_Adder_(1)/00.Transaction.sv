class transaction;
  rand bit a;
  rand bit b;
  rand bit c;
  	   bit sum;
  	   bit carry;
  
  function void display();
    $display(" a=%0b, b=%0b, c=%0b, sum =%0b, carry=%0b ",a,b,c,sum,carry);
  endfunction
endclass
  
  
