module top;
  initial begin
    int a=50;
    int b=100;
    unique if(a==b)
      $display("a is equal to b");
    else if(a>b)
      $display("a is lessthan b");
    else if(a>100)
      $display("a is greater than 100");
//     else
//       $display("exit condition");
  end
endmodule
//if none of the staTEment are true then error is printed
//Warning: unique_if_1: testbench.sv(5), scope: top.0unnblk, time: 0. None of 'if' branches matched
