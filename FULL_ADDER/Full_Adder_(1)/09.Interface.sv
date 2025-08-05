//interface
interface intf();
  logic a,b,c;
  logic sum,carry;
  
  modport des(input a,b,c,output sum,carry);
endinterface
