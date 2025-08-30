module top;
  enum {addr[3:5]=6}packet;
  //um{addr[4]}packet;
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
//num(),name(),frist(),last(),next(),prev() are the methods



