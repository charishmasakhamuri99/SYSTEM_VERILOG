module tb;
  int a,b;
  initial begin
    a=9;
    b=6;
    $display("a=%0d,b=%0d",a,b);
    b=a;
    $display("a=%0d,b=%0d",a,b);
    a=20;
    $display("b=%0d",b);
    
  end
endmodule
    //here the varibles are stored in different memory locatoin
//non object properties are uses seperarte memeory
//in number coping seperate memory locations are used for the given variable
