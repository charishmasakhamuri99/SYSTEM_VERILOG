class vlsi;
  int data;
  bit[7:0] data1;
  shortint data2;
  function new(input int datain=0,input bit[7:0] data1in=8'h00,input shortint data2in=0);
    data=datain;
    data1=data1in;
    data2=data2in;
  endfunction
endclass
module tb;
  vlsi v;
  initial begin
    v=new(31,20,19);
    $display("data=%0d,data1=%0d,data2=%0d",v.data,v.data1,v.data2);
  end
endmodule
