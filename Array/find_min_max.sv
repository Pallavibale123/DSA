module testbench;
  task automatic find_min_max(input int unsigned a[], output int unsigned max_val, output int unsigned min_val);
  max_val = a[0];
  min_val = a[0];
  
  for(int i = 1; i < a.size(); i++)begin
    if(a[i] > max_val) max_val = a[i];
    if(a[i] < min_val) min_val = a[i];
  end
endtask
  initial begin
    int unsigned min, max;
    int unsigned arr[] = '{0,1,3,5,6,8,32'hFFFFFFFF, 0,5};
    find_min_max(arr, max,min);
    $display(" max is %0d and min is %0d", max,min);
  end
endmodule
