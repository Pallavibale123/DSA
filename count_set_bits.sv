//Q1. Count number of set bits for integer.
module testbench;
  //automatic makes Each call gets its own copy of local variables. Local variables are stack-allocated and disappear when the function call ends
  function automatic int count_setbits(input int unsigned n);

    int count = 0;
    while (n != 0)begin
      n = n & (n-1);
      count = count + 1;
    end
    return count;
    
  endfunction
  
  initial begin
    int unsigned num;
    int result;
	int unsigned testing[7:0] = '{32'd0, 32'd1, 32'd2, 32'hFFFFFFFF, 32'd7, 32'd64, 32'd16, 32'd15};
    
    foreach (testing[i])begin
      num = testing[i];
      result = count_setbits(num);
      $display("The total number of 1's is = %0d for number = %0d", result, num);
    end
    $finish;
  end
  
endmodule

/*
The total number of 1's is = 0 for number = 0
The total number of 1's is = 1 for number = 1
The total number of 1's is = 1 for number = 2
The total number of 1's is = 32 for number = 4294967295
The total number of 1's is = 3 for number = 7
The total number of 1's is = 1 for number = 64
The total number of 1's is = 1 for number = 16
The total number of 1's is = 4 for number = 15
*/

//Q2. Count number of set bits in an entire array
module testbench;
  
  function int count_ones(input int unsigned n);
    int count = 0;
    while (n != 0)begin
      n = (n & (n - 1));
      count = count + 1;
    end
    return count;
  endfunction
  
  initial begin
    int unsigned testing[] = '{0, 3, 7, 32};
    int unsigned result, num;
    foreach(testing[i])begin
      num = testing[i];
      result = count_ones(num);
      $display("count of ones in number %0d is %0d", num, result);	
    end
    $finish;
  end
endmodule

/*
count of ones in number 0 is 0
count of ones in number 3 is 2
count of ones in number 7 is 5
count of ones in number 32 is 6
*/

//Q3. Count total number of set bits from number down to 1
module testbench;
  
  function automatic int count_ones(input int unsigned num);
    int max_count = 0;
    for (int i = num; i > 0; i-- )begin
      int count = 0;
      int temp = i;
      while (temp != 0 )begin
        temp = (temp & (temp - 1));
        count = count + 1;
      end

      max_count = max_count + count;
    end
    return max_count;
  endfunction
  
  initial begin
    int unsigned testing[] = '{0, 2, 3, 7, 32};
    int unsigned result, num;
    foreach(testing[i])begin
      num = testing[i];
      result = count_ones(num);
      $display("count of ones from 1 to the number %0d is %0d", num, result);	
    end
    $finish;
  end
endmodule

/* 
count of ones from 1 to the number 0 is 0
count of ones from 1 to the number 2 is 2
count of ones from 1 to the number 3 is 4
count of ones from 1 to the number 7 is 12
count of ones from 1 to the number 32 is 81
*/
