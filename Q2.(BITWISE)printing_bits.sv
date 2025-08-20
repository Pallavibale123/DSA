module testbench;
  
  function automatic integer print_bits(integer unsigned in);
    
     bit temp;
     integer i;
    $display("Number given is = %0h", in);
    for(i = 0; i<32; i++) begin
      
      temp = (in >> i) & 1;
      $display("Reading from position = %0d and val is = %0b", i, temp);
      
    end
    
  endfunction
  
  integer print;
  
  initial begin
    
    print = print_bits(32'h01);
    print = print_bits(32'h80000000);
    print = print_bits(32'h00);
    print = print_bits(32'hFFFFFFFF);
    
  end
  
endmodule
