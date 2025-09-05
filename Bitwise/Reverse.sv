//Q1. Reverse integer
module testbench;
function automatic int reverse(input int n);
  int rev = 0;
  for(int i = 0; i <= 31; i++)begin
    rev = (rev << 1) | (n & 1);
    n = n >> 1;
  end
  return rev;
endfunction 
  
  initial begin
    int num = 32'hAABBCC11;
    int result;
    result = reverse(num);
    $display(" The num %0h is reverse = %0h", num, result);
    $finish;
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

//Q3. Reverse bits and check if the bit pattern is a palindrome.
module testbench;
  function automatic int unsigned reverse(input int unsigned n);
  int rev = 0;
  for(int i = 0; i < 32; i++)begin
    rev = (rev << 1) | (n & 1);
    n = n >> 1;
  end
  return rev;
endfunction 
  
  function automatic int unsigned palindrome(input int unsigned n);
    return (reverse(n)== n);
  endfunction
  
  initial begin
    int unsigned num = 32'b10000000000000000000000000000001;
    int result;
    result = palindrome(num);
    if(result)
      $display(" The num %0h is palindrome", num);
    else 
      $display(" The num %0h is not palindrome", num);
    $finish;
  end
endmodule
