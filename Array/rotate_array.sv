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

//Q2. Left Rotation by k (without reverse, using extra array)
module testbench;
task automatic left_rotate(input int arr[], input int k, output int rotated[]);
  int n = arr.size();
  rotated = new[n];
  k = k % n;
  for(int i = 0; i < n; i++)begin
    rotated[i] = arr[(i + k) % n];
  end
endtask
  
  initial begin
    int a[] = '{0,1,3,4,5,5,7};
    int rotated[];
    left_rotate(a, 4, rotated);
    $display("rotated array is %0p", rotated);
  end
endmodule
