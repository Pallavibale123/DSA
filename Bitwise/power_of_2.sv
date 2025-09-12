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

//Q4. Check if a sum or product of numbers is power of 2.
module testbench;
  function automatic int power_of_2(input int unsigned n);
    return ((n > 0) && ((n & (n-1)) == 0)) ? 1 : 0;
  endfunction
  
  function automatic int add(input int unsigned a, input int unsigned b);
    int unsigned carry;
    while (b != 0)begin
      carry = a & b;
      a = a ^ b;
      b = carry << 1;
    end
    return a;
  endfunction
  
  function automatic int multi(input int unsigned a, b);
    int unsigned result = 0;
    while (b != 0)begin
      if (b & 1)
        result = add(result, a);
      a = a << 1;
      b = b >> 1;
    end
    return result;
  endfunction
  
  /*
7 x 4
a values (doubles each step): 7, 14, 28, 56
b values (binary):             100, 010, 001, 000
Only the last step (LSB of b=1) contributes: result = 28

  */
  
  initial begin
    int unsigned a, b;
    int unsigned sum, product;
    bit sum_is_pow2, prod_is_pow2;
    int unsigned data[][2] = '{'{0,0},'{2,2},'{32'hFFFFFFF, 15},'{7,7},'{8,-8}};
  
    foreach (data[i])begin
      a = data[i][0];
      b = data[i][1];
      sum = add(a,b);
      product = multi(a,b);
      
      sum_is_pow2 = power_of_2(sum);
      prod_is_pow2 = power_of_2(product);
      
      $display("a=%0d, b=%0d | sum=%0d (%0b) power_of_2=%0b | product=%0d (%0b) power_of_2=%0b",a, b, sum, sum, sum_is_pow2, product, product, prod_is_pow2);
      
    end
  $finish;
  end
  
endmodule
