class packet;
  int data;
endclass

class vlsi;
  int a;
  int b;
  packet pkt=new();
  function void print();//todetermine the object values instead of class name
    $display("a=%0d",a);
    $display("b=%0d",b);
    $display("pkt=%0p",pkt);
  endfunction
endclass

module top;
  vlsi v1,v2;
  initial begin
    v1=new();
    v2=new();
    v2.a=15;
    v1=new v2;//shallow copy syntax
    $display("v1=%0p",v1);
    v2.a=25;
    v2.b=35;
    v2.pkt.data=400;
    v1.print();
    v2.print();
    v2.a=50;
    v2.b=32;
    v2.pkt.data=500;
    v1.print();
    v2.print();
  end
endmodule
    
