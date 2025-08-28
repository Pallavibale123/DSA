module testbench;
  //automatic makes Each call gets its own copy of local variables. Local variables are stack-allocated and disappear when the function call ends
  function automatic integer count_setbits(input int unsigned n);

    integer count = 0;
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
the given number is = 0(0)
The total number of 1's is = 0
the given number is = 1(1)
The total number of 1's is = 1
the given number is = 2(10)
The total number of 1's is = 1
the given number is = 4294967295(11111111111111111111111111111111)
The total number of 1's is = 32
the given number is = 7(111)
The total number of 1's is = 3
the given number is = 64(1000000)
The total number of 1's is = 1
the given number is = 16(10000)
The total number of 1's is = 1
the given number is = 15(1111)
The total number of 1's is = 4
*/
