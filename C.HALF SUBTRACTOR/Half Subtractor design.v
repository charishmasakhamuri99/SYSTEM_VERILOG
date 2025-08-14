module HS(a,b,d,bo);
  input a,b;
  output d,bo;
  assign d=(a^b);
  assign bo=(~a&b);
endmodule

interface inter;
  logic a,b;
  logic d,bo;
endinterface
