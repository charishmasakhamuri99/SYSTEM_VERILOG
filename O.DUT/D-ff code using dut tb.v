module tb;
  inter inf();
  dff u1(.rst(inf.rst),.clk(inf.clk),.d(inf.d),.o(inf.o));
  initial begin
    inf.clk=0;
    forever #5 inf.clk=~inf.clk;
  end
  initial begin
    inf.rst=0;
    inf.d=0;
    $monitor("time=%0t,d=%0b,o=%0b",$time,inf.d,inf.o);
    inf.rst=1;
    inf.d=0;#10;
    inf.d=1;#10;
    inf.d=1;#10;
    inf.d=1;#10;
    #100;
    $finish;
  end
endmodule
