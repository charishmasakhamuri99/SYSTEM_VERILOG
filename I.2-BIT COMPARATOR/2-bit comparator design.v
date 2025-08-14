  
// module comparator2(a0,a1,b0,b1,y0,y1,y2);
//   input a1,a0,b1,b0;
//   output y0,y1,y2;//y0=a>b;y1=a=b;y2=a<b
//   assign y0 = (a1 & ~b1) | ((a1 ~^ b1) & (a0 & ~b0));
//   assign y1 = (a1 ~^ b1) & (a0 ~^ b0);
//   assign y2 = (~a1 & b1) | ((a1 ~^ b1) & (~a0 & b0));
// endmodule

// interface inter;
//   logic a1,a0,b1,b0;
//   logic y0,y1,y2;
// endinterface

// module comparator2(a,b,y);
//   input[1:0] a,b;
//   output reg [2:0] y;
//   always @(*) begin
//     case({a,b})
//       4'b0000: y=3'b010;
//       4'b0001: y=3'b001;
//       4'b0010: y=3'b001;
//       4'b0011: y=3'b001;
//       4'b0100: y=3'b100;
//       4'b0101: y=3'b010;
//       4'b0110: y=3'b001;
//       4'b0111: y=3'b001;
//       4'b1000: y=3'b100;
//       4'b1001: y=3'b100;
//       4'b1010: y=3'b010;
//       4'b1011: y=3'b001;
//       4'b1100: y=3'b100;
//       4'b1101: y=3'b100;
//       4'b1110: y=3'b100;
//       4'b1111: y=3'b010;
//       default:y=3'b000;
//     endcase
//   end
// endmodule

module comparator2(a,b,y);
  input[1:0] a,b;
  output reg [2:0]y;
  always @(*) begin
    if (a>b)
      y=3'b100;
    else if (a==b)
      y=3'b010;
    else
      y=3'b001;
  end
endmodule

interface inter;
  logic[1:0]a;
  logic[1:0]b;
  logic[2:0] y;
endinterface 
