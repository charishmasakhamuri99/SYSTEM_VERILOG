module encoder42(a,y);
  input [3:0]a;
  output reg [1:0] y;
  always @(*) begin
      case(a)
        4'b0001: y=2'b00;
        4'b0010: y=2'b01;
        4'b0100: y=2'b10;
        4'b1000: y=2'b11;
      endcase
  end
endmodule

interface inter;
  logic [3:0] a;
  logic[1:0]y;
endinterface


// module encoder42(a0,a1,a2,a3,en,y0,y1);
//   input a0,a1,a2,a3,en;
//   output y0,y1;
//   assign y1 = en &( a2|a3);
//   assign y0 = en &( a1|a3);
// endmodule

// interface inter;
//   logic a0,a1,a2,a3,en;
//   logic y0,y1;
// endinterface

