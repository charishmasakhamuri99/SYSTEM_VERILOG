module FS(a,b,c,d,bo);
  input a,b,c;
  output d,bo;
  assign d=a^b^c;
  assign bo=(~a&b)|(b&c)|(~a&c);
endmodule

interface inter;
  logic a,b,c;
  logic d,bo;
endinterface
