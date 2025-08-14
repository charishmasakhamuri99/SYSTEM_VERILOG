 module hf(a,b,c,s);
  input a,b;
  output c,s;
  assign s=a^b;
  assign c=a&b;
endmodule

interface inter;
  logic a;
  logic b;
  logic s;  
  logic c;
endinterface

