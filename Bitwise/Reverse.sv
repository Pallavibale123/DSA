// Q1.Finding 8 bit pattern from bitstream

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

//Q2. Reverse bits within each byte instead of entire number

module testbench;
  function automatic int reverse_byte(input int data);
    int reverse_data = '0;
    for(int byte_index = 0; byte_index < 4; byte_index++)begin
      byte unsigned current_byte;
      byte unsigned reverse_byte;
      current_byte = data >> (8 * byte_index);
      for(int bit_index = 0; bit_index <= 7; bit_index++)begin
        if(current_byte[bit_index])
          reverse_byte[7-bit_index] = 1'b1;
      end
      reverse_data |= reverse_byte << (8 * byte_index);
    end
    return reverse_data;
  endfunction
  
  initial begin
    int dataset = 32'h0100A001;
    int result;
    result = reverse_byte(dataset);
    $display("The current data is %0h and the reversed data is %0h",dataset, result);
    $finish;
  end
endmodule
