// 2:1 Multiplexer
module mux21(a,b,sel,y);
  input a,b,sel;
  output y;
  assign y = (sel) ? b : a;
endmodule

interface inter;
  logic a,b,sel;
  logic y;
endinterface
