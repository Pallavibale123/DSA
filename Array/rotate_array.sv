//Q1. Right Rotation by k (without reverse, using extra array)
module testbench;
  task automatic right_rotate(input int arr[], input int k, output int rotated[]);//extra mem 
  int n = arr.size();
  rotated = new[n];
  k = k % n;
  for (int i = 0; i < n; i++)begin
    rotated[(k+i) % n]= arr[i];
  end
endtask

  initial begin
    int a[] = '{1,2,3,4,4,5};
    int rotated[];
    right_rotate(a, 2, rotated);
    $display("The rotate by k is %0p",rotated);
  end
endmodule
