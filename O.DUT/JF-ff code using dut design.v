module jkff(j,k,rst,clk,q);
  input j,k,rst,clk;
  output reg q;
  always@(posedge clk or negedge rst) begin
    case({j,k})
      2'b00: q<=q;
      2'b01: q<=0;
      2'b10: q<=1;
      2'b11: q<=~q;
    endcase
  end
endmodule

interface inter;
  logic clk;
  logic rst;
  logic q;
  logic j;
  logic k;
endinterface
