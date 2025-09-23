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
  child c;
  initial begin
    c=new();
    c.display();
  end
endmodule
//base class over riding in this both parent and child class are assigned with 
//same name and also with the display statement so when we call the
//print the parent class voer ridded and then the child class is printed
//to avoid this we are going with super keyword
