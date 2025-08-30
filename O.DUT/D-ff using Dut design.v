module dff(clk,rst,d,o);
  input wire clk,rst,d;
  output reg o;
  always@(posedge clk or negedge rst) begin
    if(!rst)
      o<=0;
    else
      o<=d;
  end
endmodule

interface inter;
  logic clk;
  logic rst;
  logic d;
  logic o;
endinterface
