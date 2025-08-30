module srff(s,r,rst,clk,q);
  input s,r,rst,clk;
  output reg q;
  always@(posedge clk or negedge rst) begin
    case({s,r})
      2'b00: q<=q;
      2'b01: q<=1'b0;
      2'b10: q<=1'b1;
      2'b11: q<=1'bx;
    endcase
  end
endmodule

interface inter;
  logic clk;
  logic rst;
  logic q;
  logic s;
  logic r;
endinterface

