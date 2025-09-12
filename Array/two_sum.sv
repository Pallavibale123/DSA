//Q1. Find two values in the array which sums up to the target value

module testbench;
  task automatic two_sum(input int a[], int target, output int n1, n2);
    int n = a.size();
    int num1;
    int seen[int];
    for(int i = 0; i < n; i++)begin
      num1 = target - a[i];
      if(seen.exists(num1))begin
        n1 = num1;
        n2 = a[i];
        return;
      end
      seen[a[i]] = i;
    end  
  endtask

  initial begin
    int arr[] ='{0,1,2,3,4,7,89,8};
    int target = 10;
    int n1, n2;
    two_sum(arr, target, n1, n2);
    $display("The values are %0d and %0d", n1, n2);
  end
endmodule

//Q2. Find two indices in the array which sums up to the target value

module testbench;
  task automatic two_sum(input int a[], int target, output int n1, n2);
    int n = a.size();
    int num1;
    int seen[int];
    for(int i = 0; i < n; i++)begin
      num1 = target - a[i];
      if(seen.exists(num1))begin
        n1 = seen[num1];
        n2 = i;
        return;
      end
      seen[a[i]] = i;
    end  
  endtask

  initial begin
    int arr[] ='{0,1,2,3,4,7,89,8};
    int target = 10;
    int n1, n2;
    two_sum(arr, target, n1, n2);
    $display("The values are %0d and %0d", n1, n2);
  end
endmodule
