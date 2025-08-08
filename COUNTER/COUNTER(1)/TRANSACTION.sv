class transaction;
  bit rst;
  bit en;
  randc bit[7:0]data_in;
  randc  bit[3:0] addr;
  bit   [7:0]data_out;
  
  constraint ad_c{	addr  inside {[2:4]} ;}
  constraint in_c {	data_in < 20 ;}  
endclass
