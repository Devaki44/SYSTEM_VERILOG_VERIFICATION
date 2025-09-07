class transaction;
  bit clk;
  bit rst;
  bit en;
  randc bit [3:0]addr;
  randc bit [7:0]data_in;
  bit [7:0]data_out;
  
  constraint ad_c{addr inside {[5:7]};}
  constraint in_c{data_in inside {[0:127]};}
endclass
