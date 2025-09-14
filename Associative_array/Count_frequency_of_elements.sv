module testbench;
  task automatic count_freq(input int a[], output int freq[int]);
    int n;
    n = a.size();
    for(int i = 0; i < n ; i++)begin 
      if(freq.exists(a[i]))
        freq[a[i]] += 1;
      else
        freq[a[i]] = 1;
    end
  endtask
  
  initial begin
    int arr[] ='{0,1,2,3,555,32'hFFFFFFF, 32'hFFFFFFF, 555, 555};
    int freq[int];
    count_freq(arr, freq);
    foreach(freq[key])
      $display("\n number %0d occurs %0d times", key, freq[key]);
  end
endmodule
