module top;
  initial begin
    int a=50;
    int b=100;
    unique if(a==b)
      $display("a is equal to b");
    else if(a<b)
      $display("a is lessthan b");
    else if(a<100)
      $display("a is greater than 100");
    else
      $display("exit condition");
  end
endmodule
// if more than one statement is true in
//unique if then the first if statement
//is printed along with an error
//a is lessthan b
//ASSERT: Error: Assertion 'unique_if_1' FAILED at time: 0, testbench.sv(5), scope: top.0unnblk. Two or more conditions are true simultaneously: a<b (line: 7), a<100. (line: 9)
