module testbench;
  task automatic missing(input int a[],input int n, output int num1);
    int sum1, sum2;
    int f = a.size();
    sum1 = n*(n+1)/2;
   
    for(int i = 0; i< a.size(); i++)begin
      sum2 += a[i];
    end
    num1 = sum1 - sum2;
  endtask
  
  initial begin
    int arr[] ='{1,2,3,4,6,7,8,9};
    int n = 9;
    int num1;
    missing(arr, n, num1);
    $display("the missing number is %0d", num1);
  end
endmodule

//With Xor
module testbench;
  task automatic missing(input int a[],input int n, output int num1);
    int sum1, sum2;
    int f = a.size();
    for(int i = 1; i <= n; i++)begin
      sum1 ^= i;
    end
   
    for(int i = 0; i< a.size(); i++)begin
      sum2 ^= a[i];
    end
    num1 = sum1 ^ sum2;
  endtask
  
  initial begin
    int arr[] ='{1,2,3,4,6,7,8,9};
    int n = 9;
    int num1;
    missing(arr, n, num1);
    $display("the missing number is %0d", num1);
  end
endmodule
