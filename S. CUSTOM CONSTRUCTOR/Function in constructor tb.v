class vlsi;
  int data;//class member/datamember
  function new(input int datain=0);
    data=datain;//class member=custom constructor function arrgument
  endfunction
endclass

module tb;
  vlsi v;
  initial begin
    v=new(2);//creating memory/ objedct creation/ new is called constructor
    $display("data=%0d",v.data);
  end
endmodule
