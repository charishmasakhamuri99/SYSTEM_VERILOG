module tb;
  int a,b,c,x,y;
  always@(a)//verilog
    x=a^b^c;
  always_comb
    y=a^b^c;
  initial begin
    a=0;b=1;c=0;
    #5 a=0;b=0;c=1;
    #5 a=0;b=1;c=0;
    #5 a=1;b=1;c=1;
  end
  initial begin
    $monitor("T=%0t,a=%0d,b=%0d,c=%0d,x=%0d,y=%0d",$time,a,b,c,x,y);
  end
endmodule
    
