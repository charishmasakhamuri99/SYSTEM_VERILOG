module fa(a,b,ci,s,co);
  parameter width =4;
  input [width-1]a;
  input [width-1]b;
  input ci;
  output [width-1] s;
  output co;
  assign {co,s}=a+b+ci;
endmodule

