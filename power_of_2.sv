module testbench;

  // main function to test if the number is power of 2 using bitwise
  
  function bit power_of_two(input integer n);
    return (n > 0) && ((n & (n-1)) == 0);
  endfunction

  //testing
  
  initial begin
    integer num;
    integer testing[7:0] = '{0,1,2,3,4,7,8,-8};
    
    //call the function 
    foreach (testing[i])begin
      num = testing[i];
      if(power_of_two(num)) $display("Passing for num = %0d", num);
      else $display("Failing for num = %0d", num);
    end
    
    $finish;
  end

endmodule
