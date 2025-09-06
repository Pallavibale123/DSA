//Q1. Count trailing zeros in a number.
module testbench;
  function automatic int trailing_zeros(input int unsigned n);
    int count = 0;
    if(n == 0) return 32;
    while ((n & 1'b1) == 0) begin
      count += 1;
      n = n >> 1;
    end
    return count;
  endfunction
  
  initial begin
    int data[] = '{0, 1, 4, 6, 7, 32'h32};
    int result;
    foreach (data[i])begin
      result = trailing_zeros(data[i]);
      $display(" The total count of trailing zero's in number %0d is %0d", data[i], result);
    end
  end
endmodule

//Q2. Count leading zeros in a number.
module testbench;
  function automatic int leading_zeros(input int n);
    int count = 0;
    if(n == 0) return 32;
    for(int i = 31; i >= 0; i--)begin
      if((n >> i) & 1)begin
      return count;
      end
      count += 1;
      end
    return count;
  endfunction
  
  initial begin
    int data[] = '{0,1,3,4,32'hFFFFFFFF, 255};
    int result;
    foreach (data[i])begin
      result = leading_zeros(data[i]);
      $display(" The number %0d has total leading zero's of %0d", data[i], result);
    end
  end
endmodule

//Q3. Find position of first ‘1’ in a register
module testbench;
  function automatic int position_of_first_setbit(input int n);
    if(n == 0) return -1;
    for(int i = 0; i < 32; i++)begin
      if((n >> i) & 1)begin
      return i;
      end 
      end
  endfunction
  
  initial begin
    int data[] = '{0,1,3,4,32'hFFFFFFFE, 32'h80000000,255};
    int result;
    foreach (data[i])begin
      result = position_of_first_setbit(data[i]);
      $display(" The number %0d has first set bit at %0d", data[i], result);
    end
  end
endmodule
