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
