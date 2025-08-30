module tb;
  inter inf();
  srff u1(.clk(inf.clk),.rst(inf.rst),.s(inf.s),.r(inf.r),.q(inf.q));
  initial begin 
    inf.clk=0;
    forever #5 inf.clk=~inf.clk;
  end
  initial begin
    #5;
    inf.rst=0;
    #10;
    inf.rst=1;
    
    $monitor("time=%0t,q=%0b,s=%0b,r=%0b",$time,inf.q,inf.s,inf.r);
    #10; inf.s=0;inf.r=1;
    #10; inf.s=1;inf.r=1;
    #10; inf.s=0;inf.r=1;
    #10; inf.s=1;inf.r=0;
    #10; inf.s=0;inf.r=0;
    #100;$finish;
    
  end
  
endmodule

