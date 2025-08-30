class generator;
  int data=35;
  mailbox mbx;
  task run();
    mbx.put(data);
    $display("generated data=%0d",data);
  endtask
endclass
class driver;
  int data1=0;
  mailbox mbx;
  task run();
    mbx.get(data1);
    $display("received data:%0d",data1);
  endtask
endclass
module tb;
  generator gen;
  driver div;
  mailbox mbx;
  initial begin
    gen=new();
    div=new();
    mbx=new();
    gen.mbx=mbx;
    div.mbx=mbx;
    gen.run();
    div.run();
  end
endmodule
