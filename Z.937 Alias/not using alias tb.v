module tb;
  wire  a,b,c;
  assign a = b;
  assign c = b;
  assign c = 1'b1;

  initial begin
    #1;
    $display("a=%0b, b=%0b, c=%0b", a, b, c);
  end
endmodule
//the default value of wire is z
//the default value of int is 0
