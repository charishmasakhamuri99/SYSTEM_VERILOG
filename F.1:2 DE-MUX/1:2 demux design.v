module dmux12(sel,a,y0,y1);
  input sel,a;
  output y0,y1;
  assign y0=(~sel)&a;
  assign y1=(sel)&a;
endmodule

interface inter;
  logic a, sel;
  logic y0,y1;
endinterface
