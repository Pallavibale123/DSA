module testbench;
  task automatic max_sum(input int a[], output int max);
    int n = a.size();
    int current = 0;
    max = 0;
    for(int i = 0; i < n; i++)begin
      current = (a[i] > (a[i] + current)) ? a[i]: (a[i] + current);
      
      if(max < current)begin
        max = current;
      end
    end
  endtask
  
  initial begin 
    int arr[] = '{-2, -3, 4, 5, -6, 7, 8, -2};
    int max;
    max_sum(arr, max);
    $display("the max sum is %0d", max);
  end
endmodule
