class generator;
  int a,b;
  mailbox mbx;
  task run();
    for(int i=0;i<=3;i++) begin
      bit[1:0] temp=i[1:0];
      bit a = temp[1]; // 
      bit b = temp[0];
      mbx.put(temp);
      $display("genereated value : a=%0b,b=%0b",a,b);
    end
  endtask
endclass
class driver;
  mailbox mbx;
  virtual inter vif;
  task run();
    bit[1:0] temp;
    bit a,b;
    for(int i=0;i<4;i++) begin
      mbx.get(temp);
      a = temp[1];
      b = temp[0];
      vif.a = a;
      vif.b = b;
      #10;
      $display("Driver: a=%0b, b=%0b, sum=%0b, carry=%0b", a, b, vif.s, vif.c);
    end
  endtask
endclass
module tb;
  inter aif();
  hf u1(.a(aif.a),.b(aif.b),.c(aif.c),.s(aif.s));
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
  initial begin
    $monitor("dut value a=%0b,b=%0b,c=%0b,s=%0b",aif.a,aif.b,aif.c,aif.s);
  end
endmodule
