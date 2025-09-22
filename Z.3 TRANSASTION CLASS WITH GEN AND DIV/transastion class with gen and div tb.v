class apb_tx;
  //properties of the class
  rand bit wr_rd;
  rand bit[7:0]addr;
  rand bit [31:0]data;
  rand bit [3:0]sel;
  
  
  //methods
  function void print(string cherry);
    $display("[%0s] wr_rd=%0b,addr=%0h,data=%0h,sel=%0d",cherry,wr_rd,addr,data,sel);
//     $display("addr=%0h",addr);
//     $display("data=%0h",data);
//     $display("sel=%0d",sel);
  endfunction
  
  constraint sel_c{
    sel inside {4'b0010,4'b0100,4'b1000,4'b1001,4'b0000};
  }
endclass

class generator;
  mailbox mbx;
  apb_tx tx;
  task run();
    repeat(5) begin
      tx=new();
      tx.randomize();
      tx.print("generator");
      mbx.put(tx);
    end
  endtask
endclass

class driver;
  mailbox mbx;
  apb_tx tx;
  task run();
    repeat(5) begin
      tx=new();
      mbx.get(tx);
      tx.print("driver");
    end
  endtask
endclass

module tb;
  //apb_tx tx;//dynamic datatype
  //size of tx= size(wr_rd)+size(data)+size(addr)+size(sel) 45 bits size is not fixed
  generator gen;
  driver div;
  mailbox mbx;
  initial begin
    mbx=new();
    gen=new();
    div=new();
    
    gen.mbx=mbx;
    div.mbx=mbx;
    fork
      gen.run();
      div.run();
    join
  end
endmodule

