module testbench;
  function automatic integer reverse(input a);
    begin
      integer i,b;
      bit temp;
      $display("a = %0h", a);
    	b = 0;

    	for(i =0; i<32; i++) begin
        temp = (a>>i) & 1;
        b |= temp<<(31-i);
   		end
      reverse = b;
    end
    
  endfunction
  
  integer rev;
  initial begin
    rev = 0;
    #1;
	$display("reverse = %0h", rev);
    rev = reverse(32'h01);
    $display("reverse = %0h", rev);
    $finish;
  end
  
endmodule
