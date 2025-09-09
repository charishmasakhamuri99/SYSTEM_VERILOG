// class packet;
//   int count;
// endclass

// class vlsi;
//   int a;
//   int b;
//   packet pkt = new();
//   function void print();
//     $display("a=%0d",a);
//     $display("b=%0d",b);
//     $display("pkt=%0p",pkt);
//   endfunction
//   function void copy(output vlsi v);
//     v=new();
//     v.a=a;
//     v.b=b;
//     v.pkt=new();
//     v.pkt.count=pkt.count;
//   endfunction
  
// endclass

// module tb;
//   vlsi v1,v2;
//   initial begin
//   v1=new();
//   v2=new();
//   v2.a=10;
//   // v1=new v2;
//     v2.copy(v1);
//   $display("v1=%0d",v1.a);
//   $display("v1=%0p",v1);
// //   v2.a=20
//   v2.b=30;
//     v2.pkt.count=300;
//   //$display("v1=%0p",v1);
//     v1.print();
//     v2.print();
//     v1.a=10;
//     v1.b=0;
//     v1.pkt.count=500;
//     v1.print();
//     v2.print();
//   end
// endmodule
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
  function void copy(output vlsi v);
    v=new();
    this.a=v.a;
    this.b=v.b;
    this.pkt=new();
    this.pkt.data=v.pkt.data;
  endfunction
endclass

module top;
  vlsi v1,v2;
  initial begin
    v1=new();
    v2=new();
    v2.a=15;
    v2.copy(v1);//shallow copy syntax
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
