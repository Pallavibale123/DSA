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
