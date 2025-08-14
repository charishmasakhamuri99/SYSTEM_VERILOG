class generator;
  mailbox mbx;
  int a, sel;
  task run();
    for(int i=0;i<=3;i++) begin
      bit [1:0] temp=i[1:0];
      bit a=temp[1];
      bit sel=temp[0];
      mbx.put(temp);
      $display("generated: a=%0b,sel=%0b",a,sel);
    end
  endtask
endclass

class driver;
  mailbox mbx;
  virtual inter vif;
  task run();
    bit[1:0]temp;
    bit a,sel;
    for(int i=0;i<=3;i++) begin 
      mbx.get(temp);
      a=temp[1];
      sel=temp[0];
      vif.a=a;
      vif.sel=sel;
      #15;
      $display("driver:a=%0b,sel=%0b,y0=%0b,y1=%0b",a,sel,vif.y0,vif.y1);
    end
  endtask
endclass

module tb;
  inter aif();
  dmux12 u1(.a(aif.a),.sel(aif.sel),.y0(aif.y0),.y1(aif.y1));
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

