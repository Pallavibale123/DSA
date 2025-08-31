module testbench;
  
  function automatic byte bit_stream( byte array[2], integer unsigned frame_size, byte pattern);
    
    integer i,j;
    bit temp;
    byte local_pattern;
    
    $display("data_stream of bits are %0h and %0h", array[1], array[0]);
    
    if (!frame_size) return 0;
    
    for (i = 0; i < (frame_size * 8) - 8; i++)begin
      
      local_pattern=0;
      
      for (j = 0; j < 8; j++) begin
        
        temp =( array[(i+j)/8] >> ((i+j) % 8)) & 1;
        
        local_pattern |= temp << j;
        
      end
      $display("local pattern  = %0h", local_pattern);
        
      if (local_pattern == pattern) begin
        
        $display("Successfully found the pattern");
        $display("start bit is i = %0h", i);
        return 0;
      end
      
      
    end
    
    
  endfunction
  
  integer data;
  
  byte data_frame[2];
  
  initial begin
    
    data_frame = {8'hFF, 8'h12}; //0,1
  
    data = bit_stream(data_frame, 2, 8'hFF);
  
  end
  
  
endmodule
