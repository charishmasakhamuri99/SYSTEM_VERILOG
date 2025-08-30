module tb;
  inter inf();
  jkff u1(.clk(inf.clk),.rst(inf.rst),.j(inf.j),.k(inf.k),.q(inf.q));
  initial begin 
    inf.clk=0;
    forever #5 inf.clk=~inf.clk;
  end
  initial begin
    #5;
    inf.rst=0;
    #10;
    inf.rst=1;
    $monitor("time=%0t,q=%0b,j=%0b,k=%0b",$time,inf.q,inf.j,inf.k);
    #10; inf.j=0;inf.k=1;
    #10; inf.j=1;inf.k=1;
    #10; inf.j=0;inf.k=1;
    #10; inf.j=1;inf.k=0;
    #10; inf.j=0;inf.k=0;
    #100;$finish;
  end
endmodule

