module tb;
  inter aif();
  dut u1(.a(aif.a),.b(aif.b),.c(aif.c));
  initial begin
    aif.a=6;
    aif.b=4;
    #10;
    aif.a=7;
    aif.b=3;
  end
  initial begin
    $monitor("a=%0d,b=%0d,c=%0d",aif.a,aif.b,aif.c);
    #100;
    $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
