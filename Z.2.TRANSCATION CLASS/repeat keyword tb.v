class apb_tx;
  //properties of the class
   bit wr_rd=1;
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
//   constraint sel_c1{
//     sel inside{4'b1111};
//   }
endclass


module tb;
  apb_tx tx=new();//dynamic datatype
  
  initial begin
    repeat (10) begin
    tx.randomize();
    tx.print();
    end
  end
endmodule
//the whole code is now belongs to only one transcation to send the data form master to driver as some number of type then we can go with repeat 
  
