class vlsi;
  int data;
  bit[7:0] data1;
  shortint data2;
  function new(input int data=0,input bit[7:0] data1=8'h00,input shortint data2=0);
    this.data=data;
    this.data1=data1;
    this.data2=data2;
  endfunction
endclass
module tb;
  vlsi v;
  initial begin
    //v=new(31,20,19);
    v=new(.data2(32),.data(31),.data1(22));
    $display("data=%0d,data1=%0d,data2=%0d",v.data,v.data1,v.data2);
  end
endmodule

