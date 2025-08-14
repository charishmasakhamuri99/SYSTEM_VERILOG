class generator;
  int a,b,c;
  mailbox mbx;
  task run();
    for(int i=0;i<8;i++)begin
      bit[2:0] temp=i[2:0];
      bit a=temp[2];
      bit b=temp[1];
      bit c=temp[0];
      mbx.put(temp);
      $display("generated values a=%0b,b=%0b,c=%0b",a,b,c);
    end
  endtask
endclass
class driver;
  mailbox mbx;
  virtual inter vif;
  task run();
    bit [2:0] temp;
    bit a;
    bit b;
    bit c;
    for(int i=0;i<8;i++) begin
      mbx.get(temp);
      a=temp[2];
      b=temp[1];
      c=temp[0];
      vif.a=a;
      vif.b=b;
      vif.c=c;
      #10;
      $display("driver:a=%0b,b=%0b,c=%0b,d=%0b,bo=%0b",a,b,c,vif.d,vif.bo);
    end
  endtask
endclass
module tb;
  inter aif();
  FS u1(.a(aif.a),.b(aif.b),.c(aif.c),.d(aif.d),.bo(aif.bo));
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
//   initial begin
//     $monitor("dut value a=%0b,b=%0b,c=%0b,s=%0b,ca=%0b",aif.a,aif.b,aif.c,aif.s,aif.ca);
//   end
endmodule
