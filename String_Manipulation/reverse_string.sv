// In SystemVerilog, functions only support pass-by-value arguments, so they can’t directly modify the caller’s variable.
// If I want to reverse in place, I need ref, and only tasks allow ref arguments.
// That’s why I used a task for in-place reverse, but a function for return-a-new-string reverse.

//Q1. 1. **Reverse a string** Input: `"Hello"` → Output: `"olleH"`
module testbench;
  task automatic reverse_string(ref string str);
    byte temp;
    int i =0;
    int j = str.len() - 1;

    while(i < j)begin //Tip: when using two pointer use while loop
      temp = str[i];
      str[i] = str[j];
      str[j] = temp;
      i += 1;
      j -= 1;
    end
  endtask

  initial begin
    string s1 = "Hello";
    reverse_string(s1);
    $display("the reverse in place string is %s", s1);
  end
endmodule
