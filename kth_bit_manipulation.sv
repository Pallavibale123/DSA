//Q1. Set the k-th bit of a number.

//Time complexity: O(1) per call, O(D) overall for dataset of size D.
Space complexity: O(1).

module testbench;
  function automatic int set_bit(input int unsigned n, input int unsigned k);
    if(k < 0 || k >= 32)begin
      return n;
    end else begin
    return n | (1 << k); //assuming k starts from 0
    end
  endfunction
  
  initial begin
    int unsigned data[][2] = '{'{0,0}, '{32'h16, 4}, '{0,31}, '{4,0}, '{32'hFFFFFFFF, 31}};
    int result;
    
    foreach (data[i])begin
      result = set_bit(data[i][0], data[i][1]);
      $display("The number is %0d(%0b) and the k th = %0d bit to set", data[i][0],data[i][0], data[i][1]);
      $display("The number is now %0d(%0b)", result,result);
    end
  end
endmodule

//Q2. Clear the k-th bit of a number.

module testbench;
  function automatic int clear_bit(input int unsigned n, input int k);
    if (k < 0 || k >= 32)begin
      return 0;
    end else begin
    return n & (~(1 << k));
    end
  endfunction
  
  initial begin
    int unsigned data[][2] = '{'{0,0},'{32'hFFFFFFFF, 31},'{32'hFFFFFFFF, 0},'{5,0},'{32'h16, 8}};
    int unsigned result;
    foreach(data[i])begin
      result = clear_bit(data[i][0], data[i][1]);
      $display("The number %0d (%0b) and the kth bit to clear %0d (%0b)",data[i][0], data[i][0], data[i][1], data[i][1]);
      $display("The final value is %0d (%0b)", result, result);
    end
    $finish;
  end
endmodule

//Q3. Toggle the k-th bit of a number.

module testbench;
  function automatic int toggle_bit(input int unsigned n, input int k);
    if(k < 0 || k >= 32)begin
      return n;
    end
    return n ^ (1<<k); // assume k starts from index 0
  endfunction
  
  initial begin
    int unsigned data[][2] = '{'{0,0},'{32'hFFFFFFFF,0},'{32'hFFFFFFFF,31},'{-4,2}};
    int unsigned result;
    foreach(data[i])begin
      result = toggle_bit(data[i][0], data[i][1]);
      $display("The number is %0d(%0b) and the kth bit is %0d", data[i][0],data[i][0], data[i][1]);
      $display(" The final value is %0d(%0b)",result, result);
    end
  end
endmodule
