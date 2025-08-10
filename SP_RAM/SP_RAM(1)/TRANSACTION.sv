class transaction;
  bit clk;
  bit rst;
  bit en;
  randc bit[7:0]data_in;
  randc  bit[3:0] addr;
  bit   [7:0]data_out;
  
  constraint ad_c{	addr == 4'hf ;}
  constraint in_c {	data_in < 20 ;}  
endclass
