module testbench;
  function automatic int check_sort(input int unsigned a[]);
    int asc =1;
    int des = 1;
    int n = a.size();
    if (n < 2) return -1;
    for(int i = 0; i < n-1; i++ )begin
      if(a[i] > a[i+1]) asc = 0;
      if(a[i] < a[i+1]) des = 0;
    end
    
    if(asc) return 1;
    else if(des)return 2;
    else return 3;
  endfunction
  
  initial begin 
    int unsigned arr[] = '{5,4,5,6};
    int result;
    result = check_sort(arr);
    if (result == 1) $display("The array is asending");
    if (result == 2) $display("The array is desending");
    if (result == -1) $display("The array is not sufficient");
    if (result == 3) $display("Can't check");
  end
endmodule
