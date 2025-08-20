module testbench;
  
  function automatic integer no_of_ones(integer unsigned a);
  
  integer i;
  integer count = 0;
  integer max_count;
  
    
    $display("the given number is = %0d(%0b)", a,a);
  while (a != 0) begin
    
    a = a & (a-1);
    count = count +1;
    $display("The count is = %0d", count);
    
  end
  
  max_count = count;
    $display("The total number of 1's in an given integer is = %0d", max_count);
    
  endfunction
  
    integer unsigned b;
    
    initial begin
      
      b = no_of_ones(8);
      
      
    end
  
  
endmodule
