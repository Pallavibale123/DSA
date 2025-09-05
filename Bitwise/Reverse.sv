

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
