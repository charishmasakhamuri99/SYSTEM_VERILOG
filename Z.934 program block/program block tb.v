module vlsi ( output logic [3:0] y);
  initial begin
    y<=10;
  end
endmodule

program tb_pro(input logic [3:0]y);
  //wire [3:0] y;
  //vlsi dut(y);
  initial begin
    if(y==10)
    $display (" The Values of y is Equal to 10");
    else
      $display (" The Value of y is Not Equal to 10");
  end
endprogram
module tb_pro_top;
  wire [3:0] y;
  tb_pro tb (y);
  vlsi dut(y);
endmodule
