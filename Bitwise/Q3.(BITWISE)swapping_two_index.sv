module testbench;
  
  function automatic integer swap_bits(integer unsigned in, index1, index2);
    
    integer i;
    bit temp1, temp2;
    integer  unsigned mask=1;
    integer unsigned mask1;
    integer unsigned mask2;
    
    integer unsigned new_no = in;
    
    $display("Given number is = %0h(%0b), and  index1 is = %0d, and index2 is = %0d", new_no, new_no,index1, index2);
    
    if (index1 > 31 | index2 > 31) begin 
      $display("ERROR"); 
      return 0;
    end
    if (index1 != index2) begin
      
        temp1 = (in >> index1) & 1;
        temp2 = (in >> index2) & 1;

        $display("Bit at index1 is = %0b, Bit at index2 is = %0b", temp1, temp2);

            if (temp1 != temp2) begin
              temp1 = ~temp1;
              temp2 = ~temp2;
              
              mask1 = ~(mask<<index1);
              $display("mask 1 number = %0h(%0b)", mask1, mask1);
              
              $display("originial new number = %0h(%0b)", new_no, new_no);
              
              new_no &= mask1;
              $display("new 1 number = %0h(%0b)", new_no, new_no);
              
              mask2 = ~(mask<<index2);
              $display("mask 2 number = %0h(%0b)", mask2, mask2);
              new_no &= mask2;              
              $display("new 2 number = %0h(%0b)", new_no, new_no);
              new_no |= temp1 << index1;
              new_no |= temp2 << index2;
              $display("Swaped number = %0h(%0b)", new_no, new_no);

        	end
      		else begin
               $display("No need swap for number ");
            end
    end
    
  endfunction
  
  integer swap;
  
  initial begin
    swap = swap_bits(1, 31, 0);
    swap = swap_bits(32'hFFFFFFFF, 34, 0);
    swap = swap_bits(32'hFFFFFFFF, 9, 13);
    swap = swap_bits(0, 20, 14);
    swap = swap_bits(32'hA6, 7, 3);  
  end
  
endmodule
