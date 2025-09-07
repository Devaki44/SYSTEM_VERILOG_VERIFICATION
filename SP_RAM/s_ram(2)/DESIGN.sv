module s_ram(
  input clk,rst,en,
  input [3:0]addr,
  input [7:0]data_in,
  output reg [7:0]data_out);
  
  reg [7:0]mem[15:0];
  
  always@(posedge clk)begin
  if(rst)
    data_out <= 8'b0 ;
  else begin
    if(en)
      mem[addr] <= data_in ;
    else
      data_out  <= mem[addr] ;
  end
  end
endmodule
  
