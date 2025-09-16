module testbench;
  function automatic int duplicate(input int arr[]);
    int slow, fast;
    slow = arr[0];
    fast = arr[0];
    do begin
      slow = arr[slow];
      fast = arr[arr[fast]];
    end while(slow != fast);
                 
    slow = arr[0];
    while(slow != fast) begin
      slow = arr[slow];
      fast = arr[fast];
    end
    return slow;
  endfunction
   
  initial begin
    int arr[]= '{1,2,3,4,5,6,6};
    int result;
    result = duplicate(arr);
    $display("the elements %0d is duplicate", result);
  end
endmodule
