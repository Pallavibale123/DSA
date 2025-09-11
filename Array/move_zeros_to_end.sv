module testbench; 
  task automatic move_zeros(ref int arr[]); 
    int pos = 0; 
    int n = arr.size(); 
    for(int i = 0; i < n; i++)begin 
      if(arr[i] != 0)begin 
        arr[pos] = arr[i]; 
        pos += 1; 
      end 
    end 
      for(int i = pos; i < n; i++)begin 
        arr[i] = 0; 
      end 
  endtask 
  initial begin 
    int a[] ='{0, 2, 3, 0, 6, 0, 5, 32'hFFFFFFFF}; 
    move_zeros(a); 
    $display("The new array is %0p", a); 
  end 
endmodule
