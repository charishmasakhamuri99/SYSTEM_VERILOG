class generator;
  mailbox mbx;
  int a,b,sel;
  task run();
    for(int i=0;i<8;i++) begin
      bit[2:0] temp=i[2:0];
      bit a=temp[2];
      bit b=temp[1];
      bit sel=temp[0];
      mbx.put(temp);
      $display("generated a=%0b,b=%0b,sel=%0b",a,b,sel);
    end
  endtask
endclass

class driver;
  mailbox mbx;
  virtual inter vif;
  task run();
    bit [2:0] temp;
    bit a,b,sel;
    for(int i=0;i<8;i++) begin
      mbx.get(temp);
      a=temp[2];
      b=temp[1];
      sel=temp[0];
      vif.a=a;
      vif.b=b;
      vif.sel=sel;
      #15;
      $display("driver: a=%0b,b=%0b,sel=%0b,y=%0b",a,b,sel,vif.y);
    end
  endtask
endclass

module tb;
  inter aif();
  mux21 u1(.a(aif.a),.b(aif.b),.sel(aif.sel),.y(aif.y));
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
