//Q1. In-place reverse
module testbench;
  task automatic reverse(ref int unsigned a[]);
    int n = a.size();
    for(int i = 0; i <= n/2; i++)begin
      int temp = a[i];
      a[i] = a[n-1-i];
      a[n-1-i] = temp;
    end
  endtask
  
  initial begin
    int unsigned arr[] ='{0,1,3,5,7,8,32'hFFFFFFFF};
    
    reverse(arr);
    $display("The array is %0p", arr);
    $finish;
  end
endmodule

//Q2. with extra memory
module testbench;
  function automatic void reverse(input int unsigned arr[], output int unsigned rev[]);
    int n = arr.size();
    rev = new[n];   //allocate memory for ouput dynamic array at runtime
    for (int i = 0; i < n; i++)begin
      rev[n-1-i] = arr[i];
    end
   
  endfunction
  
  initial begin
    int unsigned a[] = '{0,1, 4, 7, 8, 32'hFFFFFFFF};
    int unsigned rev[];
    reverse(a,rev);
    $display("The reverse arr is %0p ",rev);
  end
endmodule
