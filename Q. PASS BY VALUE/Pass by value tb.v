module tb;
  task swap (input bit [3:0] a,b);
    //a and b are called Arguments
    bit[3:0] temp;
    temp=a;
    a=b;
    b=temp;
    $display("a=%0d,b=%0d",a,b);
    endtask
  bit [3:0] a;
  bit [3:0] b;
  //a and b are called as values / variables
  initial begin 
    a=9;
    b=7;
    swap(a,b);
    #10;
    $display("a=%0d,b=%0d",a,b);
  end
endmodule
