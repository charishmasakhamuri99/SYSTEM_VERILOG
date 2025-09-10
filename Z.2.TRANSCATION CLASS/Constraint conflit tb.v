class apb_tx;
  //properties of the class
  rand bit wr_rd;
  rand bit[7:0]addr;
  rand bit [31:0]data;
  rand bit [3:0]sel;
  
  
  //methods
  function void print();
    $display("wr_rd=%0b",wr_rd);
    $display("addr=%0h",addr);
    $display("data=%0h",data);
    $display("sel=%0d",sel);
  endfunction
  
  constraint sel_c{
    sel inside {4'b0010,4'b0100,4'b1000,4'b1001,4'b0000};
  }
  constraint sel_c1{
    sel inside{4'b1111};
  }//if u have given the two constraintsin the class then the compilre wont know which one have to select leades to constraint conflit
  //so that the randamization fails
endclass


module tb;
  apb_tx tx;//dynamic datatype
  //size of tx= size(wr_rd)+size(data)+size(addr)+size(sel) 45 bits size is not fixed
  initial begin
    tx=new();
    tx.print();
    tx.randomize();
    tx.print();
  end
endmodule
//constr
  
