//down casting
class ethernet_packet;
  int a;
endclass

class good_eth_pkt extends ethernet_packet;
  int b;
endclass

module top;
  bit y;
  ethernet_packet eth_pkt;
  good_eth_pkt g_pkt;
  initial begin
    eth_pkt=new();
    g_pkt=new();
    $cast(g_pkt,eth_pkt);
    y=$cast(g_pkt,eth_pkt);
    $display("y=%0d",y);
    
  end
endmodule
