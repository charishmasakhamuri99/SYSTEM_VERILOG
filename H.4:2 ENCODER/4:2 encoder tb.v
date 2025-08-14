class generator;
  bit[3:0] a;
  mailbox mbx;
  task run();
    for(int i=1;i<=8;i++) begin
      bit [3:0]temp=i[3:0];
      a= temp[3:0];
      mbx.put(temp);
      $display("generated:a=%0b",temp[3:0]);
      end
  endtask
endclass

class driver;
  virtual inter vif;
  mailbox mbx;
  task run();
    bit [3:0] temp;
    bit[3:0]a;
    for(int i=1;i<=8;i++) begin
      mbx.get(temp);
      a=temp[3:0];
      vif.a=temp[3:0];
     // vif.en=temp[4];
    //  vif.[3:0]temp=[3:0]temp;
     // vif.b=b;
      #15;
      $display("driver: a=%4b,y=%2b",temp[3:0],vif.y);
    end
  endtask
endclass

module tb;
  inter aif();
  encoder42 u1(.a(aif.a),.y(aif.y));
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
