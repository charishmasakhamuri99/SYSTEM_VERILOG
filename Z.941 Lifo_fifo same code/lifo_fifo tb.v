// Code your design here
class lifo_fifo;
  int intQ[$];
  parameter bit lifo=1;//0 means fifo
  function void put(int a);
    intQ.push_back(a);
  endfunction
  function void get(output int a);
    if(lifo) 
      a=intQ.pop_back();   // LIFO
    else   
      a=intQ.pop_front();  // FIFO
  endfunction
endclass

module tb;
  lifo_fifo s=new();
  int num;
  initial begin
    repeat(5)begin
      num=$urandom_range(100,200);
      s.put(num);
      $display("put=%0d",num);
    end
   
    repeat(5)begin
      s.get(num);
      $display("get=%0d",num);
    end
  end
endmodule
//
