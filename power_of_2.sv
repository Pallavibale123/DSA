//Q1. Check if a number is power of 2.

module testbench;
  // main function to test if the number is power of 2 using bitwise 
  function bit power_of_two(input integer n);
    return (n > 0) && ((n & (n-1)) == 0);
  endfunction
  initial begin
    integer num;
    integer testing[7:0] = '{0,1,2,3,4,7,8,-8};
    foreach (testing[i])begin
      num = testing[i];
      if(power_of_two(num)) $display("Passing for num = %0d", num);
      else $display("Failing for num = %0d", num);
    end
    $finish;
  end
endmodule

//Q2. Find the next higher power of 2 for a number.

module testbench;
  function automatic int next_power_of_2(input int unsigned n);
    if (n == 1) return 1;
    if (n == 0) return 1;
    else begin
    n = n-1;
    n |= n >> 1;
    n |= n >> 2;
    n |= n >> 4;
    n |= n >> 8;
    n |= n >> 16;
    end
    return n + 1;
  endfunction
  
  initial begin
    int unsigned data[] = '{0,1,2,3,4,7,16,32'hFFFFFF, -5};
    int unsigned result;
    foreach (data[i])begin
      result = next_power_of_2(data[i]);
      $display(" The next power of 2 for the number %0d is %0d", data[i], result);
    end
  end
endmodule
