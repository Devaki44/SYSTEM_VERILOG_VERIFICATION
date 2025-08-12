module fifo(
  input clk,
  input rst,
  input en,
  input 		[3:0]	data_in,
  output 	reg	[3:0]	data_out,
  output full,
  output empty);
  
  reg [3:0]	fifo[0:15];
  reg [3:0]	w_ptr,r_ptr;
  
  always@(posedge clk)begin
    if(rst)begin
      data_out <= 0 ;
      w_ptr    <= 0 ;
      r_ptr    <= 0 ;
    end
    else begin
      
      if(en && !full)begin
        fifo[w_ptr] <= data_in ;
        w_ptr 		<= w_ptr + 1'b1 ;
      end
      else if(!en && !empty) begin
        data_out    <= fifo[r_ptr] ;
        r_ptr		<= r_ptr + 1'b1  ;
      end
    end
  end
  
  assign full 	=  (w_ptr + 1'b1 == r_ptr) ? 1 : 0 ;
  assign empty  =  (w_ptr	     == r_ptr) ? 1 : 0 ;

endmodule
        
