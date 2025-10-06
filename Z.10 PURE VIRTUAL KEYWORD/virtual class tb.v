// Code your testbench here
// or browse Examples
virtual class base;
  int a;
  int b;
  pure virtual function void display();
    //isplay("a=%0d,b=%0d",a,b);
  endfunction
endclass
class sub extends base;
endclass
module tb;
  base ba;
  sub s;
  initial begin
    s=new();
    ba=s;
    s.a=10;
    s.b=20;
    ba.display();
  end
endmodule
