class vlsi;
  int a;//int a,b are nonobjective property
  int b;
endclass
module tb;
  vlsi v1,v2;
  initial begin
    v1=new();
    v2=new ();
    v2.a=10;
    //v2.pck.conut=50;
    v1=new v2;//v1=v2.a and v2.b
    //v1=v2then v1 memory source is deleted and both v1 and v2 pointing the same memory location
    $display("v1=%0d",v1.a);
    $display("v1=%0p",v1);
    v2.a=20;
    $display("v1=%0p",v1);
  end
endmodule
    
