module tb;
  task one();
    $display("task1 is started at:%0t",$time);
    #20;
    $display("task1 is completed at:%0t",$time);
  endtask
   task two();
     $display("task2 is started at:%0t",$time);
    #10;
     $display("task2 is completed at:%0t",$time);
  endtask
   task three();
     $display("task3 is started at:%0t",$time);
  endtask
  initial begin
    fork
      one();
      two();
    join_none
    three();
  end
endmodule
