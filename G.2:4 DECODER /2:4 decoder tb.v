class generator;
  int a,b,en;
  mailbox mbx;
  task run();
    for(int i=0;i<=7;i++) begin
      bit [2:0] temp=i[2:0];
      bit en=temp[2];
      bit a=temp[1];
      bit b=temp[0];
      mbx.put(temp);
      $display("generated: en=%0b,a=%0b,b=%0b",en,a,b);
      end
  endtask
endclass

class driver;
  virtual inter vif;
  mailbox mbx;
  task run();
    bit [2:0] temp;
    bit en,a,b;
    for(int i=0;i<=7;i++) begin
      mbx.get(temp);
      en=temp[2];
      a=temp[1];
      b=temp[0];
      vif.en=en;
      vif.a=a;
      vif.b=b;
      #15;
      $display("driver: en=%0b,a=%0b,b=%0b,y=%0b",en,a,b,vif.y);
    end
  endtask
endclass

module tb;
  inter aif();
  decoder24 u1(.en(aif.en),.a(aif.a),.b(aif.b),.y(aif.y));
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
