module top;
  initial begin
    int a=50;
    int b=100;
    unique0 if(a==b)
      $display("a is equal to b");
    else if(a<b)
      $display("a is lessthan b");
    else if(a<100)
      $display("a is greater than 100");
    else
      $display("exit condition");
  end
endmodulea
//
//if more than one statement are true then it will 
//display error along with the output
