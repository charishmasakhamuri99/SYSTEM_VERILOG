class parent;
  int a;
  function new(int a);
    this.a=a;
    $display("Parent  a=%0d",a);
  endfunction
endclass

class child extends parent;
  int a;
  function new(int p,int c);
    super.new(p);
    a=c;
    //super.display();
    $display("child  a=%0d",a);
  endfunction
endclass
module tb;
  child c;
  initial begin
    c=new(9,5);
    //c.display();
  end
endmodule
//--> super.new(); 
//	--> Is Used to Initialize the Parent class Data member.
