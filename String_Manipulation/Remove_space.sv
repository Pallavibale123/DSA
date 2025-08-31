//Q1. Remove all whitespace from a string
//Input: " H e l l o " → Output: "Hello"
//Below is the solution returning a new string
module testbench;
  function string remove_space(input string str);
    string out = " ";
    int i;
    for (i = 0; i < str.len(); i++)begin
      if(str[i] != " ")begin
        out = {out,str[i]};
      end
    end
    return out;
  endfunction
  
  initial begin
    string s1 = "H e l l o";
    string out_str;
    out_str = remove_space(s1);
    $display(" The output string without spaces is %s", out_str);
  end
endmodule

//Below is pass by reference method for in-place
module testbench;
  task automatic remove_space(ref string str); // Don't forget to use ref for in-place 
    int i = 0;
    int j = 0;
    while (i < str.len())begin
      if (str[i] != " ")begin
        str[j] = str[i];
        j += 1;
      end
      i += 1;
    end
    str = str.substr(0, j-1);
  endtask

  initial begin
    string s1 = "H  e ll o ";
    remove_space(s1);
    $display("The in same string without space %s", s1);
  end
  
endmodule
