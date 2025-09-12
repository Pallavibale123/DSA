module testbench;
  task automatic multi(input int a, input int b, output int product);
    product = 0;
    while(b != 0)begin
      if (b & 1) product += a;
      a = a << 1;
      b = b >> 1;
    end
  endtask
  
  task automatic array_product(input int a[], output int r[]);
    int after, temp;
    int n = a.size();
    r = new[n];
    r[0] = 1;
    
    for(int i = 1; i < n; i++)begin
      multi(r[i-1], a[i-1], r[i]);
    end
    
    after = 1;
    temp = 0;
    
    for(int i = n-1; i >= 0; i--)begin
      multi(after, r[i], temp);
      r[i] = temp;
      multi(after, a[i], after);
    end
  endtask
  
  initial begin
    int arr[] = '{2,3,4,5};
    int result[];
    array_product(arr, result);
    $display("The new array is %0p", result);
  end
endmodule
