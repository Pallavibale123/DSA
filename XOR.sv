//Q1. Check if two numbers have opposite signs

module testbench;  
  function automatic int check_sign(input int signed a, b);
    return ((a ^ b)< 0);
  endfunction
  initial begin
    int signed data[][2] = '{'{0,0},'{0, 32'hFFFFFFFF},'{32'hFFFFFFFF,32'hFFFFFFFF},'{-1,10}};
    bit result;
    foreach(data[i])begin
      result = check_sign(data[i][0],data[i][1]);
      if (result)
        $display("The number %0d and %0d have opposite signs",data[i][0],data[i][1]);
      else
        $display("The number %0d and %0d have no opposite signs",data[i][0],data[i][1]);
    end
    $finish;
  end
endmodule

//Q2. Determine if all numbers in an array alternate signs.

  module testbench;
  function automatic int check_sign(input int signed a, b);
    return ((a ^ b) < 0);
  endfunction

  function automatic int alternate(input int arr[], input int size);
    for(int i = 0; i <size-1; i++)begin
      if(!check_sign(arr[i],arr[i+1]))begin
        return 0;
      end
    end
    return 1;
  endfunction
    
    initial begin
      int arr1[] = '{1, -2, 3, -4, 5};
      int arr2[] = '{0, -0, 3, -4, 5};
      int arr3[] = '{1, -2, 3, -31, -32};
      int arr4[] = '{1, -2, 3, -4, -5};
      
      $display("arr1 alternates ? %0b", alternate(arr1, arr1.size()));
      $display("arr2 alternates ? %0b", alternate(arr2, arr2.size()));
      $display("arr3 alternates ? %0b", alternate(arr3, arr3.size()));
      $display("arr4 alternates ? %0b", alternate(arr4, arr4.size()));
    end
  endmodule
