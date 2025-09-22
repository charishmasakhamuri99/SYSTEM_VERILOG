//this code is inherited class

class parent;
   int a=8;//local or proteceted here we use
   int b=5;//local or proteceted here we use
  function void print();
    $display("a=%0d,b=%0d",a,b);
  endfunction
endclass
class child extends parent;
  int c;
  function void sub();
    c=a-b;
    $display("c=%0d",c);
  endfunction
endclass
module tb;
  int d;
  child c;
  initial begin 
    c=new();
    c.print();
    c.sub();
    d=c.a+c.b;
    $display("d=%0d",d);
  end
endmodule

//local class -- only in parent or only with in the class
//protected   -- both in parent and child class
//global/public -- where ever in the code either in parent or child or module
  
