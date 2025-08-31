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

//Q4. Count number of set bits from a Range num1 to num 2
module testbench;

  function automatic int count_ones_in_range(input int unsigned num1, input int unsigned num2);
    int total = 0;
    int unsigned i;
    for (i = num1; i <= num2; i++) begin
      int unsigned temp = i;
      while (temp != 0) begin
        temp = temp & (temp - 1);
        total++;
      end
    end
    return total;
  endfunction

  initial begin
    int unsigned testing[][2] = '{ '{0,0}, '{1,1}, '{5,7} };
    int result;
    
    foreach(testing[i]) begin
      result = count_ones_in_range(testing[i][0], testing[i][1]);
      $display("The range is %0d to %0d and total count of ones is %0d",
                testing[i][0], testing[i][1], result);
    end
    $finish;
  end
endmodule


/* 
The range is 0 to 0 and total count of ones is 0
The range is 1 to 1 and total count of ones is 1
The range is 5 to 7 and total count of ones is 7
*/

//Q5. Find most frequent number of set bits in a dataset.
module testbench;
  function automatic int max_occurance_of_ones(input int unsigned n);
    int count = 0;
    while (n != 0)begin
      n = n & (n - 1);
      count += 1;
    end
    return count;
  endfunction
  
  initial begin
    int max_count = 0;
    int freq[32:0];
    int unsigned data[] = '{0, 1, 2, 3, 4, 5, 7,7,7,7};
    int cnt;
    int common_cnt;
    int num;
    foreach (data[i])begin
      num = data[i];
      cnt = max_occurance_of_ones(num);
      $display("The total count for number %0d is = %0d", num, cnt);
      freq[cnt] += 1;
      if (freq[cnt] > max_count)begin
        max_count = freq[cnt];
        common_cnt = cnt;
        $display("The common occurance of ones in the data set till this point is %0d",common_cnt);
      end
    end
    $display("The common occurance of ones in the data set is %0d",common_cnt);
    $finish;
  end
endmodule

/*
The total count for number 0 is = 0
The common occurance of ones in the data set till this point is 0
The total count for number 1 is = 1
The total count for number 2 is = 1
The common occurance of ones in the data set till this point is 1
The total count for number 3 is = 2
The total count for number 4 is = 1
The common occurance of ones in the data set till this point is 1
The total count for number 5 is = 2
The total count for number 7 is = 3
The total count for number 7 is = 3
The total count for number 7 is = 3
The total count for number 7 is = 3
The common occurance of ones in the data set till this point is 3
The common occurance of ones in the data set is 3
*/
