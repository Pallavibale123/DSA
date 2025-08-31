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

/* 
The next power of 2 for the number 0 is 1
 The next power of 2 for the number 1 is 1
 The next power of 2 for the number 2 is 2
 The next power of 2 for the number 3 is 4
 The next power of 2 for the number 4 is 4
 The next power of 2 for the number 7 is 8
 The next power of 2 for the number 16 is 16
 The next power of 2 for the number 16777215 is 16777216
 The next power of 2 for the number 4294967291 is 0
*/

//Q3. Count how many powers of 2 exist in an array.

module testbench;
  function int count_power(input int unsigned n);
    return ((n > 0) & (n & (n-1)) == 0) ? 1 : 0;
  endfunction
  
  initial begin
    int unsigned data[] ='{0, 2, 1, 3, 4, 15, 32'hFFFFFF};
    int unsigned result;
    int count = 0;
    foreach (data[i])begin
      result = count_power(data[i]);
      if(result == 1) count += 1;
      $display("The total count of numbers which are power of 2 are %0d", count);
    end
  end
endmodule

/*
The total count of numbers which are power of 2 are 0
The total count of numbers which are power of 2 are 1
The total count of numbers which are power of 2 are 2
The total count of numbers which are power of 2 are 2
The total count of numbers which are power of 2 are 3
The total count of numbers which are power of 2 are 3
The total count of numbers which are power of 2 are 3
*/
