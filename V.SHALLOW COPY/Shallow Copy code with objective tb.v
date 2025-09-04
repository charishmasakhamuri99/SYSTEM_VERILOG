class packet;
  int count;
endclass
class vlsi;
  int a;//int a,b non objective properties
  int b;
  packet pck=new();//objective properties
endclass
module tb;
  vlsi v1,v2;
  initial begin
    v1=new();
    v2=new();
    v2.a=10;
    v2.pck.count=50;
    v1= new v2; //v1=v2.a and v2.b
    //v1=v2 then v1 memory is deleted and both v1 and v2 are pointing the same memory location
    $display("v1=%0d",v1.a);
    $display("v1=%0p",v1);
    v2.a=20;
    $display("v1=%0p",v1);
  end
endmodule
