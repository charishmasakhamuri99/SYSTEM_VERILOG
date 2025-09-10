class apb_tx;
  //properties of the class
   bit wr_rd=1;//only write operation
   bit[7:0]addr;
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
    sel inside {4'b0010};
  }
//   constraint sel_c1{
//     sel inside{4'b1111};
//   }
endclass


module tb;
  apb_tx tx=new();//dynamic datatype
  
  initial begin
    repeat (1) begin
      assert(tx.randomize());
      tx.addr=8'h21;
    tx.print();
      
    end
  end
endmodule
//while we are working with the randmize thought the output is correct also it will show the one warning so to avoid that warning we will use asserstion

  
