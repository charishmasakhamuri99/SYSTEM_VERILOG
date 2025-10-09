module tb;
  fa # (.width(10)) dut(a,b,ci,s,co);//the value of the width is change in tb called value parameterization
  $display("width=%0d",width);
endmodule
