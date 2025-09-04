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
