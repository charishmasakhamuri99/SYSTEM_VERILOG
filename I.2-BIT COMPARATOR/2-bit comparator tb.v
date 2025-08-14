class generator;
  bit [1:0] a,b;
  mailbox mbx;
  task run();
    for(int i=0;i<=15;i++) begin
      bit [3:0]temp=i[3:0];
      a=temp[3:2];
      b=temp[1:0];
      mbx.put(temp);
      $display("generated value: a=%0b,b=%0b",a,b);
    end
  endtask
endclass

class driver;
  mailbox mbx;
  virtual inter vif;
  task run();
    bit[3:0]temp;
    bit[1:0] a,b;
    for(int i=0;i<=15;i++) begin
      mbx.get(temp);
      a=temp[3:2];
      b=temp[1:0];
      vif.a=a;
      vif.b=b;
      #15;
      $display("driver: a=%2b,b=%2b,y=%3b",a,b,vif.y);
    end
  endtask
endclass
module tb;
  inter aif();
  comparator2 u1(.a(aif.a),.b(aif.b),.y(aif.y));
  generator gen;
  driver div;
  mailbox mbx;
  initial begin
    gen=new();
    div=new();
    mbx=new();
    
    gen.mbx=mbx;
    div.mbx=mbx;
    div.vif=aif;
    fork
      gen.run();
      div.run();
    join
  end
endmodule
      
