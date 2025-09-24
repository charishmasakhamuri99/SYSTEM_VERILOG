virtual class base;
  int a;
  int b;
  function void display();
    $display("a=%0d,b=%0d",a,b);
  endfunction
endclass
 class sub extends base;
 endclass
module tb;
  sub s;
  initial begin
    s=new();
    s.display();
    s.a=10;
    s.b=20;
    s.display();
  end
endmodule


//abstract or virtual class cannot accessed by the parent class itself 
//on that time we will get an error.
//to avoid that error we have to create one sub class (without or with properties and method 
//by using the child class handle we can access the virtual or abstract class
