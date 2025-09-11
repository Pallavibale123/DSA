module testbench;
task automatic remove_duplicates(ref int a[]);
  int i = 0;
  int n = a.size();
  for(int j = 1; j < n; j++)begin
    if (a[i] != a[j])begin
      i += 1;
      a[i] = a[j];
    end
  end
  
  for(int pos = i+1; pos < n; pos++)begin
    a[pos] = 0;
  end
endtask
  
  initial begin
    int arr[] = '{0,2,4,4,4,5,6,7,7,32'hFFFFFF, 32'hFFFFFF};
    remove_duplicates(arr);
    $display("The new array is %0p", arr);
  end
endmodule
