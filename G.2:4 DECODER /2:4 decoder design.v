module decoder24(a,b,en,y);
  input a,b,en;
  output reg [3:0]y;
  assign y[0]=en&(~a)&(~b);
  assign y[1]=en&(~a)&(b);
  assign y[2]=en&(a)&(~b);
  assign y[3]=en&(a)&(b);
endmodule

// module decoder24(a,b,en,y);
//   input a,b,en;
//   output reg [3:0]y;
//   always@(*) begin 
//     if(en) begin
//       y=4'b0000;
//       case({a,b})
//         2'b00: y[0]=1'b1;
//         2'b01: y[1]=1'b1;
//         2'b10: y[2]=1'b1;
//         2'b11: y[3]=1'b1;
//       endcase
//     end
//       else begin
//         y=4'b0000;
//       end
//   end
// endmodule

interface inter;
  logic a,b,en;
  logic[0:3]y;
endinterface
