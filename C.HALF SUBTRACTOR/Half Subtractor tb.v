class generator;
  mailbox mbx;
  int a,b;
  task run();
    for(int i=0;i<=3;i++) begin
      bit[1:0] temp=i[1:0];
      bit a=temp[1];
      bit b=temp[0];
      mbx.put(temp);
      $display("grenerated: a=%0b,b=%0b",a,b);
    end
  endtask
endclass

class driver;
  mailbox mbx;
  virtual inter vif;
  task run();
    bit[1:0] temp;
    bit a,b;
    for(int i=0;i<=3;i++) begin
      mbx.get(temp);
      a=temp[1];
      b=temp[0];
      vif.a=a;
      vif.b=b;
      #15;
      $display("driver:a=%0b,b=%0b,d=%0b,bo=%0b",a,b,vif.d,vif.bo);
    end
  endtask
endclass

module tb;
  inter aif();
  HS u1(.a(aif.a),.b(aif.b),.d(aif.d),.bo(aif.bo));
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
