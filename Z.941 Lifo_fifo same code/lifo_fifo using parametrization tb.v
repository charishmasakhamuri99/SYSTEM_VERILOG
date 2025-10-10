//lifo and fifo using parametrization
`define lifo 1
`define fifo 0
class lifo_fifo # (bit ds_type);
  int intQ[$];
  function void put (int a);
    intQ.push_back(a);
  endfunction
  function void get (output int a);
    if(ds_type == `lifo ) a= intQ.pop_back();
    if(ds_type == `fifo ) a= intQ.pop_front();
  endfunction
endclass

module tb;
  lifo_fifo #(.ds_type(`fifo)) lifo_i=new();
  int num;
  initial begin
    repeat (5) begin
      num=$urandom_range (100,600);
      lifo_i.put(num);
      $display("Putting num=%0d", num);
    end
    repeat (5) begin
      lifo_i.get(num);
      $display("Getting num=%0d", num);
    end
  end
endmodule
