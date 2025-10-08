module top;
  initial begin
    int a=50;
    int b=100;
    priority if(a==b)
      $display("a is equal to b");
    else if(a<b)
      $display("a is lessthan b");
    else if(a<100)
      $display("a is greater than 100");
    else
      $display("exit condition");
  end
endmodule
