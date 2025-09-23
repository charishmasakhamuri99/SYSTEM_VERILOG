class parent;
  int a=10;
  int b=15;
  function void print();
    $display("a=%0d,b=%0d",a,b);
  endfunction
endclass

class child extends parent;
  int c;
  function int sum(int a,int b);
    return a+b;
  endfunction
  function void print1();
    c=sum(a,b);
    $display("c=%0d",c);
  endfunction
endclass

module tb;
  int d;
  child c;
  initial begin
    c=new();
    c.print();
    c.print1();
    d=c.a+c.b;
    $display("d=%0d",d);
  end
endmodule
    
