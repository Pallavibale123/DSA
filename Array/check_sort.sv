module testbench;
  
  function automatic int check_sort(input int unsigned a[]);
    int n = a.size();
    bit as = 1;
    bit b = 1;
    if (n <= 1) return 3;
    for(int i = 0; i < n-1; i++)begin
      if(a[i] > a[i+1]) as = 0;
      if(a[i] < a[i+1]) b = 0;
    end
    if (as) return 0;
    else if(b) return 1;
    else return 2;
  endfunction
 
  initial begin
    int unsigned arr[] ='{ };
    int result;
    result = check_sort(arr);
   
    $display(" the result is %0d", result);
  end
endmodule
