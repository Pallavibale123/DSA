//Q1. Find the unique number in an array where others appear thrice.

module testbench;
  function automatic int unique_data(input int unsigned arr[]);
    int count[31:0];
    int unsigned result;
    foreach (arr[i])begin
      for(int b = 0; b <=31; b++)begin
        count[b] += (arr[i] >> b) & 1;
      end
    end
    for(int b = 0; b <= 31; b++)begin
      if((count[b] % 3) != 0)begin
        result |= 1 << b;
      end
    end
    return result;
  endfunction
  initial begin
    int unsigned arr[] = '{0,1,2,3,1,2,3,0,2,1,0,7,3};
    int unsigned data;
    data = unique_data(arr);
    $display("The unique data is %0d", data);
  end
 endmodule

//Q2. Find two unique numbers where all others appear twice
module testbench;
  function void two_unique(input int signed arr[], output int signed u1, u2);
    int signed xor_all = 0;
    int signed right_set;
    u1 = 0;
    u2 = 0;
    foreach (arr[i]) xor_all ^= arr[i];

    right_set = xor_all & (-xor_all);

    foreach(arr[i])begin
      if(arr[i] & right_set) begin
        u1 ^= arr[i];
      end else
        u2 ^= arr[i];
    end
  endfunction
  
  initial begin
    int signed arr[] = '{0,1,-2,4,4,-2,1,0,8,-3};
    int signed u1, u2;
    two_unique(arr, u1, u2);
    $display(" The two unique numbers are %0d %0d", u1, u2);
    $finish;
  end
endmodule
