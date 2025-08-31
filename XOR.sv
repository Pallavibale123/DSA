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
