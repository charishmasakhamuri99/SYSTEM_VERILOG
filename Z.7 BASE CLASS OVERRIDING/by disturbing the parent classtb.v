class parent;
  int a=20;
  function void display();
    $display(" a=%0d",a);
  endfunction
endclass

class child extends parent;
  int a=40;
  function void display();
    $display(" a=%0d",a);
  endfunction
endclass
module tb;
  parent p;
  child c;
  initial begin
    p=new();
    c=new();
    p.display();
    c.display();
  end
endmodule

// **Correct Solution is " Super Keyword "
