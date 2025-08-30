module top;
  enum{start,addr,data,stop}packet;
  initial begin 
    packet=start;
    $display("value for start is %d",packet);
  end
  initial begin
    packet=packet.first();
    $display("first elemente is %s and value is %d ",packet.name(), packet);
     packet=packet.next();
    $display("next elemente is %s and value is %d ",packet.name(), packet);
     packet=packet.next();
    $display("next elemente is %s and value is %d ",packet.name(), packet);
    packet=packet.prev();
    $display("prev element is %s and its value is %d",packet.name(),packet);
    packet=packet.last();
    $display("last element is %s and its value is %d",packet.name(),packet);
    $display("number of elements is %d",packet.num());
  end
endmodule
