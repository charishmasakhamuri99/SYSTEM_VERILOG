class fifo;
  int intQ[$];
  function void put(int a);
    intQ.push_back(a);
  endfunction
  function void get(output int a);
    a=intQ.pop_front();
  endfunction 
endclass

module tb;
  fifo fi=new();
  int num;
  initial begin
    repeat (5) begin
      num=$urandom_range(100,200);
      fi.put(num);
      $display("put num=%0d",num);
    end
    repeat (5) begin
      fi.get(num);
      $display("get num=%0d",num);
    end
  end
endmodule


      
    
      
